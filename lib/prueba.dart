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
  TextEditingController txtController = TextEditingController();

  final databaseReference = Firestore.instance;
  final db = 'zapp2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin menu"),
      ),
      body: Center(
          child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            child: Text('Create Record'),
            onPressed: () {
              createRecord();
            },
          ),

          // Row(
          //   children: <Widget>[
          Container(
            width: 70,
            child: TextField(
              controller: txtController,
              keyboardType: TextInputType.numberWithOptions(decimal: false),
            ),
          ),
          RaisedButton(
            child: Text('Delete Record'),
            onPressed: () {
              deleteData(txtController.text);
            },
          ),
          //   ],
          // ),

          RaisedButton(
            child: Text('List lines'),
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
            child: Text('View Record by console'),
            onPressed: () {
              getData();
            },
          ),
          // RaisedButton(
          //   child: Text('Update Record'),
          //   onPressed: () {
          //     updateData();
          //   },
          // ),

          RaisedButton(
            child: Text('Test all point by console'),
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
    // '1': GeoPoint(),
    // 777
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
    // 548
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

    // 245
    await databaseReference.collection('zapp3').document("245").setData(
      {
        '1': GeoPoint(-16.5048274, -68.1209161),
        '2': GeoPoint(-16.5055526, -68.1204762),
        '3': GeoPoint(-16.5060978, -68.1201705),
        '4': GeoPoint(-16.5066687, -68.1199666),
        '5': GeoPoint(-16.5074505, -68.1198862),
        '6': GeoPoint(
          -16.5081962,
          -68.1196716,
        ),
        '7': GeoPoint(-16.5087569, -68.1194355),
        '8': GeoPoint(-16.5093329, -68.1192049),
        '9': GeoPoint(-16.5103461, -68.1187811),
        '10': GeoPoint(-16.5112873, -68.1183358),
        '11': GeoPoint(-16.5119251, -68.1179979),
        '12': GeoPoint(-16.512352, -68.1175097),
        '13': GeoPoint(-16.5128406, -68.1175097),
        '14': GeoPoint(-16.5134732, -68.1172737),
        '15': GeoPoint(-16.5141881, -68.1169035),
        '16': GeoPoint(-16.5150213, -68.1166997),
        '17': GeoPoint(-16.515839, -68.1163832),
        '18': GeoPoint(-16.5165025, -68.1160989),
        '19': GeoPoint(-16.5171042, -68.116013),
        '20': GeoPoint(-16.5176957, -68.1161284),
        '21': GeoPoint(-16.5179014, -68.1159406),
        '22': GeoPoint(-16.5176982, -68.1157314),
        '23': GeoPoint(-16.5173665, -68.1157234),
        '24': GeoPoint(-16.5163328, -68.1156965),
        '25': GeoPoint(-16.515695, -68.1156858),
        '26': GeoPoint(-16.5153453, -68.1154981),
        '27': GeoPoint(-16.5155819, -68.1151011),
        '28': GeoPoint(-16.5162813, -68.1149938),
        '29': GeoPoint(-16.5171094, -68.114747),
        '30': GeoPoint(-16.5179734, -68.1145593),
        '31': GeoPoint(-16.5188014, -68.114511),
        '32': GeoPoint(-16.5193363, -68.1146129),
        '33': GeoPoint(-16.5198454, -68.1147739),
        '34': GeoPoint(-16.5201489, -68.1146129),
        '35': GeoPoint(-16.520694, -68.114849),
        '36': GeoPoint(-16.5211775, -68.1149455),
        '37': GeoPoint(-16.5216352, -68.1149455),
        '38': GeoPoint(-16.5220826, -68.1149133),
        '39': GeoPoint(-16.5225198, -68.1146827),
        '40': GeoPoint(-16.5228798, -68.114216),
        '41': GeoPoint(-16.5232552, -68.1134703),
        '42': GeoPoint(-16.5237078, -68.112671),
        '43': GeoPoint(-16.5241244, -68.1119522),
        '44': GeoPoint(-16.5245358, -68.1111851),
        '45': GeoPoint(-16.5249251, -68.1104335),
        '46': GeoPoint(-16.5253453, -68.1096921),
        '47': GeoPoint(-16.5257644, -68.1089598),
        '48': GeoPoint(-16.5261604, -68.1081793),
        '49': GeoPoint(-16.5264613, -68.1076134),
        '50': GeoPoint(-16.5258777, -68.1072814),
        '51': GeoPoint(-16.5262827, -68.1065491),
        '52': GeoPoint(-16.5267018, -68.1058238),
        '53': GeoPoint(-16.5272821, -68.1061264),
        '54': GeoPoint(-16.527714, -68.1053647),
        '55': GeoPoint(-16.5280998, -68.1046619),
        '56': GeoPoint(-16.5285009, -68.1039377),
        '57': GeoPoint(-16.528938, -68.1031384),
        '58': GeoPoint(-16.5293392, -68.1024035),
        '59': GeoPoint(-16.5298483, -68.1014701),
        '60': GeoPoint(-16.5302391, -68.1006869),
      },
    );

    // '1': GeoPoint(),
    // 480
    await databaseReference.collection('zapp3').document("480").setData(
      {
        '1': GeoPoint(-16.5276944, -68.1054041),
        '2': GeoPoint(-16.5280998, -68.1046619),
        '3': GeoPoint(-16.5285408, -68.1039414),
        '4': GeoPoint(-16.5289419, -68.1031582),
        '5': GeoPoint(-16.5293392, -68.1024035),
        '6': GeoPoint(-16.5298483, -68.1014701),
        '7': GeoPoint(-16.5302045, -68.100712),
        '8': GeoPoint(-16.5306442, -68.1000414),
        '9': GeoPoint(-16.5311405, -68.0994728),
        '10': GeoPoint(-16.5316599, -68.0990436),
        '11': GeoPoint(-16.532169, -68.0986359),
        '12': GeoPoint(-16.5326318, -68.0983034),
        '13': GeoPoint(-16.5330741, -68.0980298),
        '14': GeoPoint(-16.5334804, -68.097673),
        '15': GeoPoint(-16.5339972, -68.0972546),
        '16': GeoPoint(-16.5344575, -68.0969167),
        '17': GeoPoint(-16.5348534, -68.0965975),
        '18': GeoPoint(-16.5352751, -68.0963105),
        '19': GeoPoint(-16.5357714, -68.0961254),
        '20': GeoPoint(-16.5362214, -68.095935),
        '21': GeoPoint(-16.5366816, -68.0957204),
        '22': GeoPoint(-16.5371136, -68.0955997),
        '23': GeoPoint(-16.5375687, -68.0953771),
        '24': GeoPoint(-16.5380418, -68.0951839),
        '25': GeoPoint(-16.5387103, -68.0949104),
        '26': GeoPoint(-16.5393403, -68.094669),
        '27': GeoPoint(-16.5398905, -68.0944732),
        '28': GeoPoint(-16.5404536, -68.0942479),
        '29': GeoPoint(-16.5410296, -68.0940118),
        '30': GeoPoint(-16.5414564, -68.0936846),
        '31': GeoPoint(-16.5417161, -68.0932849),
        '32': GeoPoint(-16.5417058, -68.0927995),
        '33': GeoPoint(-16.5415412, -68.0923301),
        '34': GeoPoint(-16.541369, -68.0916863),
        '35': GeoPoint(-16.5412636, -68.0912947),
        '36': GeoPoint(-16.5410219, -68.0904445),
        '37': GeoPoint(-16.5407133, -68.0894011),
        '38': GeoPoint(-16.5404459, -68.0883604),
        '39': GeoPoint(-16.5401605, -68.0873653),
        '30': GeoPoint(-16.539852, -68.0863648),
        '31': GeoPoint(-16.5395845, -68.0853724),
        '32': GeoPoint(-16.5392554, -68.0841681),
        '33': GeoPoint(-16.5390317, -68.0833956),
        '34': GeoPoint(-16.5388363, -68.0827412),
        '35': GeoPoint(-16.5388029, -68.0821699),
        '36': GeoPoint(-16.5388492, -68.0810836),
        '37': GeoPoint(-16.5388955, -68.0799624),
        '38': GeoPoint(-16.5389623, -68.0788466),
        '39': GeoPoint(-16.5390137, -68.078058),
      },
    );
    // '1': GeoPoint(),
    // 197
    await databaseReference.collection('zapp3').document("197").setData(
      {
        '1': GeoPoint(-16.5231291, -68.1123244),
        '2': GeoPoint(-16.5237078, -68.112671),
        '3': GeoPoint(-16.5241244, -68.1119522),
        '4': GeoPoint(-16.5235524, -68.1116083),
        '5': GeoPoint(-16.5239228, -68.1108343),
        '6': GeoPoint(-16.5245358, -68.1111851),
        '7': GeoPoint(-16.5249251, -68.1104335),
        '8': GeoPoint(-16.5242981, -68.1101116),
        '9': GeoPoint(-16.5247637, -68.1093349),
        '10': GeoPoint(-16.5253453, -68.1096921),
        '11': GeoPoint(-16.5257644, -68.1089598),
        '12': GeoPoint(-16.5251724, -68.1085828),
        '13': GeoPoint(-16.525913, -68.1072685),
        '14': GeoPoint(-16.5264613, -68.1076134),
        '15': GeoPoint(-16.5268747, -68.1069091),
        '16': GeoPoint(-16.5263193, -68.1065604),
        '17': GeoPoint(-16.526741, -68.1058201),
        '18': GeoPoint(-16.5272758, -68.1061795),
        '19': GeoPoint(-16.5276944, -68.1054041),
        '20': GeoPoint(-16.5271107, -68.1050355),
        '21': GeoPoint(-16.5275124, -68.1042805),
        '22': GeoPoint(-16.5280998, -68.1046619),
        '23': GeoPoint(-16.5285461, -68.1038943),
        '24': GeoPoint(-16.5279701, -68.1035563),
        '25': GeoPoint(-16.5283398, -68.1028143),
        '26': GeoPoint(-16.528938, -68.1031384),
        '27': GeoPoint(-16.5293844, -68.1023869),
        '28': GeoPoint(-16.5287827, -68.1020382),
        '29': GeoPoint(-16.5296585, -68.1003979),
        '30': GeoPoint(-16.5302391, -68.1006869),
        '31': GeoPoint(-16.530706, -68.1000051),
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

  void deleteData(String cad) {
    try {
      databaseReference.collection('zapp3').document(cad).delete();
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
