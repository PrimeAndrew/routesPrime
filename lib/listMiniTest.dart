import 'package:flutter/material.dart';
import 'package:zapp2/minibus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:zapp2/route_screen.dart';
import 'directions_provider.dart';

class ListMiniTest extends StatefulWidget {

  const ListMiniTest();
  @override
  _ListMiniTestState createState() => _ListMiniTestState();
}

class _ListMiniTestState extends State<ListMiniTest> {
  final List<Minibus> transactions = [];
  LatLng fromPoint;
  LatLng toPoint;

  void addNewTransaction() async {
    List<LatLng> puntosF = [];



    String time;
    await Firestore.instance.collection('zapp3').getDocuments().then(
      (QuerySnapshot docs) async {
        docs.documents.forEach((f) async {
          var api = Provider.of<DirectionsProvider>(context);
          //print(f.data['1'].latitude.toString());
          fromPoint=LatLng(f.data['1'].latitude, f.data['1'].longitude);
          toPoint= LatLng(f.data['${f.data.length}'].latitude, f.data['${f.data.length}'].longitude);
          print("=========================");
          print(fromPoint.latitude.toString()+"|fff|"+fromPoint.longitude.toString());
          print(toPoint.latitude.toString()+"|fff|"+toPoint.longitude.toString());

          //api.findDirectons(fromPoint, toPoint, puntosF);
          puntosF = [];
          for (int i = 1; i <= f.data.length; i++) {
            print(f.data['$i'].latitude.toString() +
                '|${f.documentID}|' +
                f.data['$i'].longitude.toString());


            puntosF.add(LatLng(f.data['$i'].latitude, f.data['$i'].longitude));
          }
            time = await api.findTime(fromPoint,toPoint);
            print(time);
            print(puntosF);
            final newTx = Minibus(
              linea: f.documentID,
              tiempo: time,
              puntos: puntosF,
            );
            setState(() {
              transactions.add(newTx);
            });
          
          print('___________________________________________________');
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    addNewTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Flutter App',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 350,
              child: transactions.isEmpty
                  ? Column(
                      children: <Widget>[
                        Text(
                          'No hay lineas',
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            height: 200,
                            child: Image.asset(
                              'assets/images/waiting.png',
                              fit: BoxFit.cover,
                            )),
                      ],
                    )
                  : ListView.builder(
                      itemBuilder: (ctx, index) {
                        return Card(
                          margin: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 5,
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: FittedBox(
                                  child: Text('${transactions[index].tiempo}'),
                                ),
                              ),
                            ),
                            title: Text(
                              'Linea: ${transactions[index].linea}',
                              style: Theme.of(context).textTheme.title,
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.map,
                                color: Theme.of(context).primaryColorLight,
                              ),
                              //onPressed: () => deleteTx(transactions[index].id),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RouteScreen(
                                      fromPoint: transactions[index].puntos[0],
                                      toPoint: transactions[index].puntos[transactions[index].puntos.length-1],
                                      points: transactions[index].puntos,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                      itemCount: transactions.length,
                      // children: transactions.map((tx) {}).toList(),
                    ),
              //),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.loop),
        onPressed: () => addNewTransaction(),
      ),
    );
  }
}
