import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../homepage.dart';

void main() {
  //  WidgetsFlutterBinding.ensureInitialized();
  // databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 255, 255, 255),
        ),
        useMaterial3: true,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,  // Disable the debug banner
    );
  }
}

