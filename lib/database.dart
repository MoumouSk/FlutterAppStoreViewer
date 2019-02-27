import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'top_apps_json_parser.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      print("ON CREATE");
      await db.execute("CREATE TABLE Applist ("
          "id INTEGER PRIMARY KEY,"
          "app_label TEXT NOT NULL UNIQUE,"
          "app_summary TEXT NOT NULL"
          ")");
      print("Applist table created");
    });
  }

  dropDB() async {
    final db = await database;

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    if (db != null) {
      print("Deleting DB at " + path);
      return await deleteDatabase(path);
    }
  }

  dropDB2() async {
    final db = await database;

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db-wal");
    if (db != null) {
      print("Deleting DB at " + path);
      return await deleteDatabase(path);
    }
  }

  dropDB3() async {
    final db = await database;

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db-shm");
    if (db != null) {
      print("Deleting DB at " + path);
      return await deleteDatabase(path);
    }
  }

  dropAllDb() async {
    dropDB();
    dropDB2();
    dropDB3();
  }

  deleteAll() async {
    final db = await database;
    if (db != null) {
      print("Deleting all entries from Applist");
      db.rawDelete('DELETE FROM Applist');
    }
  }

  printDb() async {
    final db = await database;
    var content = await db.rawQuery("SELECT * FROM Applist");
    debugPrint('Debug Print : ${content.toString()}');
  }


  newEntry(Entry app) async {
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Applist");
    var id = table.first["id"];
    var raw;

    if (id == null) {
      raw = await db.rawInsert(
          "INSERT Into Applist (id,app_label,app_summary)"
          " VALUES (?,?,?)",
          [app.dbId, app.imName.label, app.summary.label]);
    } else if (app.dbId > id) {
      raw = await db.rawInsert(
          "INSERT Into Applist (id,app_label,app_summary)"
          " VALUES (?,?,?)",
          [app.dbId, app.imName.label, app.summary.label]);
    } else {
      raw = await db.rawUpdate(
          "UPDATE Applist "
          "SET app_label = (?), app_summary = (?)"
          "WHERE id= (?)",
          [app.imName.label, app.summary.label, app.dbId]);
    }
    return raw;
  }


  Future<Entry> insertEntries(Entry app) async {
    final db = await database;

    //var res = db.insert('Applist', app.toJson());
  }

  Future<List<Entry>> getAllEntries() async {
    //final db = await database;
  }
}
