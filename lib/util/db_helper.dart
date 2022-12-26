import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  //Membuat Tabel
  static Future<void> createTableTransaksi(sql.Database database) async {
    await database.execute(""" DROP TABLE IF EXISTS transaksi """);
    await database.execute(""" CREATE TABLE transaksi (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      jenis TEXT,
      barang TEXT,
      berat TEXT,
      tanggal TEXT
    ) """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('ricemillku.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTableTransaksi(database);
    });
  }

  static Future<List<Map<String, dynamic>>> getTransaksi() async {
    final db = await SqlHelper.db();
    return db.query('transaksi');
  }

  static Future<int> tambahTransaksi(
      String jenis, String barang, String berat, String tanggal) async {
    final db = await SqlHelper.db();
    final data = {
      'jenis': jenis,
      'barang': barang,
      'berat': berat,
      'tanggal': tanggal
    };
    return await db.insert('transaksi', data);
  }

  static Future<int> editTransaksi(
      int id, String jenis, String barang, String berat, String tanggal) async {
    final db = await SqlHelper.db();
    final data = {
      'jenis': jenis,
      'barang': barang,
      'berat': berat,
      'tanggal': tanggal
    };
    return await db.update('transaksi', data, where: "id = $id");
  }

  static Future<int> hapusTransaksi(int id) async {
    final db = await SqlHelper.db();
    return await db.delete('transaksi', where: "id = $id");
  }
}