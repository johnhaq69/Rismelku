import 'package:rismelku/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:rismelku/theme.dart';

class TambahTransaksiScreen extends StatelessWidget {
  const TambahTransaksiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Text(
          "Tambah Transaksi Screen",
          style: TextStyle(
            fontFamily: 'OkineSans',
            fontSize: 25,
            color: blackColor,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}
