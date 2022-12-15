import 'package:flutter/material.dart';
import 'package:rismelku/pages/edit_transaksi.dart';
import 'package:rismelku/theme.dart';
import 'package:rismelku/pages/main_screen.dart';

class TransaksiCard extends StatelessWidget {
  TransaksiCard({super.key});

  List transaksi = [
    {"title": "Transaksi 1", "subtitle": "Masuk : 7 Ton"},
    {"title": "Transaksi 2", "subtitle": "Keluar : 5 Ton"}
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: transaksi.length,
        itemBuilder: (context, index) => Card(
          color: secondaryColor,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: ListTile(
            title: Text(
              transaksi[index]["title"],
              style: TextStyle(
                fontFamily: 'OkineSans',
                fontSize: 18,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Text(
              transaksi[index]["subtitle"],
              style: TextStyle(
                fontFamily: 'OkineSans',
                fontSize: 16,
                color: blackColor,
              ),
            ),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditTransaksiScreen(
                            idTransaksi: 1,
                            jenisTransaksi: "Keluar",
                            jenisBarang: "Beras",
                            beratBarang: "50",
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      MainScreen().dialogHapus(context, 1, "Transaksi 1");
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}