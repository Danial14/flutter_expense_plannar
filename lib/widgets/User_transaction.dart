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
    return TransactionList(transactions: transactions, deleteTransaction: deleteTx,);
  }
}