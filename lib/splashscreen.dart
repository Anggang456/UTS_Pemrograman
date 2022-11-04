import 'package:flutter/material.dart';
import 'package:formulir_pendaftaran/Detil.dart';
import 'package:formulir_pendaftaran/formulir.dart';
import 'formulir.dart';
import 'Detil.dart';
import 'dart:async';
import 'main.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    //
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Formulir()));
    });
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
        body: Container(
            color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.account_balance,
                  size: 100.0,
                  color: Colors.white,
                ),
                Text("REGISTRASI",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ))
              ],
            )));
  }
}
