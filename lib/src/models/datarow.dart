import 'dart:convert';
import 'worker.dart';

List<DataRow> corderFromJson(String str) =>
    List<DataRow>.from(json.decode(str).map((x) => DataRow.fromJson(x)));

String corderToJson(List<DataRow> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataRow {
  List<Worker> DataWorkers;
  String DataOrderBarId;
  int DataOperationId;

  DataRow({
    this.DataWorkers, this.DataOrderBarId, this.DataOperationId
  }) ;

  factory DataRow.fromJson(Map<String, dynamic> json) => DataRow(
      DataWorkers: json["id"],
      DataOrderBarId: json["name"]
  );

  Map<String, dynamic> toJson() => {
    "id": DataWorkers,
    "name": DataOrderBarId
  };
}