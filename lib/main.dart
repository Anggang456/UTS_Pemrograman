import 'package:flutter/material.dart';
import 'package:formulir_pendaftaran/formulir.dart';
import 'package:formulir_pendaftaran/splashscreen.dart';
import 'splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      title: "Pendaftaran Mahasiswa",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      );
  }
}

