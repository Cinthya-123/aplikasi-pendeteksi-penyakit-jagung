class Penyakit {
  final int id;
  final String nama;
  final String path;
  final String keterangan;
  final String solusi;

  Penyakit({
    required this.id,
    required this.nama,
    required this.path,
    required this.keterangan,
    required this.solusi,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'path': path,
      'keterangan': keterangan,
      'solusi': solusi,
    };
  }

  factory Penyakit.fromMap(Map<String, dynamic> map) {
    return Penyakit(
      id: map['id'] as int,
      nama: map['nama'] as String,
      path: map['path'] as String,
      keterangan: map['keterangan'] as String,
      solusi: map['solusi'] as String,
    );
  }
}
