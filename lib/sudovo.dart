import 'package:flutter/material.dart';
import 'main.dart';
import 'global.dart';

class Prdel extends StatefulWidget {
  Prdel();
  @override
  _prdel createState() => _prdel();
}

class _prdel extends State<Prdel> {
  @override
  Widget build(BuildContext context) {
    //final List<int> colorCodes = <int>[600, 500, 100];
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: workers.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 34,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Container(child:Row(children: [Column(children: [SizedBox(width:100, child: Column(children :[Text(workers[index].WorkerName)])),
              SizedBox(width:100, child:Column(children: [Text(workers[index].WorkerBarId)]))]
            )
            ])
          )));
        });
  }
}
