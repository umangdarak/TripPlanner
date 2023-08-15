import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:trip2/book/ticket.dart';
class DataBaseHelper {
  static Future<sql.Database> db() async {
    return sql.openDatabase('Users3.db',
        version: 1,
        onCreate: (sql.Database database, int version) async {
          await createTable(database);
        });
  }

  static Future<void> createTable(sql.Database database) async {
    await database.execute('''
    CREATE TABLE users1(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    email TEXT,
    phnno TEXT,
    location1 TEXT,
    location2 TEXT,
    hotel   TEXT);
    ''');
  }

  static Future<int> insertItem(String name, String email, String phnno,
      String location1,String location2, String hotel) async {
    final db = await DataBaseHelper.db();
    final id = await db.insert('users1', {
      'name': name,
      'email': email,
      'phnno': phnno,
      'location1': location1,
      'location2':location2,
      'hotel': hotel,
    }, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Ticket>> getItems() async {
    final db = await DataBaseHelper.db();
    final List<Map<String, Object?>>maps = await db.query(
        'users1', orderBy: "id");
    return maps.map((e) => Ticket.fromMap(e)).toList();
  }

  /*static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DataBaseHelper.db();
    return db.query('users1', where: "id = ?", whereArgs: [id], limit: 1);
  }*/
  static Future<void> deleteItem(int id) async{
    final db=await DataBaseHelper.db();
    try{
      await db.delete('users1',where:'id=?',whereArgs: [id]);
    }
    catch(arr){
      debugPrint('Something went wrong');
    }}
  static Future<void> deleteWholeTable() async {
    final db = await DataBaseHelper.db();
    db.execute(''' DELETE FROM users1''');
  }
  static Future<dynamic> alterTable(String TableName, String ColumnName) async {
    var db = await DataBaseHelper.db();
    var count = await db.execute("ALTER TABLE $TableName ADD "
        "COLUMN $ColumnName INTEGER;");
   // print(await dbClient.query(TABLE_CUSTOMER));
    return count;
  }

}