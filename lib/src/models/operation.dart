import 'dart:convert';

List<Operation> corderFromJson(String str) =>
    List<Operation>.from(json.decode(str).map((x) => Operation.fromJson(x)));

String corderToJson(List<Operation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Operation {
  String OperationBarId;
  String OperationName;
  int OperationId;



  Operation({
    this.OperationId, this.OperationBarId, this.OperationName
  }) ;

  factory Operation.fromJson(Map<String, dynamic> json) => Operation(
      OperationBarId: json["id"],
      OperationName: json["name"]
  );

  Map<String, dynamic> toJson() => {
    "id": OperationBarId,
    "name": OperationName
  };
}