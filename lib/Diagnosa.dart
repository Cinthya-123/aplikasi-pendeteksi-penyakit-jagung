import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:sklite/SVM/SVM.dart';
import 'package:sklite/utils/io.dart';
import 'homepage.dart';
import 'single_item_child.dart';
import 'Hama&Penyakit.dart';
import 'main.dart';
import '../models/gambar.dart';
import 'DataJagung.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database_helper.dart';

class Diagnosa extends StatefulWidget {
  const Diagnosa({Key? key}) : super(key: key);

  @override
  State createState() => DiagnosaState();
}

class DiagnosaState extends State<Diagnosa> {
  File? galleryFile;
  final picker = ImagePicker();
  String prediksi = '';
  String deskripsi = '';
  String gambar = "";
  String cara = '';
  String nama = '';
  SVC? svc;
  List<List<dynamic>>? csvData;
  late List<List<int>> histR = [];
  late List<List<int>> matrixR = [];
  List<int> lbpFeatures = [];
   List<int> colorFeatures =[]; 

  final dataJagung _dataJagung = dataJagung();

  Future<List<int>> loadLBPFeatures(String path) async {
  String jsonString = await rootBundle.loadString(path);
  List<dynamic> lbpFeaturesDynamic = json.decode(jsonString);
  List<int> lbpFeatures = lbpFeaturesDynamic.map((item) => (item as num).toInt()).toList();
  return lbpFeatures;
}


  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  Future<void> _loadModel() async {
    // String modelData = await loadModel("assets/model/model_fixxx.json");
    String modelData = await loadModel("assets/model/model_84.json");
    setState(() {
      svc = SVC.fromMap(json.decode(modelData));
    });
    List<int> loadedLBPFeatures = await loadLBPFeatures("assets/model/lbp_features.json");
    setState(() {
      lbpFeatures = loadedLBPFeatures;
    });
  //   List<int> loadedColorFeatures = await loadColorFeatures("assets/model/color_features.json");
  // setState(() {
  //   colorFeatures = loadedColorFeatures;
  // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnosa Penyakit', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(111, 149, 107, 1),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Tentang Aplikasi',
                children: [
                  Text('Proses deteksi penyakit tanaman jagung pada aplikasi ini menggunakan algoritma Support Vector Machine (SVM) dan Fitur LBP dan histogram sebagai ekstraksi fitur tekstur dan warna.'),
                ],
              );
            },
          ),
        ],
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(111, 149, 107, 1)),
                  ),
                  child: const Text('Pilih Gambar dari Galeri atau Kamera', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    _showPicker(context: context);
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200.0,
                  width: 300.0,
                  child: galleryFile == null
                      ? Card(child: Center(child: Text('Maaf anda belum memilih gambar')))
                      : Center(child: Image.file(galleryFile!)),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (galleryFile != null) {
                      if (prediksi != 0) {
                        _showResultSheet(context);
                      }
                    }
                  },
                  child: const Text('Periksa'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showPicker({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galeri'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Kamera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> getImage(ImageSource img) async {
    final pickedFile = await picker.pickImage(source: img);
    setState(() {
      if (pickedFile != null) {
        galleryFile = File(pickedFile.path);
        if (svc != null) {
          _extractRGB(galleryFile!);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nothing is selected')),
        );
      }
    });
  }

void _extractRGB(File galleryFile) async {
  List<String> categories = ['Bercak daun', 'Hawar Daun', 'Sehat', 'Ulat grayak'];
  //proses dekode untuk mengakses pixel
  img.Image? image = img.decodeImage(await galleryFile.readAsBytes());
  img.Image resizedImage = img.copyResize(image!, width: 200, height: 200);

  // Convert the image to grayscale
  img.Image imageGray = img.grayscale(resizedImage);

  img.Image rgbImage = img.decodeImage(await galleryFile.readAsBytes())!;

  List<int> r = [];
  List<int> g = [];
  List<int> b = [];
// iterasi melalui setiap baris (tinggi gambar).
  for (int y = 0; y < rgbImage.height; y++) {
    for (int x = 0; x < rgbImage.width; x++) {
      int pixel = rgbImage.getPixel(x, y);
      r.add(img.getRed(pixel));
      g.add(img.getGreen(pixel));
      b.add(img.getBlue(pixel));
    }
  }
//menghitung histogram setiap komponen
  List<int> histR = _calculateHistogram(r);
  List<int> histG = _calculateHistogram(g);
  List<int> histB = _calculateHistogram(b);

  List<int> colorFeatures = [...histR, ...histG, ...histB];
  List<int> combinedFeatures = [...lbpFeatures, ...colorFeatures];
        
  if (svc != null) {
    List<double> features = combinedFeatures.map((value) => value.toDouble()).toList();
    int prediction = svc!.predict(features);
    String predictedCategory = categories[prediction];
    setState(() {
      this.prediksi = predictedCategory;
    });

    final diseaseData = _dataJagung.getDataByName(prediksi);

    if (diseaseData != null) {
      setState(() {
        nama = diseaseData['Nama_penyakit'];
        deskripsi = diseaseData['Keterangan_penyakit'];
        cara = diseaseData['Cara_mengatasi'];
        gambar = diseaseData['path'];
      });

      int result = await DatabaseHelper.insertData('Riwayat_diagnosa', {
        'path': galleryFile.path,
        'prediksi': nama,
        'deskripsi': deskripsi,
        'cara': cara,
      });
    }
  }
}

  List<int> _calculateHistogram(List<int> channel) {
    List<int> histogram = List.filled(256, 0);
    for (int value in channel) {
      histogram[value]++;
    }
    return histogram;
  }

void _showResultSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          // Assuming 'nama' is the name of the disease, 'gambar' is the path to the image, 'deskripsi' is the description of the disease, and 'cara' is the solution list.
          final diseaseData = dataJagung().getDataByName(nama);
          final caraList = (diseaseData['Cara_mengatasi'] as String).split('•').where((s) => s.trim().isNotEmpty).toList();

          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the bottom sheet
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Image.file(galleryFile!, height: 200,
                     width: 200),
                  // Text(
                  //   'Hasil Prediksi:',
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  // ),
                  // Text(
                  //   diseaseData['Nama_penyakit'],
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  // ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hasil Prediksi: ',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
                        ),
                        TextSpan(
                          text: diseaseData['Nama_penyakit'],
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Deskripsi Penyakit:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(diseaseData['Keterangan_penyakit']),
                  Text(
                    'Cara Mengatasi:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: caraList.map((cara) {
                  //     return ListTile(
                  //       leading: Text('•'),
                  //       title: Text(cara.trim()),
                  //     );
                  //   }).toList(),
                  // ),
                  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: caraList.map((cara) => Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "• ",
                                style: TextStyle(fontSize: 13),
                              ),
                              Expanded(
                                child: Text(
                                  cara.trim(),
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        )).toList(),
                      ),
                    
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

}