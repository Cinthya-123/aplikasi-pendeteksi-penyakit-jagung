import 'dart:convert';
import 'dart:io';
import 'package:aplikasi_pendeteksi_penyakit_jagung/DaftarRiwayat.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Diagnosa.dart';
import 'Hama&Penyakit.dart';
import 'Tips_perawatan.dart';
import 'database_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> myData = [];
  List<Map<String, dynamic>> imageData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDataFromSharedPreferences();
    _refreshData();
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
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _refreshData();
  }

  Future<void> _refreshData() async {
    final data = await DatabaseHelper.getData('Penyakit');
    final imgData = await DatabaseHelper.getData('Riwayat_diagnosa');

    setState(() {
      myData = data;
      imageData = imgData;
      _isLoading = false;
    });

    // Save data to SharedPreferences
    await saveDataToSharedPreferences();
  }

  // void _refreshData() async {
  //   final data = await DatabaseHelper.getData('Penyakit');
  //   final imgData = await DatabaseHelper.getData('Gambar');

  //   setState(() {
  //     myData = data;
  //     imageData = imgData;
  //     _isLoading = false;
  //   });

  //   // Save data to SharedPreferences
  //   await saveDataToSharedPreferences();
  // }

  Future<void> saveDataToSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('myData', jsonEncode(myData));
    await prefs.setString('imageData', jsonEncode(imageData));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 285,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/dried-corn-background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 285,
                  color: Colors.black.withOpacity(0.80),
                ),
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Periksa Tanaman Jagung Anda",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Align(
                              alignment: Alignment.centerLeft,
                            child: Text(
                              "Tingkatkan Produktivitas dengan Perawatan Tepat",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),),),
                             SizedBox(height: 16),
                            Padding(
                            padding: const EdgeInsets.only(left: 12),
                           child: Align(
                              alignment: Alignment.centerLeft,
                            child: Container(
                              width: 165,
                              height: 33,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      // builder: (context) => Diagnosa(),
                                      builder: (context) => Diagnosa(),
                                    ),
                                  ).then((_) {
                                    // Refresh data after returning from Diagnosa
                                    _refreshData();
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.photo_camera, color: Color(0xFF253226)),
                                    SizedBox(width: 6),
                                    Text(
                                      "Diagnosa",
                                      style: TextStyle(color: Color(0xFF253226), fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ),),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,                        
                        child: Image.asset(
                          'assets/image/hand-corn 2.png',
                          width: 300,
                          height: 300,
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black26,
                //     offset: Offset(0, -1),
                //     blurRadius: 10,
                //   ),
                // ],
              ),
              constraints: BoxConstraints(
                minHeight: 480,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Fitur Lainnya",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TipsPerawatan(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          maximumSize: Size(146, 87),
                          backgroundColor: Color.fromRGBO(183, 210, 180, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Image.asset(
                                    'assets/image/gambar-tanaman.png',
                                    width: 40,
                                    height: 60,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    'Tips Perawatan',
                                    style: TextStyle(fontSize: 14, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HamaPenyakit(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          maximumSize: Size(146, 87),
                          backgroundColor: Color.fromRGBO(245, 208, 109, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Image.asset(
                                    'assets/image/Slugeating.png',
                                    width: 50,
                                    height: 60,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(
                                  width: 70,
                                  child: Text(
                                    'Hama & Penyakit',
                                    style: TextStyle(fontSize: 14, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                //   Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //      Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 16),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             "Riwayat Diagnosa",
                //             style: TextStyle(
                //               fontSize: 16,
                //               color: Colors.black,
                //               fontWeight: FontWeight.bold
                //             ),
                //           ),
                //           TextButton(
                //           onPressed: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => DaftarRiwayat(),
                //               ),
                //             );
                //           },
                //           child: Row(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               Text(
                //                 "Lihat Semua",
                //                 style: TextStyle(
                //                   fontSize: 12,
                //                   color: Color.fromARGB(255, 47, 47, 47),
                //                   fontWeight: FontWeight.w200,
                //                 ),
                //               ),
                //               SizedBox(width: 3), // Adjust the spacing as needed
                //               Icon(Icons.arrow_forward_ios, size: 12, color: Color.fromARGB(255, 47, 47, 47)),
                //             ],
                //           ),
                //         ),
                //         ],
                //       ),
                //     ),

                //       ListView.builder(
                //         shrinkWrap: true,
                //         physics: NeverScrollableScrollPhysics(),
                //         itemCount: imageData.length,
                //         itemBuilder: (context, index) => Card(
                //           // color: Colors.white,
                //           child: ListTile(
                //             leading: imageData[index]['path'] != null
                //                 ? Image.file(File(imageData[index]['path']), width: 50, height: 50, fit: BoxFit.cover)
                //                 : null,
                //             title: Text(imageData[index]['prediksi'] ?? ''),
                //             subtitle: Text(
                //               (imageData[index]['deskripsi'] ?? '').length > 75
                //                   ? '${(imageData[index]['deskripsi'] ?? '').substring(0, 75)}...'
                //                   : (imageData[index]['deskripsi'] ?? ''),
                //             ),
                //             onTap: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) => SingleItemScreen(
                //                     imagePath: imageData[index]['gambar_penyakit'],
                //                     namaPenyakit: imageData[index]['prediksi'],
                //                     keterangan: imageData[index]['deskripsi'],
                //                     solusi: imageData[index]['cara'],
                //                   ),
                //                 ),
                //               );
                //             },
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                SingleChildScrollView(
  child: Container(
    height: MediaQuery.of(context).size.height * 0.6, // Atur tinggi maksimal sesuai kebutuhan
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Riwayat Diagnosa",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DaftarRiwayat(),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Lihat Semua",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 47, 47, 47),
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(width: 3), // Sesuaikan spasi sesuai kebutuhan
                    Icon(Icons.arrow_forward_ios, size: 12, color: Color.fromARGB(255, 47, 47, 47)),
                  ],
                ),
              ),
            ],
          ),
        ),
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
                 ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
