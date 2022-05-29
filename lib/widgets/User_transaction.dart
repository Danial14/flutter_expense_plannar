import 'package:flutter/material.dart';
import 'transaction_list.dart';
import '../models/Transaction.dart';

class Usertransaction extends StatelessWidget{
  late List<Transaction> transactions;
  late Function deleteTx;
  Usertransaction(List<Transaction> transactions, Function deleteTx){
    this.transactions = transactions;
    this.deleteTx = deleteTx;
  }
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return TransactionList(transactions: transactions, deleteTransaction: deleteTx,);
=======
    return Container(child:Column(
      children: <Widget>[
        TransactionList(transactions: transactions, deleteTransaction: deleteTx,)
      ],
    ));
>>>>>>> 48066d95b93aef17dce7d33b75463dc7a93f81a0
  }
}