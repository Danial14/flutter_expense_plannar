import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget{
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList({required this.transactions, required this.deleteTransaction});
  @override
  Widget build(BuildContext context) {
    return transactions.length > 0 ? ListView.builder(
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
                  trailing: IconButton(
                    onPressed: (){
                      deleteTransaction(transactions[index].id);
                    },
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                  ),
                )
            )

          );
<<<<<<< HEAD
    }) : LayoutBuilder(builder: (context, constraints){
      return Column(
=======
    }) : LayoutBuilder(builder: (ctx, constraints){
      return Container(child: Column(
>>>>>>> 48066d95b93aef17dce7d33b75463dc7a93f81a0
        children: <Widget>[
          Text("No transactions added yet"),
          SizedBox(
            height: 15,
          ),
          Container(
              height: constraints.maxHeight * 0.6,
<<<<<<< HEAD
              child: Image.asset("assets/images/waiting.png")
          )
        ],
      );
=======
              child: Image.asset("assets/images/waiting.png", fit: BoxFit.cover,)
          )
        ],
      ));
>>>>>>> 48066d95b93aef17dce7d33b75463dc7a93f81a0
    });
  }
}