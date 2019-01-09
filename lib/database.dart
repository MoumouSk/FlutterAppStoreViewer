import 'dart:io' as io;
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'top_apps_json_parser.dart';

class DatabaseHelper {
  Database _db;

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDatabase();
    return _db;
  }

  Future initDatabase() async {
    print("COUILLO");
    if (_db == null) {
      print("Creating DB");
      io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, "database.db");

      _db = await openDatabase(path, version: 1, onCreate: _create);
      return _db;
    }
  }

  void _create(Database db, int version) async {
    await db.execute(
        "CREATE TABLE appList ("
              "id INTEGER PRIMARY KEY,"
              "app_label TEXT NOT NULL,"
              "app_summary TEXT NOT NULL"
            ")");
    print("Created table appList");
  }

  Future dropDatabase() async {
    if (_db != null) {
      print("Deleting DB");
      _db = await dropDatabase();
    }
  }

  Future<Entry> upsertApps(Entry app) async {
    if (app.dbId == null) {
       app.dbId = await _db.insert("appList", app.toJson());
    } else {
      //await _db.update("appList", app.toMap(), where: "id = ?", whereArgs: [app.id]);
    }
    return app;
  }

}