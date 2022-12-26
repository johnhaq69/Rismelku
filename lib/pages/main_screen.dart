import 'package:rismelku/theme.dart';
import 'package:rismelku/widget/bottom_nav.dart';
import 'package:rismelku/widget/transaksi_card.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'dart:ffi';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  void dialogHapus(context, int id, String nama) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Yakin Menghapus Anggota ' + nama + ' ?',
          ),
          backgroundColor: Colors.white,
          actions: [
            SizedBox(
              height: 30,
              width: 30,
              child: IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.cancel,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                  size: 30,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        );
      },
    );
  }

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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
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
                "26 Desember 2022",
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