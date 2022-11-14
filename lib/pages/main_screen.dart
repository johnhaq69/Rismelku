import 'package:rismelku/theme.dart';
import 'package:rismelku/widget/bottom_nav.dart';
import 'package:rismelku/widget/transaksi_card.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Laporan Hari Ini",
          style: TextStyle(
            fontFamily: 'OkineSans',
            fontSize: 22,
            color: backgroundColor,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavWidget(),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Text(
                "14 November 2022",
                style: TextStyle(
                  fontFamily: 'OkineSans',
                  fontSize: 18,
                  color: blackColor,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TransaksiCard(),
          ],
        ),
      ),
    );
  }
}
