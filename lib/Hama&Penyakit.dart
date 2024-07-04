// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'single_item_child.dart';
// import 'main.dart';
// import 'package:aplikasi_pendeteksi_penyakit_jagung/database_helper.dart';

// class HamaPenyakit extends StatefulWidget {
//   const HamaPenyakit({Key? key}) : super(key: key);

//   @override
//   _HamaPenyakitState createState() => _HamaPenyakitState();
// }
// class PenyakitData {
//   final String nama;
//   final String path;
//   final String keterangan;
//   final String solusi;

//   PenyakitData({required this.nama, required this.path, required this.keterangan, required this.solusi});
// }

// List<PenyakitData> daftarPenyakit = [
//   PenyakitData(
//     nama: 'Blight',
//     path: 'assets/image/Hama&Penyakit/Corn_Blight (446).JPG',
//     keterangan: 'Gejala penyakit pada tanaman jagung ini bisa dilihat pada bagian daun. Awalnya, akan terlihat bercak kecil berbentuk oval dan basah pada daun jagung. Seiring berjalannya waktu, gejala berubah menjadi bercak memanjang.',
//     solusi: 'Solusi 1',
//   ),
//   PenyakitData(
//     nama: 'Common_rust',
//     path: 'assets/image/Corn_Common_Rust (155).JPG',
//     keterangan: 'Gejala penyakit pada tanaman jagung ini bisa dilihat pada bagian daun. Awalnya, akan terlihat bercak kecil berbentuk oval dan basah pada daun jagung. Seiring berjalannya waktu, gejala berubah menjadi bercak memanjang.',
//     solusi: 'Solusi 2',
//   ),
//   PenyakitData(
//     nama: 'Healthy',
//     path: 'assets/image/Hama&Penyakit/Corn_Blight (446).JPG',
//     keterangan: 'Gejala penyakit pada tanaman jagung ini bisa dilihat pada bagian daun. Awalnya, akan terlihat bercak kecil berbentuk oval dan basah pada daun jagung. Seiring berjalannya waktu, gejala berubah menjadi bercak memanjang.',
//     solusi: 'Solusi 1',
//   ),
//   PenyakitData(
//     nama: 'Hawar Daun',
//     path: 'assets/image/Hama&Penyakit/Corn_Blight (446).JPG',
//     keterangan: 'Gejala daun hijau keabuan atau coklat layaknya terbakar dan mengering, hawar juga muncul pada klobot jagung, biasanya muncul pada saat tanaman berumur 14 hari dan dapat menyerang jagung dari fase vegetatif hingga masa panen. Penyakit ini disebabkan oleh jamur dari genus Helminthosporium.',
//     solusi: 'Melakukan sanitasi lahan dengan membersihkan tanaman sakit dan inang, Menggunakan varietas jagung yang tahan terhadap penyakit, seperti C-4, C-8, C-9, Andalas 4, P2, P10, P11, P14, P17, P19, P29, N 35, PAC 224, PAC 759, dan BIMA-8, Mengatur waktu tanam untuk menghindari musim penghujan yang memicu kondisi yang baik bagi patogen penyebab penyakit ini, Menyusun jarak tanam yang tepat agar tidak terlalu rapat, sehingga menciptakan lingkungan mikro yang tidak sesuai untuk perkembangan penyakit.',
//   ),
//    PenyakitData(
//     nama: 'Bercak Daun',
//     path: 'assets/image/Hama&Penyakit/Corn_Gray_Spot (2).jpg',
//     keterangan: 'Gejala penyakit pada tanaman jagung umumnya terlihat pada daun. Awalnya muncul bercak kecil berbentuk oval yang basah. Seiring waktu, bercak ini memanjang dan mengering, berubah menjadi elips dengan warna hijau keabu-abuan atau coklat, dan panjangnya sekitar 2,5-15 sentimeter. Bercak biasanya muncul terlebih dahulu pada daun tua, lalu menyebar ke daun muda. Infeksi yang parah dapat menyebabkan tanaman mati dengan cepat.',
//     solusi: 'Rotasi tanaman untuk memutus daur hidup hama, Pengolahan tanah yang baik (selama 1 bulan) untuk mengangkat kepompong hama dari dalam tanah agar mati terjemur oleh sinar matahari, Pemasangan perangkap berferomon yaitu feromon Exi sebanyak 20 buah per hektar, Penyemprotan insektisida jika kerusakan daun telah mencapai 5%, Pemasangan lampu perangkap sebanyak 30 buah per hektar, Penyemprotan insektisida jika populasi kelompok telur telah mencapai 1 kelompok atau 10 tanaman',
//   ),
//   PenyakitData(
//     nama: 'Ulat Grayak (Spodoptera litura)',
//     path: 'assets/image/Hama&Penyakit/Ulat grayak.jpg',
//     keterangan: 'Ulat grayak umumnya menyerang pada malam hari, sedangkan pada siang hari ulat ini bersembunyi di bawah tanaman, mulsa, atau dalam tanah. Siklus hidup ulat grayak dapat berlangsung 32-46 hari.',
//     solusi: 'Rotasi tanaman untuk memutus daur hidup hama, Pengolahan tanah yang baik (selama 1 bulan) untuk mengangkat kepompong hama dari dalam tanah agar mati terjemur oleh sinar matahari, Pemasangan perangkap berferomon yaitu feromon Exi sebanyak 20 buah per hektar, Penyemprotan insektisida jika kerusakan daun telah mencapai 5%, Pemasangan lampu perangkap sebanyak 30 buah per hektar, Penyemprotan insektisida jika populasi kelompok telur telah mencapai 1 kelompok atau 10 tanaman',
//   ),
//   PenyakitData(
//     nama: 'Spodoptera Frugiperda',
//     path: 'assets/image/Hama&Penyakit/spodoptera frugiperda.png',
//     keterangan: 'Kepala terdapat garis menyerupai huruf Y terbalik, Abdomen segmen 8 terdapat empat bitnik besar, Terdapat 3 garis pada bagian atas tubuh, Garis tebal seperti pita pada lateral tubuh',
//     solusi: ' ',
//   ),
//   PenyakitData(
//     nama: 'Bulai',
//     path: 'assets/image/Hama&Penyakit/bulai.png',
//     keterangan: 'Penyakit bulai pada tanaman jagung sering ditandai dengan adanya daun yang berwarna kuning keputih-putihan. Tanaman jagung yang terinfeksi penyakit ini akan mengalami gangguan dalam pertumbuhanya, tanaman akan kerdil dan tidak mampu berproduksi sama sekali. Penyakit bulai ini disebabkan kelompok organisme cendawan palsu dan protista mirip cendawan. Berasal dari spesies Peronosclerospora maydis, P. sorghi, dan P. philippinensis. Parasit obligat ini tidak dapat tumbuh pada media buatan atau pada tanaman yang sudah busuk atau mati. ',
//     solusi: 'Menggunakan benih sehat, menghindari penanaman di area yang terserang, perlakuan Plant Growth Promoting Rhizobakteri (PGPR) untuk kebugaran tanaman dan penanaman serempak. Tindakan preventif pada 30-45 HST dengan penyemprotan ekstrak bawang putih atau mimba, atau kompos. Bisa juga dengan fungsida berbahan aktif tembaga',
//   ),
//   PenyakitData(
//     nama: 'Lalat Bibit',
//     path: 'assets/image/Hama&Penyakit/lalat bibit.png',
//     keterangan: 'Serangan awal lalat bibit jagung dimulai saat imago meletekakkan telur di tanaman, setelah menetas, larvanya akan segera melubangi batang jagung dan membuat semacam terowongan hingga ke dasar batang atau titik tumbuh tanaman. Serangan berat akan membuat tanaman menjadi kuning dan akhirnya mati.',
//     solusi: ' ',
//   ),
//   PenyakitData(
//     nama: 'Penggerek Batang Jagung',
//     path: 'assets/image/Hama&Penyakit/penggerek.png',
//     keterangan: 'Gejala kerusakan yang ditimbulkan adalah adanya liang-liang gerekan pada batang yang dibatasi oleh buku. Jika dilihat lebih jauh ke dalam lubang gerek, terdapat serbuk-serbuk gerek berwarna cokelat. Terdapat liang gerek pada batang dapat menyebabkan batang tersebut mudah patah atau roboh.',
//     solusi: ' ',
//   ),
//   PenyakitData(
//     nama: 'Penggerek Tongkol Jagung',
//     path: 'assets/image/Hama&Penyakit/penggerek tongkol.png',
//     keterangan: 'Muncul di tanaman jagung pada umur 45-56 HST, bersamaan dengan munculnya rambut-rambut pada tongkol jagung, larva masuk ke dalam tongkol muda dan memakan biji-biji jagung, karena larva hidup di dalam tongkol, dan menggerek ujung tongkol.',
//     solusi: ' ',
//   ),

