final List<int> colorCodes = <int>[600, 500, 100];
List<Worker> workers = List<Worker>();
List<Order> orders = List<Order>();
List<Operation> operations = List<Operation>();

class Worker {
  String WorkerName;
  String WorkerBarId;
  int WorkerId;
  String WorkerPin;
}

class Order {
  String OrderBarId;
  String OrderName;
  int OrderId;
  DateTime OrderFinish;
}

class Operation {
  String OperationBarId;
  String OperationName;
  int OperationId;
}

class DataRow {
  List<Worker> DataWorkers;
  String DataOrderBarId;
  int DataOperationId;
}
