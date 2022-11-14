import 'package:rismelku/pages/cari_tanggal.dart';
import 'package:rismelku/pages/login.dart';
import 'package:rismelku/pages/main_screen.dart';
import 'package:rismelku/pages/tambah_transaksi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RiceMillKu',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => MainScreen(),
        '/tambah-transaksi': (context) => TambahTransaksiScreen(),
        '/cari-tanggal': (context) => CariTanggalScreen(),
      },
    );
  }
}
