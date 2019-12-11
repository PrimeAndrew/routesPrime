import 'package:flutter/material.dart';
import 'package:zapp2/minibus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:zapp2/route_screen.dart';
import 'directions_provider.dart';

class ListMini extends StatefulWidget {
  final LatLng posFrom;
  final LatLng posTo;

  const ListMini({this.posFrom, this.posTo});
  @override
  _ListMiniState createState() => _ListMiniState();
}

class _ListMiniState extends State<ListMini> {
  final List<Minibus> transactions = [];

  void addNewTransaction() async {
    List<LatLng> puntosF = [];

    LatLng fromPointNear;
    LatLng posFinal = LatLng(0.0, 0.0);
    LatLng toPointNear;
    int flag = -1;
    int cont = 0;
    String time;
    await Firestore.instance.collection('zapp3').getDocuments().then(
      (QuerySnapshot docs) async {
        docs.documents.forEach((f) async {
          cont = 0;
          var api = Provider.of<DirectionsProvider>(context);
          //var api2 = Provider.of<TimeProvider>(context);
          api.findDirectons(widget.posFrom, posFinal, puntosF);
          // api.findDirectons(widget.posFrom, widget.posTo, puntosF);

          puntosF = [];
          for (int i = 1; i <= f.data.length; i++) {
            print(f.data['$i'].latitude.toString() +
                '|${f.documentID}|' +
                f.data['$i'].longitude.toString());
            posFinal = LatLng(f.data['$i'].latitude, f.data['$i'].longitude);
            // print(posFromFinal);
            fromPointNear = api.getFromPointNear2(widget.posFrom, posFinal);
            toPointNear = api.getFromPointNear2(widget.posTo, posFinal);
            // print('$toPointNear');
            print('Near: $fromPointNear , $toPointNear, $flag');

            if (fromPointNear != null || toPointNear != null) {
              cont++;
              print('puntoP------------');
              flag *= -1;
              puntosF
                  .add(LatLng(f.data['$i'].latitude, f.data['$i'].longitude));
            } else {
              if (flag == 1) {
                print('puntoM------------');
                puntosF
                    .add(LatLng(f.data['$i'].latitude, f.data['$i'].longitude));
              }
            }
          }
          if (puntosF.isNotEmpty && cont == 2) {
            print('+++++++++++++');
            time = await api.findTime(widget.posFrom, widget.posTo);
            // print(time);
            //api.findTime(widget.posFrom, posFinal).toString();
            print(puntosF);
            final newTx = Minibus(
              linea: f.documentID,
              tiempo: time,
              puntos: puntosF,
            );
            setState(() {
              transactions.add(newTx);
            });
          }
          flag = -1;
          print('___________________________________________________');
          //print(puntosF);
        });
        // print(transactions);
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
                              backgroundImage: NetworkImage(
                                  'http://www.thevacollective.com/wp-content/uploads/2017/07/Road-Icon-Homepage-260x260.png'),
                              radius: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                // child: FittedBox(
                                //   child: Text(
                                //       '${transactions[index].tiempo}'),
                                // ),
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
                                      toPoint: widget.posTo,
                                      fromPoint: widget.posFrom,
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
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.loop),
      //   onPressed: () => addNewTransaction(),
      // ),
    );
  }
}
