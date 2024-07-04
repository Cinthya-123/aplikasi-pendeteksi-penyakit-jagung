// import 'package:flutter/material.dart';

// void main() {
//   runApp(TipsPerawatan());
// }

// class TipsPerawatan extends StatefulWidget {
//   const TipsPerawatan({Key? key}) : super(key: key);

//   @override
//   _TipsPerawatanState createState() => _TipsPerawatanState();
// }

// class _TipsPerawatanState extends State<TipsPerawatan> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Tips Perawatan',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color.fromRGBO(111, 149, 107, 1),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Penyiraman',
//               style: TextStyle(
//                 color: Color.fromRGBO(0, 0, 0, 1),
//                 fontFamily: 'Inter',
//                 fontSize: 18,
//                 letterSpacing: 0,
//                 fontWeight: FontWeight.normal,
//                 height: 1,
//               ),
//             ),
//             SizedBox(height: 16),
//             Container(
//               width: 231,
//               height: 127,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: const Color.fromRGBO(242, 242, 242, 1),
//                 image: DecorationImage(
//                 image: AssetImage('assets/image/Frame 1.png'),
//                         fit: BoxFit.cover),
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Agar jagung tetap terawat, kamu harus rutin menyirami jagung sebanyak dua sampai tiga kali seminggu atau saat 3 cm bagian atas tanah mulai mengering. Kemudian, berikan jagung dengan air hingga membasahi kira-kira 5 cm permukaan tanahnya tiap minggu.',
//               textAlign: TextAlign.justify,
//               style: TextStyle(
//                 color: Color.fromRGBO(0, 0, 0, 1),
//                 fontFamily: 'Inter',
//                 fontSize: 13,
//                 letterSpacing: 0,
//                 fontWeight: FontWeight.normal,
//                 height: 1,
//               ),
//             ),
//             SizedBox(height: 24),
//             Text(
//               'Pemupukan',
//               style: TextStyle(
//                 color: Color.fromRGBO(0, 0, 0, 1),
//                 fontFamily: 'Inter',
//                 fontSize: 18,
//                 letterSpacing: 0,
//                 fontWeight: FontWeight.normal,
//                 height: 1,
//               ),
//             ),
//             SizedBox(height: 16),
//             Container(
//               width: 231,
//               height: 127,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: const Color.fromRGBO(242, 242, 242, 1),
//                 image: DecorationImage(
//                 image: AssetImage('assets/image/Frame 2.png'),
//                         fit: BoxFit.cover),
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Pemupukan dasar diberikan sebelum penanaman, biasanya dilakukan bersama pengolahan lahan. Jenis pupuk yang diberikan yaitu pupuk organik sebanyak 10 hingga 20 ton/ha.',
//               textAlign: TextAlign.justify,
//               style: TextStyle(
//                 color: Color.fromRGBO(0, 0, 0, 1),
//                 fontFamily: 'Inter',
//                 fontSize: 13,
//                 letterSpacing: 0,
//                 fontWeight: FontWeight.normal,
//                 height: 1,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:aplikasi_pendeteksi_penyakit_jagung/database_helper.dart';

void main() {
  runApp(TipsPerawatan());
}

class TipsPerawatan extends StatefulWidget {
  const TipsPerawatan({Key? key}) : super(key: key);

  @override
  _TipsPerawatanState createState() => _TipsPerawatanState();
}

class Perawatan {
  final String jenis_perawatan;
  final String path;
  final String keterangan;

  Perawatan({required this.jenis_perawatan, required this.path, required this.keterangan});
}

