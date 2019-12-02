import 'package:flutter/material.dart';
import 'package:zapp2/minibus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:provider/provider.dart';
//import 'directions_provider.dart';

class ListMini extends StatefulWidget {
  final LatLng posFrom;
  final LatLng posTo;

  const ListMini({this.posFrom, this.posTo});
  @override
  _ListMiniState createState() => _ListMiniState();
}

class _ListMiniState extends State<ListMini> {
  final List<Minibus> transactions = [
  ];

  void addNewTransaction() {
    for (int i = 0; i <= 2; i++) {
      final newTx = Minibus(
        linea: '123',
        tiempo: i.toString(),
      );
      setState(() {
        transactions.add(newTx);
      });
    }
  }
  // void dbconec() async{
  //   LatLng fromPointNear;
  //   LatLng toPointNear;
  //   var api = Provider.of<DirectionsProvider>(context);
    

  //   print('Near: $fromPointNear.latitude, $fromPointNear.longitude'); 
  //   way = await api.getData(fromPointNear);
  //   // for (int i = 0; i < way.length; i++) {
  //   //   print('hjhj');
  //   //   print(way[i]);
  //   // }
  //   api.findDirectons(fromPointNear, toPointNear, way)();
  // }


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
                                  child: Text(
                                      'Mins. ${transactions[index].tiempo}'),
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
                              onPressed: () {},
                            ),
                          ),
                        );
                      },
                      //itemCount: transactions.length,
                      // children: transactions.map((tx) {}).toList(),
                    ),
              //),
            ),
          ],
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => addNewTransaction(),
      ),
    );
  }
}
