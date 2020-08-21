import 'package:flutter/material.dart';
import 'sudovo.dart';
import 'global.dart';
import 'datamodule.dart';
import 'package:flutter_app/src/providers/corder_api_provider.dart';
import 'package:flutter_app/src/providers/db_provider.dart';


void main() {
  makeSampleData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'eMISTR'),
    );
  }
}

Future<int> aaa() {
  //
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isLoading = false;
  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var apiProvider = CorderApiProvider();
    await apiProvider.getAllCorders();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  _deleteData() async {
    setState(() {
      isLoading = true;
    });

    await DBProvider.db.deleteAllCorders();

    // wait for 1 second to simulate loading of data
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isLoading = false;
    });

    print('All employees deleted');
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
          title:Column(
              children: [Icon(Icons.account_balance),Text('eMISTR Výroba online')]),

          ),
          body: TabBarView(
            children: [
              Prdel(),
              //Icon(Icons.directions_car),
            ListView.builder(
             padding: const EdgeInsets.all(8),
             itemCount: operations.length,
             itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 30,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('${operations[index].OperationName}')),
              );
            }
           ),
              //Icon(Icons.directions_transit),

              //Icon(Icons.directions_bike),
                Container(
                  padding: EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.settings_input_antenna),
                    onPressed: () async {
                      await _loadFromApi();
                    },
                  ),
                ),

            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car), text: 'jetel '
                  'zelený'),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
            labelColor: Colors.green,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(2.0),
            indicatorColor: Colors.green
          ),
        ),
      ),
    );
  }
}
