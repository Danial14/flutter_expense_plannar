import 'package:expense_planner/widgets/transaction_iteM.dart';
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
        itemBuilder: (ctx, ind){
          return TransactionIteM(transactions: transactions, deleteTransaction: deleteTransaction, index: ind,);

        }) : LayoutBuilder(builder: (context, constraints){
      return Column(
        children: <Widget>[
          Text("No transactions added yet"),
          SizedBox(
            height: 15,
          ),
          Container(
              height: constraints.maxHeight * 0.6,
              child: Image.asset("assets/images/waiting.png")
          )
        ],
      );
    });
  }
}