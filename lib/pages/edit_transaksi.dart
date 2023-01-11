import 'package:rismelku/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:rismelku/theme.dart';

import '../util/db_helper.dart';

class EditTransaksiScreen extends StatefulWidget {
  const EditTransaksiScreen({
    Key? key,
    required this.idTransaksi,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.beratBarang,
  }) : super(key: key);

  final int idTransaksi;
  final String jenisTransaksi;
  final String jenisBarang;
  final String beratBarang;

  @override
  State<EditTransaksiScreen> createState() => _EditTransaksiScreenState();
}

class _EditTransaksiScreenState extends State<EditTransaksiScreen> {
  List<String> listBarang = [
    'Beras',
    'Bekatul',
    'Gabah',
  ];
  List<String> listJenisTransaksi = [
    'Keluar',
    'Masuk',
  ];

  String? barang;
  String? jenisTransaksi;
  TextEditingController beratBarangController = TextEditingController();

  String dateNow = DateTime.now().toString().substring(0, 10);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    barang = widget.jenisBarang;
    jenisTransaksi = widget.jenisTransaksi;
  }

  Future<void> updateData() async {
    await SqlHelper.editTransaksi(widget.idTransaksi, jenisTransaksi!, barang!,
        beratBarangController.text, dateNow);
    notif(context, 'Data Berhasil Diupdate !', Colors.green[800]);
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.beratBarang != "") {
      beratBarangController.text = widget.beratBarang;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Edit Transaksi",
          style: TextStyle(
            fontFamily: 'OkineSans',
            fontSize: 22,
            color: backgroundColor,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Text(
                  "Jenis Transkasi : ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
            DropdownButtonFormField(
              onChanged: (String? value) {
                setState(() {
                  jenisTransaksi = value;
                });
              },
              value: widget.jenisTransaksi,
              items: listJenisTransaksi.map((String value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Jenis Barang : ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
            DropdownButtonFormField(
              onChanged: (String? value) {
                setState(() {
                  barang = value;
                });
              },
              value: widget.jenisBarang,
              items: listBarang.map((String value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Berat Barang : ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
            TextFormField(
              controller: beratBarangController,
              decoration: InputDecoration(
                hintText: 'Berat Kg',
                border: UnderlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                  primary: thirdColor,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  updateData();
                },
                child: Text(
                  "Simpan Transaksi",
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}
