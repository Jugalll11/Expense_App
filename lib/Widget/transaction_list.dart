// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:expense_app/Models/transaction.dart';
import 'package:flutter/material.dart';
import '../Models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;
  TransactionList(this.transactions, this.deletetx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'You have No Transactions Added Yet',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  height: 200,
                  child: Image.asset(
                    'Assets/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  //   return Card(
                  //   elevation: 5,
                  //   shadowColor: Theme.of(context).shadowColor,
                  //   color: Theme.of(context).cardColor,
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         padding: EdgeInsets.all(10),
                  //         child: Card(
                  //             color: Theme.of(context).cardColor,
                  //             child: Container(
                  //                 padding: EdgeInsets.all(10),
                  //                 decoration: BoxDecoration(
                  //                     border: Border.all(
                  //                         color: Theme.of(context).primaryColor,
                  //                         width: 1)),
                  //                 child: Text(
                  //                     '\$${transactions[index].amount.toStringAsFixed(2)}',
                  //                     style: TextStyle(
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Theme.of(context).primaryColor,
                  //                         backgroundColor:
                  //                             Theme.of(context).cardColor,
                  //                         fontSize: 20)))),
                  //       ),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Container(
                  //             padding: EdgeInsets.all(2),
                  //             child: Center(
                  //                 child: Text(transactions[index].title,
                  //                     style: TextStyle(
                  //                         color: Theme.of(context).primaryColor,
                  //                         backgroundColor:
                  //                             Theme.of(context).cardColor,
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.bold))),
                  //           ),
                  //           Container(
                  //             padding: EdgeInsets.all(1),
                  //             child: Center(
                  //                 child: Text(
                  //               DateFormat.yMMMMd()
                  //                   .format(transactions[index].date),
                  //               style: TextStyle(
                  //                   backgroundColor: Theme.of(context).cardColor,
                  //                   color: Theme.of(context).primaryColor,
                  //                   fontStyle: FontStyle.italic),
                  //             )),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // )
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: IconButton(
                      onPressed: () => deletetx(transactions[index].id),
                      icon: Icon(Icons.delete),
                      color: Colors.redAccent,
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
