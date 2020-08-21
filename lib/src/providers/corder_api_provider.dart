import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_app/src/models/corder.dart';
import 'package:flutter_app/src/providers/db_provider.dart';


class CorderApiProvider {
  Future<List<Corder>> getAllCorders() async {
    var url = "http://www.agerit.cz/android/index.php?getorder=1";
    Response response = await Dio().get(url);

    return (response.data as List).map((corder) {
      print('Inserting $corder');
      DBProvider.db.createCorder(Corder.fromJson(corder));
    }).toList();
  }
}