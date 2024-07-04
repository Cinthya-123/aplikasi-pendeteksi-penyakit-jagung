import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:aplikasi_pendeteksi_penyakit_jagung/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'single_item_child.dart';


class DaftarRiwayat extends StatefulWidget {
  const DaftarRiwayat({Key? key}) : super(key: key);

  @override
  _DaftarRiwayatState createState() => _DaftarRiwayatState();
}

class Perawatan {
  final String jenis_perawatan;
  final String path;
  final String keterangan;

  Perawatan({required this.jenis_perawatan, required this.path, required this.keterangan});
}


class _DaftarRiwayatState extends State<DaftarRiwayat> {
  List<Map<String, dynamic>> myData = [];
  List<Map<String, dynamic>> imageData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDataFromSharedPreferences();
  }

  Future<void> _loadDataFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String myDataJson = prefs.getString('myData') ?? '[]';
    final String imageDataJson = prefs.getString('imageData') ?? '[]';

    setState(() {
      myData = jsonDecode(myDataJson).cast<Map<String, dynamic>>();
      imageData = jsonDecode(imageDataJson).cast<Map<String, dynamic>>();
      _isLoading = false;
    });
  }

  void _refreshData() async {
    final data = await DatabaseHelper.getData('Penyakit');
    final imgData = await DatabaseHelper.getData('Gambar');

    setState(() {
      myData = data;
      imageData = imgData;
      _isLoading = false;
    });

    // Save data to SharedPreferences
    await saveDataToSharedPreferences();
  }

  Future<void> saveDataToSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('myData', jsonEncode(myData));
    await prefs.setString('imageData', jsonEncode(imageData));
  }

  Widget buildExpansionTile(Perawatan perawatan) {
    return ExpansionTile(
      title: Text(
        perawatan.jenis_perawatan,
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Inter',
          fontSize: 18,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 1,
        ),
      ),
      children: [
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          // height: 127,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(242, 242, 242, 1),
            image: DecorationImage(
              image: AssetImage(perawatan.path),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          perawatan.keterangan,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Inter',
            fontSize: 13,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Riwayat',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(111, 149, 107, 1),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // child: ListView.builder(
        //                 shrinkWrap: true,
        //                 physics: NeverScrollableScrollPhysics(),
        //                 itemCount: imageData.length,
        //                 itemBuilder: (context, index) => Card(
        //                   child: ListTile(
        //                     leading: imageData[index]['path'] != null
        //                         ? Image.file(File(imageData[index]['path']), width: 50, height: 50, fit: BoxFit.cover)
        //                         : null,
        //                     title: Text(imageData[index]['prediksi'] ?? ''),
        //                     subtitle: Text(
        //                       (imageData[index]['deskripsi'] ?? '').length > 75
        //                           ? '${(imageData[index]['deskripsi'] ?? '').substring(0, 75)}...'
        //                           : (imageData[index]['deskripsi'] ?? ''),
        //                     ),
        //                     onTap: () {
        //                       Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                           builder: (context) => SingleItemRiwayat(
        //                             imagePath: imageData[index]['path'],
        //                             namaPenyakit: imageData[index]['prediksi'],
        //                             keterangan: imageData[index]['deskripsi'],
        //                             solusi: imageData[index]['cara'],
        //                           ),
        //                         ),
        //                       );
        //                     },
        //                   ),
        //                 ),
        //               ),

      //  child:SingleChildScrollView(
  child: Container(
 // Atur tinggi maksimal sesuai kebutuhan
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         "Riwayat Diagnosa",
        //         style: TextStyle(
        //           fontSize: 16,
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold
        //         ),
        //       ),
        //       TextButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => DaftarRiwayat(),
        //             ),
        //           );
        //         },
        //         child: Row(
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             Text(
        //               "Lihat Semua",
        //               style: TextStyle(
        //                 fontSize: 12,
        //                 color: Color.fromARGB(255, 47, 47, 47),
        //                 fontWeight: FontWeight.w200,
        //               ),
        //             ),
        //             SizedBox(width: 3), // Sesuaikan spasi sesuai kebutuhan
        //             Icon(Icons.arrow_forward_ios, size: 12, color: Color.fromARGB(255, 47, 47, 47)),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                imageData.length,
                (index) => Card(
                  child: ListTile(
                    leading: imageData[index]['path'] != null
                        ? Image.file(File(imageData[index]['path']), width: 50, height: 50, fit: BoxFit.cover)
                        : null,
                    title: Text(imageData[index]['prediksi'] ?? ''),
                    subtitle: Text(
                      (imageData[index]['deskripsi'] ?? '').length > 75
                          ? '${(imageData[index]['deskripsi'] ?? '').substring(0, 75)}...'
                          : (imageData[index]['deskripsi'] ?? ''),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleItemRiwayat(
                            imagePath: imageData[index]['path'],
                            namaPenyakit: imageData[index]['prediksi'],
                            keterangan: imageData[index]['deskripsi'],
                            solusi: imageData[index]['cara'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ).reversed.toList(), // Menampilkan list secara descending
            ),
          ),
        ),
      ],
    ),
  ),
)
                            
      );
    // );
  }
}

class SingleItemRiwayat extends StatelessWidget {
  final String imagePath;
  final String namaPenyakit;
  final String keterangan;
  final String solusi;

  SingleItemRiwayat({
    required this.imagePath,
    required this.namaPenyakit,
    required this.keterangan,
    required this.solusi,
  });

  @override
  Widget build(BuildContext context) {
    // Memisahkan solusi berdasarkan bullet points
    List<String> solusiList = solusi.split('•').where((element) => element.trim().isNotEmpty).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat diagnosa',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(111, 149, 107, 1),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: EdgeInsets.only(left: 25, right: 40),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         namaPenyakit,
                //         style: TextStyle(
                //           fontSize: 22,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Center(
                  child: Image.file(
                    File(imagePath),
                    width: MediaQuery.of(context).size.width / 1.2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 40, top: 20),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hasil Prediksi: ',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        ),
                        TextSpan(
                          text: namaPenyakit,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                        "Deskripsi Penyakit:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),),
                      Text(
                        keterangan,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Solusi",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: solusiList.map((solusiItem) => Padding(
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
                                  solusiItem.trim(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
