import 'package:flutter/material.dart';
import 'package:zapp2/from_point.dart';
import 'package:provider/provider.dart';
import 'package:zapp2/prueba.dart';
import 'directions_provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => DirectionsProvider(),
      child: MaterialApp(
        initialRoute: '/',
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Open route'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FromPoint()),
                  // MaterialPageRoute(builder: (context) => Prueba()),
                );
              },
            ),
            RaisedButton(
              child: Text('Manage'),
              onPressed: () {
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => FromPoint()),
                  MaterialPageRoute(builder: (context) => Prueba()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
