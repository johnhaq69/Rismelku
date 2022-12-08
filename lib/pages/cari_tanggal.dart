import 'package:rismelku/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:rismelku/theme.dart';
import 'package:date_format/date_format.dart';

class CariTanggalScreen extends StatefulWidget {
  const CariTanggalScreen({super.key});

  @override
  State<CariTanggalScreen> createState() => _CariTanggalScreenState();
}

class _CariTanggalScreenState extends State<CariTanggalScreen> {
  var tanggalAwal;
  void callDatePicker() async {
    var transaksi = await getDate();
    setState(() {
      tanggalAwal = formatDate(transaksi!, [dd, '/', mm, '/', yyyy]);
    });
  }

  var tanggalAkhir;
  void callDatePicker2() async {
    var transaksi = await getDate();
    setState(() {
      tanggalAkhir = formatDate(transaksi!, [dd, '/', mm, '/', yyyy]);
    });
  }

  Future<DateTime?> getDate() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
  }

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
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Tanggal Awal : ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                tanggalAwal == null
                    ? Text(
                        "Tanggal Awal",
                        textScaleFactor: 1.0,
                      )
                    : Text(
                        "$tanggalAwal",
                        textScaleFactor: 1.0,
                      ),
                MaterialButton(
                  onPressed: callDatePicker,
                  color: Colors.grey,
                  child: Icon(Icons.date_range),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Tanggal Akhir : ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                tanggalAwal == null
                    ? Text(
                        "Tanggal Akhir",
                        textScaleFactor: 1.0,
                      )
                    : Text(
                        "$tanggalAkhir",
                        textScaleFactor: 1.0,
                      ),
                MaterialButton(
                  onPressed: callDatePicker2,
                  color: Colors.grey,
                  child: Icon(Icons.date_range),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                  primary: thirdColor,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Cari Transaksi",
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}