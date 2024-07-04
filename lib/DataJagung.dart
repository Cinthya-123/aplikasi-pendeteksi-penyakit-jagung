// class dataJagung{
//   List<Map<String, dynamic>> deskripsi=[

//     {
//       'Nama_penyakit': 'Blight',
//       'Keterangan_penyakit': 'gejala penyakit pada tanaman jagung ini bisa dilihat pada bagian daun. Awalnya, akan telihat bercak kecil berbentuk oval a basah pada daun jagung. Seiring berjalannya waktu, gejala berubah menjadi bercak memanjang',
//       'Cara_mengatasi' : 'Menanam varietas tahan hawar seperti Kalingga, Arjuna, dan Hibrida Cl. Perlu diketahui, varietas jagung manis relatif lebih peka terhadap penyakit hawar daun.'
//       'Menanam jagung pada awal hingga akhir musim kemarau secara serempak'
//     }, 
//     {
//       'Nama_penyakit': 'Common_rust',
//       'Keterangan_penyakit': 'Gejala penyakit karat memiliki ciri khas, yaitu diawalin dengan adanya lesiio kecil pada bagian daun, selanjutnya melingkar sampai memanjang. Ketika lesio berkembang, cendawan keluar dari permukaan daun dan lesio menjadi lebih memanjang dan biasanya terjadi halo kuning. Gejala lanjut terlihat adanya bisul (pustul) pada kedua permukaan daun bagian atas dan bawah dengan warna coklat kemerahan tersebar pada permukaan daun dan berubah warna menjadi hitam kecoklatan setelah teliospora berkembang seperti yang terlihat pada gambar 1. Jika infeksi penyakit dibiarkan maka akan menyebabkan daun menjadi kering dan tanaman mati.',
//       'Cara_mengatasi' : 'Menanam varietas jagung yang tahan patogen menyebabkan penyakit karat. Beberapa varietas yang memiliki sifat unggul tersebut, antara lain; XCI 47, XCJ 33, CI-27-2, Poll 468, Arjuna, Pioneer 2, dan lain sebagainya.'
//       ' Mengatur jarak tanam agar suhu dan kelembapan terjaga untuk pertumbuhan tanaman.'
//       ' Menanam serempak di awal musim kemarau.'
//       ' Saat intensitas serangan semakin meluas, maka lakukan penyemprotan pestisida kimia seperti zineb, fermat, dihane, dan oksiklorida tembaga.'
//     },
//     {
//       'Nama_penyakit': 'Healthy',
//       'Keterangan_penyakit': 'Gejala penyakit karat memiliki ciri khas, yaitu diawalin dengan adanya lesiio kecil pada bagian daun, selanjutnya melingkar sampai memanjang. Ketika lesio berkembang, cendawan keluar dari permukaan daun dan lesio menjadi lebih memanjang dan biasanya terjadi halo kuning. Gejala lanjut terlihat adanya bisul (pustul) pada kedua permukaan daun bagian atas dan bawah dengan warna coklat kemerahan tersebar pada permukaan daun dan berubah warna menjadi hitam kecoklatan setelah teliospora berkembang seperti yang terlihat pada gambar 1. Jika infeksi penyakit dibiarkan maka akan menyebabkan daun menjadi kering dan tanaman mati.',
//       'Cara_mengatasi' : 'Menanam varietas jagung yang tahan patogen menyebabkan penyakit karat. Beberapa varietas yang memiliki sifat unggul tersebut, antara lain; XCI 47, XCJ 33, CI-27-2, Poll 468, Arjuna, Pioneer 2, dan lain sebagainya.'
//       ' Mengatur jarak tanam agar suhu dan kelembapan terjaga untuk pertumbuhan tanaman.'
//       ' Menanam serempak di awal musim kemarau.'
//       ' Saat intensitas serangan semakin meluas, maka lakukan penyemprotan pestisida kimia seperti zineb, fermat, dihane, dan oksiklorida tembaga.'
//     } 
//   ];
// }
class dataJagung {
  final List<Map<String, dynamic>> deskripsi = [
    {
      'Nama_penyakit': 'Hawar Daun',
      'path' : 'assets/image/Hama&Penyakit/Corn_Blight (446).JPG',
      'Keterangan_penyakit': 'Gejala daun hijau keabuan atau coklat layaknya terbakar dan mengering, hawar juga muncul pada klobot jagung, biasanya muncul pada saat tanaman berumur 14 hari dan dapat menyerang jagung dari fase vegetatif hingga masa panen. Penyakit ini disebabkan oleh jamur dari genus Helminthosporium.',
      'Cara_mengatasi': '• Melakukan sanitasi lahan dengan membersihkan tanaman sakit dan inang. • Menggunakan varietas jagung yang tahan terhadap penyakit, seperti C-4, C-8, C-9, Andalas 4, P2, P10, P11, P14, P17, P19, P29, N 35, PAC 224, PAC 759, dan BIMA-8. • Mengatur waktu tanam untuk menghindari musim penghujan yang memicu kondisi yang baik bagi patogen penyebab penyakit ini. • Menyusun jarak tanam yang tepat agar tidak terlalu rapat, sehingga menciptakan lingkungan mikro yang tidak sesuai untuk perkembangan penyakit.',
    },
    // {
    //   'Nama_penyakit': 'Common_rust',
    //   'path' : 'assets/image/Corn_Common_Rust (155).JPG',
    //   'Keterangan_penyakit': 'Gejala penyakit karat memiliki ciri khas, yaitu diawalin dengan adanya lesiio kecil pada bagian daun, selanjutnya melingkar sampai memanjang. Ketika lesio berkembang, cendawan keluar dari permukaan daun dan lesio menjadi lebih memanjang dan biasanya terjadi halo kuning. Gejala lanjut terlihat adanya bisul (pustul) pada kedua permukaan daun bagian atas dan bawah dengan warna coklat kemerahan tersebar pada permukaan daun dan berubah warna menjadi hitam kecoklatan setelah teliospora berkembang seperti yang terlihat pada gambar 1. Jika infeksi penyakit dibiarkan maka akan menyebabkan daun menjadi kering dan tanaman mati.',
    //   'Cara_mengatasi': 'Menanam varietas jagung yang tahan patogen menyebabkan penyakit karat. Beberapa varietas yang memiliki sifat unggul tersebut, antara lain; XCI 47, XCJ 33, CI-27-2, Poll 468, Arjuna, Pioneer 2, dan lain sebagainya. Mengatur jarak tanam agar suhu dan kelembapan terjaga untuk pertumbuhan tanaman. Menanam serempak di awal musim kemarau. Saat intensitas serangan semakin meluas, maka lakukan penyemprotan pestisida kimia seperti zineb, fermat, dihane, dan oksiklorida tembaga.'
    // },
    {
      'Nama_penyakit': 'Ulat grayak',
      'path' : 'assets/image/Hama&Penyakit/Ulat grayak.jpg',
      'Keterangan_penyakit': 'Ulat grayak umumnya menyerang pada malam hari, sedangkan pada siang hari ulat ini bersembunyi di bawah tanaman, mulsa, atau dalam tanah. Siklus hidup ulat grayak dapat berlangsung 32-46 hari.',
      'Cara_mengatasi': '• Lakukan pemungutan dan pemusnahan ulat grayak secara manual jika populasinya masih sedikit. • Gunakan insektisida nabati seperti daun neem, bawang putih, atau cabai untuk mengendalikan hama. • Gunakan insektisida kimia secara selektif dan sesuai dengan dosis yang dianjurkan jika serangan hama sudah parah. • Gunakan biopestisida seperti Bacillus thuringiensis (Bt) yang aman bagi manusia dan lingkungan untuk mengendalikan hama.',
    },
    {
      'Nama_penyakit': 'Bercak daun',
      'path' : 'assets/image/Corn_Common_Rust (155).JPG',
      'Keterangan_penyakit': 'Gejala penyakit pada tanaman jagung umumnya terlihat pada daun. Awalnya muncul bercak kecil berbentuk oval yang basah. Seiring waktu, bercak ini memanjang dan mengering, berubah menjadi elips dengan warna hijau keabu-abuan atau coklat, dan panjangnya sekitar 2,5-15 sentimeter. Bercak biasanya muncul terlebih dahulu pada daun tua, lalu menyebar ke daun muda. Infeksi yang parah dapat menyebabkan tanaman mati dengan cepat.',
      'Cara_mengatasi': '• Rotasi tanaman untuk memutus daur hidup hama. • Pengolahan tanah yang baik (selama 1 bulan) untuk mengangkat kepompong hama dari dalam tanah agar mati terjemur oleh sinar matahari. • Pemasangan perangkap berferomon yaitu feromon Exi sebanyak 20 buah per hektar. • Penyemprotan insektisida jika kerusakan daun telah mencapai 5%. • Pemasangan lampu perangkap sebanyak 30 buah per hektar. • Penyemprotan insektisida jika populasi kelompok telur telah mencapai 1 kelompok atau 10 tanaman',
    },
    {
      'Nama_penyakit': 'Sehat',
      'path' : 'assets/image/Hama&Penyakit/Corn_Health (170).JPG',
      'Keterangan_penyakit': 'Tanaman jagung dalam keadaan sehat.',
      'Cara_mengatasi': 'Tidak perlu melakukan tindakan apa pun. Pastikan tanaman terus dalam kondisi yang baik.'
    }
  ];

  //  Map<String, dynamic>? getDataByName(String name) {
  //   return deskripsi.firstWhere((element) => element['Nama_penyakit'] == name, orElse: () => {});
  // }
  Map<String, dynamic> getDataByName(String name) {
    return deskripsi.firstWhere((element) => element['Nama_penyakit'] == name, orElse: () => {
      'Nama_penyakit': '',
      'path': '',
      'Keterangan_penyakit': '',
      'Cara_mengatasi': ''
    });
  }
}
