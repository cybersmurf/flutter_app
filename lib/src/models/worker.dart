import 'dart:convert';

List<Worker> corderFromJson(String str) =>
    List<Worker>.from(json.decode(str).map((x) => Worker.fromJson(x)));

String corderToJson(List<Worker> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Worker {
  String WorkerName;
  String WorkerBarId;
  int WorkerId;
  String WorkerPin;


  Worker({
    this.WorkerId, this.WorkerBarId, this.WorkerName, this.WorkerPin
  }) ;

  factory Worker.fromJson(Map<String, dynamic> json) => Worker(
      WorkerId: json["id"],
      WorkerName: json["name"]
  );

  Map<String, dynamic> toJson() => {
    "id": WorkerId,
    "name": WorkerName
  };
}