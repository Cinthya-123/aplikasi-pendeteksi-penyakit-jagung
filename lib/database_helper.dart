// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import '../models/gambar.dart';
// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   factory DatabaseHelper() => _instance;

//   static Database? _database;

//   DatabaseHelper._internal();

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'mydatabase.db');

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }

//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE Gambar(
//         id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
//         path STRING,
//         id_penyakit INTEGER
//       )
//     ''');

//     await db.execute('''
//       CREATE TABLE Penyakit(
//         id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
//         nama TEXT, 
//         path STRING,
//         keterangan TEXT,
//         solusi TEXT
//       )
//     ''');

//     await db.execute('''
//       CREATE TABLE Perawatan(
//         id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
//         Jenis_perawatan TEXT, 
//         path STRING,
//         keterangan TEXT
//       )
//     ''');
//   }

//   static Future<int> insertData(String table, Map<String, dynamic> data) async {
//     final db = await _instance.database;
//     return await db.insert(table, data);
//   }

//   static Future<List<Map<String, dynamic>>> getData(String table) async {
//     final db = await _instance.database;
//     return await db.query(table);
//   }

//   static Future<int> updateData(
//       String table, Map<String, dynamic> data, int id) async {
//     final db = await _instance.database;
//     return await db.update(table, data, where: 'id = ?', whereArgs: [id]);
//   }

//   static Future<int> deleteData(String table, int id) async {
//     final db = await _instance.database;
//     return await db.delete(table, where: 'id = ?', whereArgs: [id]);
//   }

//   static Future<List<Map<String, dynamic>>> queryData(String table, String column, String value) async {
//     final db = await _instance.database;
//     return await db.query(table, where: '$column = ?', whereArgs: [value]);
//   }

//   static Future<int> insertGambar(Gambar gambar) async {
//     final db = await _instance.database;
//     return await db.insert('Gambar', gambar.toJson());
//   }

//   static Future<List<Gambar>> getGambar() async {
//     final db = await _instance.database;
//     final List<Map<String, dynamic>> maps = await db.query('Gambar');
//     return List.generate(maps.length, (i) {
//       return Gambar.fromJson(maps[i]);
//     });
//   }

//   static Future<int?> getPenyakitIdByName(String nama) async {
//     final db = await _instance.database;
//     final List<Map<String, dynamic>> results = await db.query(
//       'Penyakit',
//       where: 'nama = ?',
//       whereArgs: [nama],
//       limit: 1,
//     );
//     if (results.isNotEmpty) {
//       return results.first['id'] as int?;
//     }
//     return null;
//   }
// }


import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/gambar.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
await Permission.manageExternalStorage.request();
 final dbPath = await getDownloadsDirectory();

    Directory(dbPath!.path).create(recursive: true);
   final path = join(dbPath.path, 'mydatabase.db');
    // final dbPath = await getDatabasesPath();
    // final path = join(dbPath, 'mydatabase.db');
    
    print(path);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // await db.execute('''
    //   CREATE TABLE Riwayat_diagnosa(
    //     id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    //     path STRING,
    //     prediksi TEXT,
    //     deskripsi TEXT,
    //     cara TEXT,
    //     gambar_penyakit STRING
    //   )
    // ''');
    await db.execute('''
      CREATE TABLE Riwayat_diagnosa(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
        path STRING,
        prediksi TEXT,
        deskripsi TEXT,
        cara TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE Penyakit(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nama TEXT, 
        path STRING,
        keterangan TEXT,
        solusi TEXT
      )
    ''');
     await db.execute('''
      CREATE TABLE Perawatan(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        Jenis_perawatan TEXT, 
        path STRING,
        keterangan TEXT
      )
    ''');
  }

  static Future<int> insertData(String table, Map<String, dynamic> data) async {
    final db = await _instance.database;
    return await db.insert(table, data);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await _instance.database;
    return await db.query(table);
  }

  static Future<int> updateData(
      String table, Map<String, dynamic> data, int id) async {
    final db = await _instance.database;
    return await db.update(table, data, where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> deleteData(String table, int id) async {
    final db = await _instance.database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> queryData(String table, String column, String value) async {
    final db = await _instance.database;
    return await db.query(table, where: '$column = ?', whereArgs: [value]);
  }
  static Future<int> insertGambar(Gambar gambar) async {
    final db = await _instance.database;
    return await db.insert('Gambar', gambar.toJson());
  }

  static Future<List<Gambar>> getGambar() async {
    final db = await _instance.database;
    final List<Map<String, dynamic>> maps = await db.query('Gambar');
    return List.generate(maps.length, (i) {
      return Gambar.fromJson(maps[i]);
    });
  }
}
