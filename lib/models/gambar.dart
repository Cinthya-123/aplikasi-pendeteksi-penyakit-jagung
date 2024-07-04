// class Gambar {
//   final int id;
//   final String path;
//   final String prediksi;
//   final String deskripsi;
//   final String cara;

//   Gambar({
//     required this.id,
//     required this.path,
//     required this.prediksi,
//     required this.deskripsi,
//     required this.cara,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'path': path,
//       'prediksi': prediksi,
//       'deskripsi': deskripsi,
//       'cara': cara,
//     };
//   }

//   factory Gambar.fromJson(Map<String, dynamic> json) {
//     return Gambar(
//       id: json['id'] as int,
//       path: json['path'] as String,
//       prediksi: json['prediksi'] as String,
//       deskripsi: json['deskripsi'] as String,
//       cara: json['cara'] as String,
//     );
//   }
// }


class Gambar {
  final int? id;
  final String path;
  final int id_penyakit;

  Gambar({this.id, required this.path, required this.id_penyakit});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'path': path,
      'id_penyakit': id_penyakit,
    };
  }

  factory Gambar.fromJson(Map<String, dynamic> json) {
    return Gambar(
      id: json['id'],
      path: json['path'],
      id_penyakit: json['id_penyakit'],
    );
  }
}
