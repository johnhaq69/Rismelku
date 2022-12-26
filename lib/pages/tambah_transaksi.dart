import 'package:rismelku/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:rismelku/theme.dart';

import '../util/db_helper.dart';

class TambahTransaksiScreen extends StatefulWidget {
  const TambahTransaksiScreen({super.key});

  @override
  State<TambahTransaksiScreen> createState() => _TambahTransaksiScreenState();
}

class _TambahTransaksiScreenState extends State<TambahTransaksiScreen> {
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

  Future<void> tambahData() async {
    await SqlHelper.tambahTransaksi(
        jenisTransaksi!, barang!, beratBarangController.text, dateNow);
    notif(context, 'Ditambahkan', Colors.blue[800]);
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Tambah Transaksi",
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
              value: jenisTransaksi,
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
              value: barang,
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
                  tambahData();
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