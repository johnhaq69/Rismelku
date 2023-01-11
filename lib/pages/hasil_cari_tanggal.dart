import 'package:rismelku/theme.dart';
import 'package:rismelku/widget/bottom_nav.dart';
import 'package:rismelku/widget/transaksi_card.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'dart:ffi';
import 'package:intl/intl.dart';

import '../util/db_helper.dart';

class HasilCariScreen extends StatefulWidget {
  const HasilCariScreen({
    Key? key,
    required this.tanggal_awal,
    required this.tanggal_akhir,
  }) : super(key: key);

  final String tanggal_awal;
  final String tanggal_akhir;

  @override
  State<HasilCariScreen> createState() => _HasilCariScreenState();
}

class _HasilCariScreenState extends State<HasilCariScreen> {
  List<Map<String, dynamic>> transaksi = [];

  void refreshData() async {
    final data = await SqlHelper.getTransaksi(
      widget.tanggal_awal,
      widget.tanggal_akhir,
    );
    setState(() {
      transaksi = data;
    });
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
          "Cari Transaksi",
          style: TextStyle(
            fontFamily: 'OkineSans',
            fontSize: 22,
            color: backgroundColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              refreshData();
            },
            icon: Icon(
              Icons.refresh,
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
                "${DateFormat('dd MMMM yyyy').format(DateTime.parse(widget.tanggal_awal))} - ${DateFormat('dd MMMM yyyy').format(DateTime.parse(widget.tanggal_akhir))}",
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
            TransaksiCard(
              tanggal_awal: widget.tanggal_awal,
              tanggal_akhir: widget.tanggal_akhir,
            ),
          ],
        ),
      ),
    );
  }
}
