import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_app/src/models/corder.dart';
import 'package:flutter_app/src/models/operation.dart';
import 'package:flutter_app/src/models/worker.dart';



class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async {
    return await openDatabase(join(getDatabasesPath().toString(), 'emistr.db'),
    onCreate: (db, version) async {
      await { db.execute(
        "CREATE TABLE operations(id INTEGER PRIMARY KEY, name TEXT, barid TEXT);"
            "CREATE TABLE workers(id INTEGER PRIMARY KEY, name TEXT, barid TEXT);"
            "CREATE TABLE orders(id INTEGER PRIMARY KEY, name TEXT, barid TEXT);"
            "CREATE TABLE config(id INTEGER PRIMARY KEY, serverurl TEXT, terminalname TEXT);",
      ),
        db.execute("INSERT INTO config (id, serverurl, terminalname) VALUES (1,'http://www.agerit.cz/android/index.php?','mobile');")
      };
    },
    version: 1);
  }

  createCorder(Corder newCorder) async {
    await deleteAllCorders();
    final db = await database;
    final res = await db.insert('orders', newCorder.toJson());
    return res;
  }

  Future<int> deleteAllCorders() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM orders');

    return res;
  }

  Future<List<Corder>> GetAllCorders() async {
     final db = await database;
     final res = await db.rawQuery("SELECT * FROM orders");
     List<Corder> list =
         res.isNotEmpty ? res.map((c) => Corder.fromJson(c)).toList() : [];
    return list;
  }

  createOperation(Operation newOperation) async {
    await deleteAllOperations();
    final db = await database;
    final res = await db.insert('operations', newOperation.toJson());
    return res;
  }

  Future<int> deleteAllOperations() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM operations');

    return res;
  }

  Future<List<Operation>> GetAllOperations() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM operations");
    List<Operation> list =
    res.isNotEmpty ? res.map((c) => Operation.fromJson(c)).toList() : [];
    return list;
  }

  createWorker(Worker newWorker) async {
    await deleteAllWorkers();
    final db = await database;
    final res = await db.insert('workers', newWorker.toJson());
    return res;
  }

  Future<int> deleteAllWorkers() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM workers');

    return res;
  }

  Future<List<Worker>> GetAllWorkers() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM workers");
    List<Worker> list =
    res.isNotEmpty ? res.map((c) => Worker.fromJson(c)).toList() : [];
    return list;
  }

}