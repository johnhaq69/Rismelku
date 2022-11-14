import 'package:rismelku/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:rismelku/theme.dart';

class CariTanggalScreen extends StatelessWidget {
  const CariTanggalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Cari Tanggal",
          style: TextStyle(
            fontFamily: 'OkineSans',
            fontSize: 22,
            color: backgroundColor,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Cari Tanggal Screen",
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
