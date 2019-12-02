import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:zapp2/minibus.dart';
import 'dart:math';

import 'listMini.dart';

class Prueba extends StatefulWidget {
  // final LatLng cad1;
  // final LatLng cad2;

  // const Prueba({this.cad1, this.cad2});

  @override
  _PruebaState createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  final databaseReference = Firestore.instance;
  final db = 'zapp2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOla"),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            child: Text('Create Record'),
            onPressed: () {
              createRecord();
            },
          ),
          RaisedButton(
            child: Text('View Record'),
            onPressed: () {
              getData();
            },
          ),
          RaisedButton(
            child: Text('Update Record'),
            onPressed: () {
              updateData();
            },
          ),
          RaisedButton(
            child: Text('Delete Record'),
            onPressed: () {
              deleteData();
            },
          ),
          RaisedButton(
            child: Text('List'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListMini(),
                ),
              );
            },
          ),
          RaisedButton(
            child: Text('encontrar'),
            onPressed: () {
              encontrar();
            },
          ),
        ],
      )), //center
    );
  }

  void createRecord() async {
    // 1
    await databaseReference.collection(db).document("1").setData({
      'line': '366',
    });
    await databaseReference
        .collection(db)
        .document("1")
        .collection('rutaida')
        .document('1')
        .setData({
      'point': GeoPoint(-16.506721, -68.139761),
    });

    // 2
    await databaseReference.collection(db).document("2").setData({
      'line': '259',
    });
    await databaseReference
        .collection(db)
        .document("2")
        .collection('rutaida')
        .document('1')
        .setData({
      'point': GeoPoint(-16.508943, -68.135652),
    });

    // DocumentReference ref = await databaseReference.collection(db).add({
    //   'title': 'Flutter in Action',
    //   'description': 'Complete Programming Guide to learn Flutter'
    // });
    // print(ref.documentID);
  }

  void getData() {
    // databaseReference
    //     .collection("books")
    //     .getDocuments()
    //     .then((QuerySnapshot snapshot) {
    //   snapshot.documents.forEach(
    //     (f) => print('${f.data}}'),
    //   );
    // });

    // databaseReference
    //     .collection(db)
    //     .document('1')
    //     .collection('rutaida')
    //     .document('1')
    //     .get()
    //     .then((DocumentSnapshot ds) {
    //       var x = ds['point'].latitude;
    //       print(x);
    //     });
    var c = 1;
    Firestore.instance
        .collection(db)
        .document('2')
        .collection('rutaida')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach(
        (f) {
          print(c);
          print('lat: ${f.data['point'].latitude.toString()}');
          print('lng: ${f.data['point'].longitude.toString()}');
          c++;
        },
      );
    });
  }

  void updateData() {
    try {
      databaseReference
          .collection(db)
          .document('1')
          .updateData({'description': 'Head First Flutter'});
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteData() {
    try {
      databaseReference.collection(db).document('1').delete();
    } catch (e) {
      print(e.toString());
    }
  }

  void radioLine() {
    var centerPointlat = -16.507162;
    var centerPointlng = -68.136556;

//   var checkPointlat = -16.506766;
//   var checkPointlng = -68.136754;

    var checkPointlat = -16.506709;
    var checkPointlng = -68.136832;

    var m = 50;
    var km = m / 1000;
    var ky = 40000 / 360;
    var kx = cos(pi * centerPointlat / 180.0) * ky;
    var dx = (centerPointlng - checkPointlng).abs() * kx;
    var dy = (centerPointlat - checkPointlat).abs() * ky;

    if (sqrt(dx * dx + dy * dy) <= km) {
      print('Yes');
    } else {
      print('no');
    }
  }

  void encontrar() {
    // final List<Minibus> datos = [
    //   Minibus(
    //     linea: '312',
    //     tiempo: '30',
    //     puntos: [LatLng(12, 21), LatLng(13, 31)],
    //   ),
    // ];
    // var datoss = [
    //   {
    //     'linea': 'hola',
    //     'puntos': [LatLng(12, 21), LatLng(13, 31)],
    //   }
    // ];
    List<LatLng> puntosF = [];
    print("f");

    Firestore.instance.collection('zapp3').getDocuments().then(
      (QuerySnapshot docs) {
        docs.documents.forEach((f) {
          // Minibus(
          //   linea: f.documentID,
          //   tiempo: '12',
          //   puntos:
          // );
          //print(f.data.length);
          for (int i =1 ;i<=f.data.length;i++) {
            print("---------------");
            print(i);
            // print(f.data['$i'].latitude);
            // print(f.data['$i'].longitude);
            puntosF.add(LatLng(f.data['$i'].latitude,f.data['$i'].longitude));
            // var t = f.data['1'];
            // print(t);
          }
        });
        print(puntosF);
      },
    );
    
  }
}
