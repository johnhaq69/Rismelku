import 'package:rismelku/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:rismelku/theme.dart';

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
  String? barang;

  TextEditingController beratBarangController = TextEditingController();

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
                labelText: 'Berat Barang',
                hintText: 'Berat Kg',
                border: UnderlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}