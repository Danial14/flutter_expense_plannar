import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Transaction.dart';
import 'dart:math';


class TransactionIteM extends StatefulWidget{
  final List<Transaction> transactions;
  final Function deleteTransaction;
  final int index;
  TransactionIteM({required Key key, required this.transactions, required this.deleteTransaction, required this.index}) :
        super(key: key);
  @override
  State<TransactionIteM> createState() {
    return TransactionIteMState();
  }
}
class TransactionIteMState extends State<TransactionIteM>{
  late final List<Color> backgroundColors;
  late Color _backgroundColor;
  @override
  void initState() {
    super.initState();
    backgroundColors = [Colors.green, Colors.greenAccent, Colors.blue, Colors.lightBlueAccent, Colors.red, Colors.redAccent];
    _backgroundColor = backgroundColors[Random().nextInt(backgroundColors.length)];
  }
  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = widget.transactions;
    final int index = widget.index;
    final Function deleteTransaction = widget.deleteTransaction;
    return Card(elevation: 5,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 8
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: _backgroundColor,
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