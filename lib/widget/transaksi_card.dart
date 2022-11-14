import 'package:flutter/material.dart';
import 'package:rismelku/theme.dart';

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
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {},
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