// ];


// class _HamaPenyakitState extends State<HamaPenyakit> {
//   List<Map<String, dynamic>> myData = [];
//   List<Map<String, dynamic>> imageData = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _addInitialData(); // Menambahkan data awal
//     _refreshData(); // Memuat data saat aplikasi dimulai
//   }

//   void _addInitialData() async {
//   final existingData = await DatabaseHelper.getData('Penyakit');
  
//   if (existingData.isEmpty) {
//     for (var penyakitData in daftarPenyakit) {
//       await DatabaseHelper.insertData('Penyakit', {
//         'nama': penyakitData.nama,
//         'path': penyakitData.path,
//         'keterangan': penyakitData.keterangan,
//         'solusi': penyakitData.solusi,
//       });
//     }
//   }
  
//   _refreshData();
// }

// //   void _addInitialData() async {
// //   for (var penyakitData in daftarPenyakit) {
// //     await DatabaseHelper.insertData('Penyakit', {
// //       'nama': penyakitData.nama,
// //       'keterangan': penyakitData.keterangan,
// //       'solusi': penyakitData.solusi,
// //     });
// //   }
// //   _refreshData();
// // }

// Future<void> _refreshData() async {
//   final data = await DatabaseHelper.getData('Penyakit');
//   final imgData = await DatabaseHelper.getData('Gambar');
//   setState(() {
//     myData = data;
//     imageData = imgData;
//     _isLoading = false;
//   });
//   debugPrint('Data refreshed: $myData');
//   debugPrint('Image Data refreshed: $imageData');
// }

