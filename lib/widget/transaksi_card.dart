import 'package:flutter/material.dart';
import 'package:rismelku/pages/edit_transaksi.dart';
import 'package:rismelku/theme.dart';
import 'package:rismelku/pages/main_screen.dart';
import 'package:rismelku/util/db_helper.dart';
import 'package:intl/intl.dart';

class TransaksiCard extends StatefulWidget {
  TransaksiCard({
    Key? key,
    required this.tanggal_awal,
    required this.tanggal_akhir,
  }) : super(key: key);

  final String tanggal_awal;
  final String tanggal_akhir;

  @override
  State<TransaksiCard> createState() => _TransaksiCardState();
}

class _TransaksiCardState extends State<TransaksiCard> {
  @override
  void initState() {
    super.initState();
    refreshData();
  }

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

  Future<void> deleteData(id) async {
    await SqlHelper.hapusTransaksi(id);
    notif(context, 'Data Berhasil Dihapus !', Colors.redAccent);
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  void dialogHapus(context, int id, String nama) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Yakin menghapus data ' + nama + ' ?',
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
                onPressed: () {
                  deleteData(id);
                },
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
    return Expanded(
      child: transaksi.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    "Tidak Ada Laporan.",
                    style: TextStyle(
                      fontFamily: 'OkineSans',
                      fontSize: 18,
                      color: blackColor,
                    ),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transaksi.length,
              itemBuilder: (context, index) => Card(
                color: secondaryColor,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: ListTile(
                  title: Text(
                    "${transaksi[index]["barang"]} : ${transaksi[index]["berat"]} Kg",
                    style: TextStyle(
                      fontFamily: 'OkineSans',
                      fontSize: 18,
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    "${transaksi[index]["jenis"]} ${DateFormat('dd/MM/yyyy').format(DateTime.parse(transaksi[index]["tanggal"]))}",
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
                                  idTransaksi: transaksi[index]["id"],
                                  jenisTransaksi: transaksi[index]["jenis"],
                                  jenisBarang: transaksi[index]["barang"],
                                  beratBarang: transaksi[index]["berat"],
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            dialogHapus(context, transaksi[index]["id"],
                                "${transaksi[index]["barang"]} - ${transaksi[index]["berat"]} Kg");
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
