import 'dart:io';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formulir_pendaftaran/Detil.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:image_picker/image_picker.dart';
import 'Detil.dart';

class Formulir extends StatefulWidget {
  const Formulir({Key? key}) : super(key: key);

  _Formulir createState() => _Formulir();
}

class _Formulir extends State<Formulir> {
  String _pilih = "";
  String _set = "";
  String _tahun = "";
  String _kerja = "";

  final setSelected = TextEditingController();
  final kerjaSelected = TextEditingController();
  final dataSelected = TextEditingController();
  List<String> _data = ["Laki - Laki", "Perempuan"];
  void _pilihjk(String value) {
    setState(() {
      _pilih = value;
    });
  }

  List<String> _pengalaman = [
    "1 Tahun",
    "2 Tahun",
    "3 Tahun",
    "4 Tahun",
    "5 Tahun"
  ];
  List<String> _pernah = [
    "Pegawai",
    "Industri",
    "Nelayan",
    "Peternak",
    "Karyawan Swasta",
    "Pedagang",
    "Kepolisian",
    "Buruh",
    "DLL"
  ];

  void initState() {
    datetimeinput.text = "";
  }

  TextEditingController controllernoKTP = new TextEditingController();
  TextEditingController controllernoNPWP = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();
  TextEditingController controllerAsal = new TextEditingController();
  TextEditingController controllerTempat = new TextEditingController();
  TextEditingController datetimeinput = new TextEditingController();
  TextEditingController controllersosMed = new TextEditingController();
  TextEditingController controllerKet = new TextEditingController();
  //RangeValues values = RangeValues(1, 5);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Registrasi Pegawai"),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              trailing: new Icon(Icons.brightness_2,
                  size: 20.0, color: Color(0xb6000000)),
              title: new Text('Night Mode'),
            ),
            new ListTile(
              trailing: new Icon(Icons.close),
              title: new Text('close'),
            )
          ],
        ),
      ),
      body: new SingleChildScrollView(
        padding: new EdgeInsets.all(10.0),
        child: new Column(children: [
          _textBoxNoKTP(),
          _textBoxNoNpwp(),
          _textBoxNamaMahasiswa(),
          _textBoxAlamatMahasiswa(),
          _textBoxTempatLahir(),
          _tglLahir(context),
          _dropDownKerja(),
          _dropDownPengalaman(),
          _textBoxLink(),
          _dropDownJK(),
          _textBoxKet(),
          _tblSimpan(context),
        ]),
      ),
    );
  }

  _textBoxNoKTP() {
    return Container(
      padding: new EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: new TextField(
        controller: controllernoKTP,
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(
          hintText: "Nomor KTP",
          labelText: "Nomor KTP",
          icon: Icon(Icons.add_card),
          border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0)),
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp(r'[0-9]'),
          )
        ],
      ),
    );
  }

  _textBoxNoNpwp() {
    return Container(
      padding: new EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: new TextField(
        controller: controllernoNPWP,
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(
          hintText: "Nomor NPWP",
          labelText: "Nomor NPWP",
          icon: Icon(Icons.add_card_sharp),
          border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0)),
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
        ],
      ),
    );
  }

  _textBoxNamaMahasiswa() {
    return Container(
      padding: new EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: new TextField(
        keyboardType: TextInputType.text,
        controller: controllerNama,
        decoration: new InputDecoration(
          hintText: "Nama Lengkap",
          labelText: "Nama Lengkap",
          icon: Icon(Icons.assignment_ind),
          border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0)),
        ),
      ),
    );
  }

  _textBoxAlamatMahasiswa() {
    return Container(
      padding: new EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: new TextField(
        controller: controllerAlamat,
        decoration: new InputDecoration(
          hintText: "Alamat",
          labelText: "Alamat",
          icon: Icon(Icons.add_location_alt_outlined),
          border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0)),
        ),
      ),
    );
  }

  _textBoxAsalSekolah() {
    return Container(
      padding: new EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: new TextField(
        controller: controllerAsal,
        decoration: new InputDecoration(
          hintText: "Asal Sekolah",
          labelText: "Asal Sekolah",
          border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0)),
        ),
      ),
    );
  }

  _textBoxTempatLahir() {
    return Container(
      padding: new EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: new TextField(
        controller: controllerTempat,
        decoration: new InputDecoration(
          hintText: "Tempat Lahir",
          labelText: "Tempat Lahir",
          icon: Icon(Icons.home_work_outlined),
          border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0)),
        ),
      ),
    );
  }

  _tglLahir(BuildContext context) {
    return Container(
      padding: new EdgeInsets.only(top: 20, left: 20, right: 20),
      child: TextFormField(
          controller: datetimeinput,
          decoration: new InputDecoration(
            hintText: "Tanggal Lahir",
            labelText: "Tanggal Lahir",
            icon: new Icon(Icons.calendar_today),
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0)),
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2050),
            );
            if (pickedDate != null) {
              String formatDate =
                  DateFormat('dd - MMMM - yyyy').format(pickedDate);
              setState(() {
                datetimeinput.text = formatDate;
              });
            } else {
              print("Tanggal Tidak Dipilih");
              datetimeinput.text = "";
            }
          }),
    );
  }

  _dropDownKerja() {
    return Container(
        child: Padding(
      padding: new EdgeInsets.only(left: 20, right: 20),
      child: DropdownSearch<String>(
          showClearButton: true,
          mode: Mode.MENU,
          searchBoxController: kerjaSelected,
          enabled: true,
          dropdownSearchDecoration:
              new InputDecoration(icon: new Icon(Icons.apartment)),
          showSelectedItem: true,
          items: _pernah,
          label: "Jenis Pekerjaan",
          hint: "Jenis Pekerjaan",
          onChanged: (value) {
            setState(() {
              _kerja = value.toString();
            });
          }),
    ));
  }

  _dropDownPengalaman() {
    return Container(
        child: Padding(
      padding: new EdgeInsets.only(left: 20, right: 20),
      child: DropdownSearch<String>(
          showClearButton: true,
          mode: Mode.MENU,
          searchBoxController: setSelected,
          enabled: true,
          dropdownSearchDecoration:
              new InputDecoration(icon: new Icon(Icons.badge)),
          showSelectedItem: true,
          items: _pengalaman,
          label: "Pengalaman Kerja",
          hint: "Pengalaman Kerja",
          onChanged: (value) {
            setState(() {
              _tahun = value.toString();
            });
          }),
    ));
  }

  _textBoxLink() {
    return Container(
      padding: new EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: new TextField(
        controller: controllersosMed,
        decoration: new InputDecoration(
          hintText: "Link  Social Media",
          labelText: "Link Social Media",
          icon: Icon(Icons.add_link),
          border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0)),
        ),
      ),
    );
  }

  _dropDownJK() {
    return Container(
        child: Padding(
      padding: new EdgeInsets.only(left: 20, right: 20),
      child: DropdownSearch<String>(
          showClearButton: true,
          mode: Mode.MENU,
          searchBoxController: dataSelected,
          enabled: true,
          dropdownSearchDecoration:
              new InputDecoration(icon: new Icon(Icons.attribution)),
          showSelectedItem: true,
          items: _data,
          label: "Pilih",
          hint: "Jenis Kelamin",
          onChanged: (value) {
            setState(() {
              _set = value.toString();
            });
          }),
    ));
  }

  _textBoxKet() {
    return Container(
      padding: new EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: new TextField(
        controller: controllerKet,
        maxLines: 3,
        decoration: new InputDecoration(
          hintText: "Keterangan",
          labelText: "Keterangan",
          icon: Icon(Icons.article),
          border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0)),
        ),
      ),
    );
  }

  _tblSimpan(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: new EdgeInsets.only(top: 20, left: 60),
          child: new ElevatedButton(
            onPressed: () {
              String noKTP = controllernoKTP.text;
              String noNPWP = controllernoNPWP.text;
              String namaLengkap = controllerNama.text;
              String Alamat = controllerAlamat.text;
              //String asalSekolah = controllerAsal.text;
              String tempatLahir = controllerTempat.text;
              String tanggalLahir = datetimeinput.text;
              String pengalaman = _kerja.toString();
              String kerja = _tahun.toString();
              //String jenisKelamin = _data.toString();
              String sosMed = controllersosMed.text;
              String jenis = _set.toString();
              String Keterangan = controllerKet.text;

              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => Detil(
                      noKTP,
                      noNPWP,
                      namaLengkap,
                      Alamat,
                      //asalSekolah,
                      tempatLahir,
                      tanggalLahir,
                      kerja,
                      pengalaman,
                      sosMed,
                      jenis,
                      Keterangan)));
            },
            child: const Text("Simpan"),
          ),
        ),
        Container(
          padding: new EdgeInsets.only(top: 20, left: 10),
          child: new ElevatedButton(
            onPressed: () {
              controllerNama.clear();
              controllerAlamat.clear();
              //controllerAsal.clear();
              controllerTempat.clear();
              datetimeinput.clear();
              controllerKet.clear();
              controllernoKTP.clear();
              controllernoNPWP.clear();
              controllersosMed.clear();
              dataSelected.clear();
            },
            child: const Text("Cancel"),
          ),
        )
      ],
    );
  }
}
