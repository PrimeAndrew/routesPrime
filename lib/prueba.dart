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
        '6': GeoPoint(-16.5081962, -68.1196716),
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
    // '1': GeoPoint(),
    // 970
    await databaseReference.collection('zapp3').document("970").setData(
      {
        '1': GeoPoint(-16.5030141, -68.1352641),
        '2': GeoPoint(-16.50251, -68.1358005),
        '3': GeoPoint(-16.501898, -68.1351622),
        '4': GeoPoint(-16.5011162, -68.1344863),
        '5': GeoPoint(-16.5003909, -68.1340303),
        '6': GeoPoint(-16.4993159, -68.1333705),
        '7': GeoPoint(-16.5, -68.1319704),
        '8': GeoPoint(-16.5007407, -68.1303771),
        '9': GeoPoint(-16.5002983, -68.1292613),
        '10': GeoPoint(-16.5002109, -68.1283226),
        '11': GeoPoint(-16.5005504, -68.1274535),
        '12': GeoPoint(-16.500679, -68.126724),
        '13': GeoPoint(-16.5003652, -68.1260212),
        '14': GeoPoint(-16.5000309, -68.1253614),
        '15': GeoPoint(-16.4997634, -68.1247338),
        '16': GeoPoint(-16.4997017, -68.1244119),
        '17': GeoPoint(-16.4997943, -68.1241061),
        '18': GeoPoint(-16.499892, -68.1237682),
        '19': GeoPoint(-16.4999434, -68.1235375),
        '20': GeoPoint(-16.5001749, -68.1232424),
        '21': GeoPoint(-16.5004218, -68.1230601),
        '22': GeoPoint(-16.5005452, -68.122765),
        '23': GeoPoint(-16.5005247, -68.1224378),
        '24': GeoPoint(-16.5004012, -68.1221588),
        '25': GeoPoint(-16.5002161, -68.1219711),
        '26': GeoPoint(-16.4999537, -68.1218852),
        '27': GeoPoint(-16.4994702, -68.1219121),
        '28': GeoPoint(-16.4994497, -68.1214454),
        '29': GeoPoint(-16.4993879, -68.1209626),
        '30': GeoPoint(-16.4986061, -68.1210108),
        '31': GeoPoint(-16.4980815, -68.1210645),
        '32': GeoPoint(-16.4969653, -68.121102),
        '33': GeoPoint(-16.4961372, -68.1211181),
        '34': GeoPoint(-16.495412, -68.1211664),
        '35': GeoPoint(-16.4946661, -68.1212362),
        '36': GeoPoint(-16.494553, -68.1211181),
        '37': GeoPoint(-16.4951445, -68.1207104),
        '38': GeoPoint(-16.4958337, -68.1202974),
        '39': GeoPoint(-16.4963532, -68.1199487),
        '40': GeoPoint(-16.4968573, -68.1196268),
        '41': GeoPoint(-16.4974025, -68.1193318),
        '42': GeoPoint(-16.4979117, -68.1189455),
        '43': GeoPoint(-16.4986524, -68.1184681),
        '44': GeoPoint(-16.4997994, -68.1183662),
        '45': GeoPoint(-16.5013888, -68.1191601),
        '46': GeoPoint(-16.5025666, -68.1197288),
        '47': GeoPoint(-16.5028907, -68.1199004),
        '48': GeoPoint(-16.5039708, -68.1204315),
        '49': GeoPoint(-16.5039862, -68.1213005),
        '50': GeoPoint(-16.5046651, -68.1209357),
        '51': GeoPoint(-16.504948, -68.1207748),
        '52': GeoPoint(-16.505843, -68.120233),
        '53': GeoPoint(-16.5064036, -68.1200077),
        '54': GeoPoint(-16.5071082, -68.1199058),
        '55': GeoPoint(-16.5076226, -68.1198146),
        '56': GeoPoint(-16.5081626, -68.1196215),
        '57': GeoPoint(-16.5087489, -68.1193801),
        '58': GeoPoint(-16.5093353, -68.1191655),
        '59': GeoPoint(-16.5098136, -68.1189402),
        '60': GeoPoint(-16.5106314, -68.11857),
        '61': GeoPoint(-16.5113103, -68.1182428),
        '62': GeoPoint(-16.5118915, -68.1179531),
        '63': GeoPoint(-16.5121538, -68.1176635),
        '64': GeoPoint(-16.5124161, -68.1177439),
        '65': GeoPoint(-16.5126064, -68.1176205),
        '66': GeoPoint(-16.5129715, -68.117465),
        '67': GeoPoint(-16.5134732, -68.1172737),
        '68': GeoPoint(-16.5139384, -68.1170358),
        '69': GeoPoint(-16.5141699, -68.1169393),
        '70': GeoPoint(-16.5147613, -68.1167998),
        '71': GeoPoint(-16.5153014, -68.1166549),
        '72': GeoPoint(-16.51579, -68.1164886),
        '73': GeoPoint(-16.5162888, -68.1162097),
        '74': GeoPoint(-16.5168289, -68.1160434),
        '75': GeoPoint(-16.5173483, -68.1160702),
        '76': GeoPoint(-16.5178472, -68.1160434),
        '77': GeoPoint(-16.5178678, -68.1158235),
        '78': GeoPoint(-16.5175797, -68.115743),
        '79': GeoPoint(-16.5169883, -68.1157215),
        '80': GeoPoint(-16.5164637, -68.1156947),
        '81': GeoPoint(-16.5159237, -68.1156625),
        '82': GeoPoint(-16.5155122, -68.1156411),
        '83': GeoPoint(-16.5153785, -68.1153836),
        '84': GeoPoint(-16.5155431, -68.1150939),
        '85': GeoPoint(-16.5161037, -68.1150349),
        '86': GeoPoint(-16.516798, -68.1148525),
        '87': GeoPoint(-16.5172609, -68.1147345),
        '88': GeoPoint(-16.5176672, -68.1146165),
        '89': GeoPoint(-16.5181918, -68.1146111),
        '90': GeoPoint(-16.5186701, -68.1145735),
        '91': GeoPoint(-16.5189684, -68.1145414),
        '92': GeoPoint(-16.5193901, -68.1146057),
        '93': GeoPoint(-16.5197244, -68.1147291),
        '94': GeoPoint(-16.5200021, -68.1146808),
        '95': GeoPoint(-16.5204753, -68.114772),
        '96': GeoPoint(-16.5209381, -68.1149115),
        '97': GeoPoint(-16.521473, -68.1149491),
        '98': GeoPoint(-16.5220439, -68.1149115),
        '99': GeoPoint(-16.5222239, -68.1151529),
        '100': GeoPoint(-16.5227279, -68.1146755),
        '101': GeoPoint(-16.5231496, -68.1142731),
        '102': GeoPoint(-16.5235867, -68.1138601),
        '103': GeoPoint(-16.523957, -68.1135597),
        '104': GeoPoint(-16.524353, -68.1131091),
        '105': GeoPoint(-16.5247387, -68.1123473),
        '106': GeoPoint(-16.5251502, -68.1115373),
        '107': GeoPoint(-16.5255204, -68.1107809),
        '108': GeoPoint(-16.525937, -68.1100084),
        '109': GeoPoint(-16.5263793, -68.1093057),
        '110': GeoPoint(-16.5267393, -68.1085278),
        '111': GeoPoint(-16.5270736, -68.1079646),
        '112': GeoPoint(-16.5274798, -68.1072672),
        '113': GeoPoint(-16.527773, -68.1067522),
        '114': GeoPoint(-16.5282781, -68.1057554),
        '115': GeoPoint(-16.5287193, -68.1049927),
        '116': GeoPoint(-16.529105, -68.10429),
        '117': GeoPoint(-16.5285408, -68.1039414),
        '118': GeoPoint(-16.528938, -68.1031384),
        '119': GeoPoint(-16.5293518, -68.1023641),
        '120': GeoPoint(-16.5298483, -68.1014701),
        '121': GeoPoint(-16.5302391, -68.1006869),
        '122': GeoPoint(-16.5305501, -68.1002076),
        '123': GeoPoint(-16.5311826, -68.0994244),
        '124': GeoPoint(-16.5317637, -68.0989094),
        '125': GeoPoint(-16.5323911, -68.0984427),
        '126': GeoPoint(-16.532998, -68.0979599),
        '127': GeoPoint(-16.5342939, -68.0970104),
        '128': GeoPoint(-16.5350807, -68.0963506),
        '129': GeoPoint(-16.5359292, -68.0960395),
        '130': GeoPoint(-16.5364538, -68.0958195),
        '131': GeoPoint(-16.5370092, -68.0955942),
        '132': GeoPoint(-16.5375337, -68.0953958),
        '133': GeoPoint(-16.5379605, -68.0951865),
        '134': GeoPoint(-16.5385056, -68.0949988),
        '135': GeoPoint(-16.5389788, -68.0947949),
        '136': GeoPoint(-16.5394313, -68.094634),
        '137': GeoPoint(-16.5398324, -68.0944892),
        '138': GeoPoint(-16.5403177, -68.0942671),
        '139': GeoPoint(-16.5408969, -68.0940332),
        '140': GeoPoint(-16.5416168, -68.0935182),
        '141': GeoPoint(-16.5417248, -68.0929174),
        '142': GeoPoint(-16.54155, -68.092279),
        '143': GeoPoint(-16.5413134, -68.0914422),
        '144': GeoPoint(-16.5410219, -68.0904445),
        '145': GeoPoint(-16.5407066, -68.0894466),
        '146': GeoPoint(-16.5404459, -68.0883604),
        '147': GeoPoint(-16.5401605, -68.0873653),
        '148': GeoPoint(-16.539852, -68.0863648),
        '149': GeoPoint(-16.5395845, -68.0853724),
        '150': GeoPoint(-16.5390867, -68.0855199),
        '151': GeoPoint(-16.5393644, -68.0865176),
        '152': GeoPoint(-16.5387422, -68.0866678),
        '153': GeoPoint(-16.5376109, -68.0872418),
        '154': GeoPoint(-16.5365515, -68.086818),
        '155': GeoPoint(-16.5356927, -68.0865176),
        '156': GeoPoint(-16.5348647, -68.0863245),
        '157': GeoPoint(-16.5340522, -68.0862119),
        '158': GeoPoint(-16.5333117, -68.0861153),
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
