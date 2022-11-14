import 'package:flutter/material.dart';
import 'package:rismelku/theme.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedLabelStyle: TextStyle(
        fontFamily: 'OkineSans',
        fontSize: 16,
        color: backgroundColor,
      ),
      selectedLabelStyle: TextStyle(
        fontFamily: 'OkineSans',
        fontSize: 16,
        color: backgroundColor,
      ),
      backgroundColor: primaryColor,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Beranda'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Cari Tanggal'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add_rounded,
            ),
            label: 'Tambah Trans'),
      ],
      selectedItemColor: backgroundColor,
      unselectedItemColor: backgroundColor,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        } else if (index == 1) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/cari-tanggal', (route) => false);
        } else if (index == 2) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/tambah-transaksi', (route) => false);
        }
      },
    );
  }
}
