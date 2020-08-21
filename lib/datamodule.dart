import 'global.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';


void makeSampleData() {
  workers.add(Worker()
    ..WorkerBarId='1000'
    ..WorkerName='Petr Šrámek'
    ..WorkerId=1);
  workers.add(Worker()
    ..WorkerBarId='1001'
    ..WorkerName='Michal Strach'
    ..WorkerId=2);

  operations.add(Operation()
  ..OperationBarId='4000'
  ..OperationName='Operace1'
  ..OperationId=30);

  operations.add(Operation()
    ..OperationBarId='4001'
    ..OperationName='Operace2'
    ..OperationId=31);

  operations.add(Operation()
    ..OperationBarId='4002'
    ..OperationName='Operace3'
    ..OperationId=32);

  orders.add(Order()
  ..OrderBarId='1000'
  ..OrderName='Zakázka1');

  orders.add(Order()
    ..OrderBarId='1001'
    ..OrderName='Zakázka2');

  orders.add(Order()
    ..OrderBarId='1002'
    ..OrderName='Zakázka3');

  orders.add(Order()
    ..OrderBarId='1003'
    ..OrderName='Zakázka4');

}


final Future<Database> database = openDatabase(
  // Set the path to the database. Note: Using the `join` function from the
  // `path` package is best practice to ensure the path is correctly
  // constructed for each platform.
    join(getDatabasesPath().toString(), 'emistr.db'),
  onCreate:  (db, version) {
    // Run the CREATE TABLE statement on the database.
    return db.execute(
      "CREATE TABLE operations(id INTEGER PRIMARY KEY, name TEXT, barid TEXT);"
      "CREATE TABLE workers(id INTEGER PRIMARY KEY, name TEXT, barid TEXT);"
      "CREATE TABLE orders(id INTEGER PRIMARY KEY, name TEXT, barid TEXT);"
      "CREATE TABLE config(id INTEGER PRIMARY KEY, serverurl TEXT, terminalname TEXT);",
    );
  },
  // Set the version. This executes the onCreate function and provides a
  // path to perform database upgrades and downgrades.
  version: 1,
);
