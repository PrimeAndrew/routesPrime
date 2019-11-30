import 'package:flutter/material.dart';
import 'package:zapp2/minibus.dart';

class ListMini extends StatelessWidget {
  final List<Minibus> transactions;

  ListMini(this.transactions);
  @override
  Widget build(BuildContext context) {


  
    return Container(
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
                          //child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      "hola",
                      //transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      "fecha"
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                        color: Theme.of(context).errorColor,
                      ),
                      //onPressed: () => deleteTx(transactions[index].id),
                      onPressed:  (){},
                    ),
                  ),
                );
              },
              //itemCount: transactions.length,
              // children: transactions.map((tx) {}).toList(),
            ),
      //),
    );
  }
  
}