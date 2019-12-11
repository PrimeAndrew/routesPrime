import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zapp2/minibus.dart';
import 'dart:math';
import 'listMiniTest.dart';

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
                  builder: (context) => ListMiniTest(),
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

  // void createRecord() async {
  //   // 1
  //   await databaseReference.collection(db).document("1").setData({
  //     'line': '366',
  //   });
  //   await databaseReference
  //       .collection(db)
  //       .document("1")
  //       .collection('rutaida')
  //       .document('1')
  //       .setData({
  //     'point': GeoPoint(-16.506721, -68.139761),
  //   });

  //   // 2
  //   await databaseReference.collection(db).document("2").setData({
  //     'line': '259',
  //   });
  //   await databaseReference
  //       .collection(db)
  //       .document("2")
  //       .collection('rutaida')
  //       .document('1')
  //       .setData({
  //     'point': GeoPoint(-16.508943, -68.135652),
  //   });

  //   // DocumentReference ref = await databaseReference.collection(db).add({
  //   //   'title': 'Flutter in Action',
  //   //   'description': 'Complete Programming Guide to learn Flutter'
  //   // });
  //   // print(ref.documentID);
  // }

  void createRecord() async {
    // 1
    await databaseReference.collection('zapp3').document("777").setData(
      {
        '1': GeoPoint(-16.52232, -68.11375),
        '2': GeoPoint(-16.52273, -68.11301),
        '3': GeoPoint(-16.52312, -68.11232),
        '4': GeoPoint(-16.52353, -68.11157),
        '5': GeoPoint(-16.52392, -68.11083),
        '6': GeoPoint(-16.52435, -68.11008),
        '7': GeoPoint(-16.52476, -68.10933),
        '8': GeoPoint(-16.52517, -68.10861),
        '9': GeoPoint(-16.52558, -68.10784),
        '10': GeoPoint(-16.52587, -68.10728),
        '11': GeoPoint(-16.52628, -68.10654),
        '12': GeoPoint(-16.52668, -68.10582),
        '13': GeoPoint(-16.52711, -68.10503),
        '14': GeoPoint(-16.52769, -68.1054),
        '15': GeoPoint(-16.52827, -68.10575),
      },
    );
    await databaseReference.collection('zapp3').document("548").setData(
      {
        '1': GeoPoint(-16.52492, -68.11043),
        '2': GeoPoint(-16.52534, -68.10969),
        '3': GeoPoint(-16.52576, -68.10895),
        '4': GeoPoint(-16.52616, -68.10817),
        '5': GeoPoint(-16.52646, -68.10761),
        '6': GeoPoint(-16.52683, -68.10689),
        '7': GeoPoint(-16.52628, -68.10654),
        '8': GeoPoint(-16.5267, -68.10582),
        '9': GeoPoint(-16.5271, -68.10505),
        '10': GeoPoint(-16.5275, -68.10431),
        '11': GeoPoint(-16.52791, -68.10355),
        '12': GeoPoint(-16.52833, -68.10281),
        '13': GeoPoint(-16.52875, -68.10208),
        '14': GeoPoint(-16.52965, -68.10039),
        '15': GeoPoint(-16.53025, -68.10075),
        '16': GeoPoint(-16.5305, -68.10028),
        '17': GeoPoint(-16.53087, -68.0998),
        '18': GeoPoint(-16.53147, -68.09916),
        '19': GeoPoint(-16.53221, -68.09857),
        '20': GeoPoint(-16.53299, -68.098),
        '21': GeoPoint(-16.53457, -68.0967),
        '22': GeoPoint(-16.53583, -68.09601),
        '23': GeoPoint(-16.53678, -68.09567),
        '24': GeoPoint(-16.53777, -68.09524),
        '25': GeoPoint(-16.53862, -68.09491),
        '26': GeoPoint(-16.5395, -68.09459),
        '27': GeoPoint(-16.54031, -68.09426),
        '28': GeoPoint(-16.54127, -68.09377),
        '29': GeoPoint(-16.54166, -68.09329),
        '30': GeoPoint(-16.54158, -68.09259),
        '31': GeoPoint(-16.54119, -68.09142),
      },
    );
    

   
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
    final List<Minibus> datos = [];
    List<LatLng> puntosF = [];

    Firestore.instance.collection('zapp3').getDocuments().then(
      (QuerySnapshot docs) {
        docs.documents.forEach((f) {
          puntosF = [];
          // print(f.documentID);
          for (int i = 1; i <= f.data.length; i++) {
            print("${f.documentID}-----------------");
            // print(i);
            print(f.data['$i'].latitude);
            print(f.data['$i'].longitude);
            puntosF.add(LatLng(f.data['$i'].latitude, f.data['$i'].longitude));
            // var t = f.data['1'];
            // print(t);
          }
          datos.add(
            Minibus(
              linea: f.documentID,
              tiempo: '12',
              puntos: puntosF,
            ),
          );
          //print(puntosF);
        });
        print(datos[1].puntos[0]);
      },
    );
  }
}
