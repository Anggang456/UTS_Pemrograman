import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'formulir.dart';
import 'dart:async';
import 'dart:io';
import 'dart:html' as html;
import 'dart:convert';
import 'dart:typed_data';

class Detil extends StatefulWidget {
  final String noKTP;
  final String noNPWP;
  final String namaLengkap;
  final String Alamat;
  //final String asalSekolah;
  final String tempatLahir;
  final String tanggalLahir;
  //final String jenisKelamin;
  final String sosMed;
  final String jenis;
  final String Pengalaman;
  final String kerja;
  final String Keterangan;

  Detil(
      this.noKTP,
      this.noNPWP,
      this.namaLengkap,
      this.Alamat,
      this.tempatLahir,
      this.tanggalLahir,
      this.Pengalaman,
      this.kerja,
      this.sosMed,
      this.jenis,
      this.Keterangan);
  @override
  _DetilState createState() => _DetilState();
}

class _DetilState extends State<Detil> {
  List<int>? _selectedFile;
  Uint8List? _bytesData;

  startWebFilePicker() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();

      reader.onLoadEnd.listen(
        (event) {
          setState(() {
            _bytesData = Base64Decoder()
                .convert(reader.result.toString().split(",").last);
            _selectedFile = _bytesData;
          });
        },
      );
      reader.readAsDataUrl(file);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pegawai"), backgroundColor: Colors.blue),
      body: Center(
        child: Column(children: [
          _tblUP(),
          Align(
            alignment: FractionalOffset(0.2, 0.6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Nomor KTP                                                            " + widget.noKTP),
                Text("Nomor NPWP                                                           " + widget.noNPWP),
                Text("Nama Lengkap                                                         " + widget.namaLengkap),
                Text("Alamat                                                               " + widget.Alamat),
                //Text("Asal Sekolah: " + widget.asalSekolah),
                Text("Tempat Lahir                                                         " + widget.tempatLahir),
                Text("Tanggal Lahir                                                        " + widget.tanggalLahir),
                Text("Pernah Bekerja                                                       " + widget.kerja),
                Text("Pengalaman Kerja                                                     " + widget.Pengalaman),
                //Text("Jenis Kelamin: " + widget.jenisKelamin),
                Text("Link Social Media                                                    " + widget.sosMed),
                Text("Jenis Kelamin                                                        " + widget.jenis),
                Text("Keterangan                                                           " + widget.Keterangan),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  _tblUP() {
    return Container(
      padding: new EdgeInsets.only(top: 60, bottom: 20),
      child: Center(
        child: Column(
          children: [
            _bytesData != null
                ? Image.memory(_bytesData!, width: 200, height: 200)
                : FlutterLogo(size: 100),
            SizedBox(height: 20),
            MaterialButton(
              color: Colors.blue,
              elevation: 8,
              highlightElevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              textColor: Colors.white,
              child: Text("Select Photo"),
              onPressed: () {
                startWebFilePicker();
              },
            ),
          ],
        ),
      ),
    );
  }
}
