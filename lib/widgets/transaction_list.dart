import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget{
  final List<Transaction> transactions;
  TransactionList({required this.transactions});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.length > 0 ? ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index){
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
                )
            )

          );
    }) : Column(
        children: <Widget>[
          Text("No transactions added yet"),
          SizedBox(
            height: 15,
          ),
          Container(
              height: 300,
              child: Image.asset("assets/images/waiting.png")
          )
        ],
      )
    );
  }
}