List<Perawatan> daftarPenyakit = [
  Perawatan(
    jenis_perawatan: 'Penjarangan',
    path: 'assets/image/tips_perawatan/penjarangan.jpg',
    keterangan: 'Penjarangan tanaman adalah proses menghilangkan tanaman yang tidak diinginkan, terutama ketika ada terlalu banyak tanaman atau tanaman yang tidak sesuai di dalam satu lubang tanam. Proses ini dilakukan dengan cara mematahkan tanaman yang tidak diinginkan, bukan mencabutnya, agar tidak merusak akar tanaman lainnya.',
  ),
  Perawatan(
    jenis_perawatan: 'Penyulaman',
    path: 'assets/image/tips_perawatan/penyulaman.jpg',
    keterangan: 'Agar jagung tetap terawat, kamu harus rutin menyirami jagung sebanyak dua sampai tiga kali seminggu atau saat 3 cm bagian atas tanah mulai mengering. Kemudian, berikan jagung dengan air hingga membasahi kira-kira 5 cm permukaan tanahnya tiap minggu. Pemupukan dasar diberikan sebelum penanaman, biasanya dilakukan bersama pengolahan lahan. Jenis pupuk yang diberikan yaitu pupuk organik sebanyak 10 hingga 20 ton/ha.',
  ),
  Perawatan(
    jenis_perawatan: 'Penyiangan',
    path: 'assets/image/tips_perawatan/pembubunan.jpg',
    keterangan: 'Penyiangan dalam perawatan tanaman jagung bertujuan menghilangkan gulma yang bersaing dengan tanaman jagung dalam mendapatkan unsur hara. Penyiangan pertama dapat dilakukan ketika tanaman berumur empat minggu setelah penanaman. Penyiangan ini dilakukan bersamaan dengan pembumbunan dan sebaiknya dilakukan setiap dua minggu.',
  ),
  Perawatan(
    jenis_perawatan: 'Pembumbunan',
    path: 'assets/image/tips_perawatan/penyiangan (3).jpg',
    keterangan: 'Pembumbunan adalah proses menutup akar tanaman yang muncul di atas permukaan tanah dengan menimbunnya menggunakan tanah dari sisi kanan dan kiri. Tujuan pembumbunan adalah untuk memperkuat tanaman. Proses ini lebih efisien jika dilakukan bersamaan dengan penyiangan untuk menghemat tenaga kerja. Pembumbunan pertama dilakukan bersamaan dengan penyiangan kedua.',
  ),
  Perawatan(
    jenis_perawatan: 'Pemupukan',
    path: 'assets/image/tips_perawatan/pemupukan.jpg',
    keterangan: 'Untuk mendukung pertumbuhan tanaman, Anda perlu memenuhi kebutuhan unsur hara. Dosis pupuk yang biasa digunakan adalah 200-300 kg urea per hektare, 100-200 kg SP-36 per hektare, dan 200-300 kg NPK per hektare. Pemupukan pertama dilakukan sebelum penanaman dengan cara menyebarkan pupuk ke dalam alur yang dibuat sekitar 10 cm dari barisan tanam dengan kedalaman 10 cm. Pemupukan lanjutan diberikan setelah tanaman berumur empat minggu.',
  ),
  Perawatan(
    jenis_perawatan: 'Pengairan',
    path: 'assets/image/tips_perawatan/pengairan.jpg',
    keterangan: 'Penyiraman dilakukan jika lahan tidak mendapat hujan selama satu minggu berturut-turut, karena jagung membutuhkan cukup air selama masa pertumbuhannya.',
  ),
   Perawatan(
    jenis_perawatan: 'Pengendalian Hama dan Penyakit',
    path: 'assets/image/tips_perawatan/pengendalian.jpg',
    keterangan: 'Salah satu penyebab kegagalan panen adalah serangan hama dan penyakit. Oleh karena itu, pencegahan lebih baik daripada pengobatan. Jika serangan sudah terjadi, pengendalian harus dilakukan sesuai dengan jenis hama yang menyerang.',
  ),
  // Tambahkan data perawatan lainnya di sini
];

class _TipsPerawatanState extends State<TipsPerawatan> {
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
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(242, 242, 242, 1),
            image: DecorationImage(
              image: AssetImage(perawatan.path),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16.0), // Padding di semua sisi sebesar 16.0
          child: Text(
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
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tips Perawatan',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(111, 149, 107, 1),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: daftarPenyakit.map((perawatan) => buildExpansionTile(perawatan)).toList(),
        ),
      ),
    );
  }
}
