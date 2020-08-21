import 'dart:convert';

List<Corder> corderFromJson(String str) =>
    List<Corder>.from(json.decode(str).map((x) => Corder.fromJson(x)));

String corderToJson(List<Corder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Corder {
  String OrderBarId;
  String OrderName;
  int OrderId;
  DateTime OrderFinish;
  String OrderNote;

  Corder({
    this.OrderId, this.OrderBarId, this.OrderName, this.OrderFinish, this.OrderNote
  }) ;

  factory Corder.fromJson(Map<String, dynamic> json) => Corder(
    OrderBarId: json["id"],
    OrderName: json["name"],
    OrderNote: json["note"]
  );

  Map<String, dynamic> toJson() => {
    "id": OrderBarId,
    "name": OrderName,
    "note": OrderNote
  };


}