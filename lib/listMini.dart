import 'package:flutter/material.dart';
import 'package:zapp2/minibus.dart';

class ListMini extends StatelessWidget {
  final List<Minibus> transactions = [
    Minibus(
      linea: '123',
      tiempo: '50',
    ),
    Minibus(
      linea: '456',
      tiempo: '30',
    ),
    Minibus(
      linea: '789',
      tiempo: '30',
    ),
  ];

  //ListMini(this.transactions);
  //ListMini();
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
                          'No transactions added yet',
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
    );
  }
}
