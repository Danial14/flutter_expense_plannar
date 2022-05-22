import 'package:flutter/material.dart';
import 'transaction_list.dart';
import '../models/Transaction.dart';

class Usertransaction extends StatelessWidget{
  late List<Transaction> transactions;

  Usertransaction(List<Transaction> transactions){
    this.transactions = transactions;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(transactions: transactions,)
      ],
    );
  }
}