//   // void _refreshData() async {
//   //   final data = await DatabaseHelper.getData('Penyakit');
//   //   setState(() {
//   //     myData = data;
//   //     _isLoading = false;
//   //   });
//   //   debugPrint('Data refreshed: $myData');
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Hama & Penyakit',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: Color.fromRGBO(74, 105, 66, 1),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: myData.map((penyakit) {
//                   return Penyakit(
//                     // imagePath: 'assets/image/Corn_Blight (446).JPG',
//                     imagePath: penyakit['path'],
//                     namaPenyakit: penyakit['nama'],
//                     keterangan: penyakit['keterangan'],
//                     solusi: penyakit['solusi'],
//                   );
//                 }).toList(),
//               ),
//             ),
//     );
//   }
// }

// class Penyakit extends StatelessWidget {
//   final String imagePath;
//   final String namaPenyakit;
//   final String keterangan;
//   final String solusi;

//   const Penyakit({
//     super.key,
//     required this.imagePath,
//     required this.namaPenyakit,
//     required this.keterangan,
//     required this.solusi,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 240,
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => SingleItemScreen(
//                 imagePath: imagePath,
//                 namaPenyakit: namaPenyakit,
//                 keterangan: keterangan,
//                 solusi: solusi,
//               ),
//             ),
//           );
//         },
//         child: Card(
//           clipBehavior: Clip.antiAliasWithSaveLayer,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           elevation: 10,
//           child: Column(
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 height: 150,
//                 child: Image.asset(
//                   imagePath,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       namaPenyakit,
//                       style: TextStyle(
//                         fontSize: 17,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     // SizedBox(height: 4),
//                     // Text(
//                     //   "Penyakit",
//                     //   style: TextStyle(
//                     //     fontSize: 12,
//                     //     color: Color.fromRGBO(57, 57, 57, 1),
//                     //     fontWeight: FontWeight.w300,
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'single_item_child.dart';
import 'main.dart';
import 'package:aplikasi_pendeteksi_penyakit_jagung/database_helper.dart';

class HamaPenyakit extends StatefulWidget {
  const HamaPenyakit({Key? key}) : super(key: key);

  @override
  _HamaPenyakitState createState() => _HamaPenyakitState();
}
class PenyakitData {
  final String nama;
  final String path;
  final String keterangan;
  final String solusi;

  PenyakitData({required this.nama, required this.path, required this.keterangan, required this.solusi});
}

List<PenyakitData> daftarPenyakit = [
  // PenyakitData(
  //   nama: 'Blight',
  //   path: 'assets/image/Hama&Penyakit/Corn_Blight (446).JPG',
  //   keterangan: 'Gejala penyakit pada tanaman jagung ini bisa dilihat pada bagian daun. Awalnya, akan terlihat bercak kecil berbentuk oval dan basah pada daun jagung. Seiring berjalannya waktu, gejala berubah menjadi bercak memanjang.',
  //   solusi: 'Solusi 1',
  // ),
  // PenyakitData(
  //   nama: 'Common_rust',
  //   path: 'assets/image/Corn_Common_Rust (155).JPG',
  //   keterangan: 'Gejala penyakit pada tanaman jagung ini bisa dilihat pada bagian daun. Awalnya, akan terlihat bercak kecil berbentuk oval dan basah pada daun jagung. Seiring berjalannya waktu, gejala berubah menjadi bercak memanjang.',
  //   solusi: 'Solusi 2',
  // ),
  // PenyakitData(
  //   nama: 'Healthy',
  //   path: 'assets/image/Hama&Penyakit/Corn_Blight (446).JPG',
  //   keterangan: 'Gejala penyakit pada tanaman jagung ini bisa dilihat pada bagian daun. Awalnya, akan terlihat bercak kecil berbentuk oval dan basah pada daun jagung. Seiring berjalannya waktu, gejala berubah menjadi bercak memanjang.',
  //   solusi: 'Solusi 1',
  // ),
  PenyakitData(
    nama: 'Hawar Daun',
    path: 'assets/image/Hama&Penyakit/Corn_Blight (446).JPG',
    keterangan: 'Gejala daun hijau keabuan atau coklat layaknya terbakar dan mengering, hawar juga muncul pada klobot jagung, biasanya muncul pada saat tanaman berumur 14 hari dan dapat menyerang jagung dari fase vegetatif hingga masa panen. Penyakit ini disebabkan oleh jamur dari genus Helminthosporium.',
    solusi: '• Melakukan sanitasi lahan dengan membersihkan tanaman sakit dan inang. • Menggunakan varietas jagung yang tahan terhadap penyakit, seperti C-4, C-8, C-9, Andalas 4, P2, P10, P11, P14, P17, P19, P29, N 35, PAC 224, PAC 759, dan BIMA-8. • Mengatur waktu tanam untuk menghindari musim penghujan yang memicu kondisi yang baik bagi patogen penyebab penyakit ini. • Menyusun jarak tanam yang tepat agar tidak terlalu rapat, sehingga menciptakan lingkungan mikro yang tidak sesuai untuk perkembangan penyakit.',
  ),
   PenyakitData(
    nama: 'Bercak daun',
    path: 'assets/image/Hama&Penyakit/Corn_Gray_Spot (2).jpg',
    keterangan: 'Gejala penyakit pada tanaman jagung umumnya terlihat pada daun. Awalnya muncul bercak kecil berbentuk oval yang basah. Seiring waktu, bercak ini memanjang dan mengering, berubah menjadi elips dengan warna hijau keabu-abuan atau coklat, dan panjangnya sekitar 2,5-15 sentimeter. Bercak biasanya muncul terlebih dahulu pada daun tua, lalu menyebar ke daun muda. Infeksi yang parah dapat menyebabkan tanaman mati dengan cepat.',
    solusi: '• Rotasi tanaman untuk memutus daur hidup hama. • Pengolahan tanah yang baik (selama 1 bulan) untuk mengangkat kepompong hama dari dalam tanah agar mati terjemur oleh sinar matahari. • Pemasangan perangkap berferomon yaitu feromon Exi sebanyak 20 buah per hektar. • Penyemprotan insektisida jika kerusakan daun telah mencapai 5%. • Pemasangan lampu perangkap sebanyak 30 buah per hektar. • Penyemprotan insektisida jika populasi kelompok telur telah mencapai 1 kelompok atau 10 tanaman',
  ),
  PenyakitData(
    nama: 'Ulat grayak',
    path: 'assets/image/Hama&Penyakit/Ulat grayak.jpg',
    keterangan: 'Ulat grayak umumnya menyerang pada malam hari, sedangkan pada siang hari ulat ini bersembunyi di bawah tanaman, mulsa, atau dalam tanah. Siklus hidup ulat grayak dapat berlangsung 32-46 hari.',
    solusi: '• Lakukan pemungutan dan pemusnahan ulat grayak secara manual jika populasinya masih sedikit. • Gunakan insektisida nabati seperti daun neem, bawang putih, atau cabai untuk mengendalikan hama. • Gunakan insektisida kimia secara selektif dan sesuai dengan dosis yang dianjurkan jika serangan hama sudah parah. • Gunakan biopestisida seperti Bacillus thuringiensis (Bt) yang aman bagi manusia dan lingkungan untuk mengendalikan hama.',
  ),
  PenyakitData(
    nama: 'Bulai',
    path: 'assets/image/Hama&Penyakit/bulai.png',
    keterangan: 'Penyakit bulai pada tanaman jagung sering ditandai dengan adanya daun yang berwarna kuning keputih-putihan. Tanaman jagung yang terinfeksi penyakit ini akan mengalami gangguan dalam pertumbuhanya, tanaman akan kerdil dan tidak mampu berproduksi sama sekali. Penyakit bulai ini disebabkan kelompok organisme cendawan palsu dan protista mirip cendawan. Berasal dari spesies Peronosclerospora maydis, P. sorghi, dan P. philippinensis. Parasit obligat ini tidak dapat tumbuh pada media buatan atau pada tanaman yang sudah busuk atau mati. ',
    solusi: '• Menggunakan benih sehat • Menghindari penanaman di area yang terserang • Perlakuan Plant Growth Promoting Rhizobakteri (PGPR) untuk kebugaran tanaman dan penanaman serempak. • Tindakan preventif pada 30-45 HST dengan penyemprotan ekstrak bawang putih atau mimba, atau kompos. Bisa juga dengan fungsida berbahan aktif tembaga',
  ),
  PenyakitData(
    nama: 'Lalat Bibit',
    path: 'assets/image/Hama&Penyakit/lalat bibit.png',
    keterangan: 'Serangan awal lalat bibit jagung dimulai saat imago meletekakkan telur di tanaman, setelah menetas, larvanya akan segera melubangi batang jagung dan membuat semacam terowongan hingga ke dasar batang atau titik tumbuh tanaman. Serangan berat akan membuat tanaman menjadi kuning dan akhirnya mati.',
    solusi: '•	Ubah waktu tanam untuk menghindari serangan lalat bibit yang aktif selama 1-2 bulan pada musim hujan. •	Gunakan varietas tanaman yang resisten dan berikan perlakuan benih melalui tanah atau kuncup daun saat tanaman berumur satu minggu dengan dosis 0,24 kg b.a/ha. •	Gunakan parasitoid seperti Trichogramma spp untuk memarasit telur dan SP untuk memarasit larva. Tempelkan kertas pias yang telah terparasit pada bambu dan sebarkan dengan jarak antar pias 15-20 meter. •	Gunakan insektisida seperti Thiodikrab dengan dosis 7,5-15 gr/kg benih atau karburatan dengan dosis 6 gr b.a/kg benih. Setelah tanaman berumur 5-7 hari, semprot dengan karbofuran dosis 0,2 kg b.a/ha atau Thiodikrab 0,75 b.a/ha.',
  ),
  PenyakitData(
    nama: 'Penggerek Batang Jagung',
    path: 'assets/image/Hama&Penyakit/penggerek.png',
    keterangan: 'Gejala kerusakan yang ditimbulkan adalah adanya liang-liang gerekan pada batang yang dibatasi oleh buku. Jika dilihat lebih jauh ke dalam lubang gerek, terdapat serbuk-serbuk gerek berwarna cokelat. Terdapat liang gerek pada batang dapat menyebabkan batang tersebut mudah patah atau roboh.',
    solusi: '•	Tanam pada waktu yang tepat dan lakukan tumpang sari dengan tanaman lain. •	Lakukan rotasi tanaman dan musnahkan tanaman yang terserang. •	Ganti tanaman dengan yang bukan inang bagi hama untuk menghilangkan tempat tinggal hama. •	Gunakan gulma rumput-rumputan berbatang tebal sebagai inang agar hama tidak menyerang jagung. •	Manfaatkan musuh alami (MA) seperti semut hitam yang banyak dijumpai di tanaman jagung, jeruk, kakao, kopi, mangga, dan kedelai. •	Semut hitam efektif menyerang ulat dan beberapa jenis hama lainnya. •	Gunakan insektisida yang efektif.',
  ),
  PenyakitData(
    nama: 'Penggerek Tongkol Jagung',
    path: 'assets/image/Hama&Penyakit/penggerek tongkol.png',
    keterangan: 'Muncul di tanaman jagung pada umur 45-56 HST, bersamaan dengan munculnya rambut-rambut pada tongkol jagung, larva masuk ke dalam tongkol muda dan memakan biji-biji jagung, karena larva hidup di dalam tongkol, dan menggerek ujung tongkol.',
    solusi: '•	Pengolahan tanah (membajak tanah) sehingga merusak pupa yang berada di dalam tanah, dan dapat mengurangi populasi H. armigera berikutnya. •	Jenis parasitoid yang dominan memarasit telur H. armigera pada tanaman jagung adalah genus Trichogramma dan Trichogrammatoidea (Hymenoptera: Trichogrammatidae). •	Musuh alami yang dominan pada pertanaman jagung adalah laba-laba. Predator Staphylinidae mampu mengonsumsi sekitar 15 telur H. armigera per hari. •	Penggunaan Beauveria bassiana strain cukup mengendalikan penggerek tongkol jagung (Helicoverpa armigera).',
  ),

];


class _HamaPenyakitState extends State<HamaPenyakit> {
  List<Map<String, dynamic>> myData = [];
  List<Map<String, dynamic>> imageData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _addInitialData(); // Menambahkan data awal
    _refreshData(); // Memuat data saat aplikasi dimulai
  }

  void _addInitialData() async {
  final existingData = await DatabaseHelper.getData('Penyakit');
  
  if (existingData.isEmpty) {
    for (var penyakitData in daftarPenyakit) {
      await DatabaseHelper.insertData('Penyakit', {
      'nama': penyakitData.nama,
        'path': penyakitData.path,
        'keterangan': penyakitData.keterangan,
        'solusi': penyakitData.solusi,
      });
    }
  }
  
  _refreshData();
}

//   void _addInitialData() async {
//   for (var penyakitData in daftarPenyakit) {
//     await DatabaseHelper.insertData('Penyakit', {
//       'nama': penyakitData.nama,
//       'keterangan': penyakitData.keterangan,
//       'solusi': penyakitData.solusi,
//     });
//   }
//   _refreshData();
// }

Future<void> _refreshData() async {
  final data = await DatabaseHelper.getData('Penyakit');
  // final imgData = await DatabaseHelper.getData('Riwayat_diagnosa');
  setState(() {
    myData = data;
    // imageData = imgData;
    _isLoading = false;
  });
  debugPrint('Data refreshed: $myData');
  debugPrint('Image Data refreshed: $imageData');
}

  // void _refreshData() async {
  //   final data = await DatabaseHelper.getData('Penyakit');
  //   setState(() {
  //     myData = data;
  //     _isLoading = false;
  //   });
  //   debugPrint('Data refreshed: $myData');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hama & Penyakit',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        // backgroundColor: Color.fromRGBO(74, 105, 66, 1),
        backgroundColor: const Color.fromRGBO(111, 149, 107, 1),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: myData.map((penyakit) {
                  return Penyakit(
                    // imagePath: 'assets/image/Corn_Blight (446).JPG',
                    imagePath: penyakit['path'],
                    namaPenyakit: penyakit['nama'],
                    keterangan: penyakit['keterangan'],
                    solusi: penyakit['solusi'],
                  );
                }).toList(),
              ),
            ),
    );
  }
}

class Penyakit extends StatelessWidget {
  final String imagePath;
  final String namaPenyakit;
  final String keterangan;
  final String solusi;

  const Penyakit({
    super.key,
    required this.imagePath,
    required this.namaPenyakit,
    required this.keterangan,
    required this.solusi,
  });

  @override
  Widget build(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    height: 200,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItemScreen(
              imagePath: imagePath,
              namaPenyakit: namaPenyakit,
              keterangan: keterangan,
              solusi: solusi,
            ),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        child: Stack(
          children: [
            Container(
              height: 240,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // Container(
            //   height: 60,
            //   decoration: BoxDecoration(
            //     // gradient: LinearGradient(
            //     //   begin: Alignment.topCenter,
            //     //   end: Alignment.bottomCenter,
            //     //   colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
            //     // ),
            //     color: Colors.black.withOpacity(0.65),
            //   ),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text(
            //           namaPenyakit,
            //           style: TextStyle(
            //             fontSize: 17,
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //           ),
            //           textAlign: TextAlign.center,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Color.fromARGB(255, 44, 44, 44).withOpacity(0.65),
                ),
                child: Center(
                  child: Text(
                    namaPenyakit,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),)
          ],
        ),
      ),
    ),
  );
}

}

