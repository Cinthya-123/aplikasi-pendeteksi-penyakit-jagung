import 'package:flutter/material.dart';
import 'diagnosa.dart';

class SingleItemScreen extends StatelessWidget {
  final String imagePath;
  final String namaPenyakit;
  final String keterangan;
  final String solusi;

  SingleItemScreen({
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
          'Hama & Penyakit',
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
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        namaPenyakit,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: Image.asset(
                    imagePath,
                    width: MediaQuery.of(context).size.width / 1.2,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          fontSize: 13,
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


// import 'package:flutter/material.dart';
// import 'diagnosa.dart';

// class SingleItemScreen extends StatelessWidget {
//   final String imagePath;
//   final String namaPenyakit;
//   final String keterangan;
//   final String solusi;

//   SingleItemScreen({
//     required this.imagePath,
//     required this.namaPenyakit,
//     required this.keterangan,
//     required this.solusi,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Hama & Penyakit',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color.fromRGBO(111, 149, 107, 1),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           // child: Padding(
//             // padding: EdgeInsets.only(top: 30, bottom: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Padding(
//                 //   padding: EdgeInsets.only(left: 25),
//                 //   child: InkWell(
//                 //     onTap: () {
//                 //       Navigator.pop(context);
//                 //     },
//                 //     child: Icon(
//                 //       Icons.arrow_back_ios_new,
//                 //       color: Colors.black,
//                 //     ),
//                 //   ),
//                 // ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: EdgeInsets.only(left: 25, right: 40),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         namaPenyakit,
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 Center(
//                   child: Image.asset(
//                     imagePath,
//                     width: MediaQuery.of(context).size.width / 1.2,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: EdgeInsets.only(left: 25, right: 40),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         keterangan,
//                         style: TextStyle(
//                           fontSize: 13,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       const Text(
//                         "Solusi",
//                         style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.bold
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         solusi,
//                         style: TextStyle(
//                           fontSize: 13,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     // );
//   }
// }
