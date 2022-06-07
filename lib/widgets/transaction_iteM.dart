import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Transaction.dart';


class TransactionIteM extends StatelessWidget{
  final List<Transaction> transactions;
  final Function deleteTransaction;
  final int index;
  TransactionIteM({required this.transactions, required this.deleteTransaction, required this.index});
  @override
  Widget build(BuildContext context) {
    return Card(elevation: 5,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 8
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: FittedBox(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("\$${transactions[index].amount}")),
                ),
              ),
              title: Text("${transactions[index].title}",
                style: Theme.of(context).textTheme.titleMedium,),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
              trailing: MediaQuery.of(context).size.width > 360 ? FlatButton.icon(onPressed: (){
                deleteTransaction(transactions[index].id);
              },
                  icon: Icon(Icons.delete),
                  textColor: Theme.of(context).errorColor,
                  label: Text("Delete")) :
              IconButton(
                onPressed: (){
                  deleteTransaction(transactions[index].id);
                },
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
            )
        )

    );
  }
}