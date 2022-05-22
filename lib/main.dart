import 'package:expense_planner/widgets/New_transaction.dart';
import 'package:expense_planner/widgets/User_transaction.dart';
import 'package:expense_planner/widgets/chart.dart';
import 'package:flutter/material.dart';


import 'models/Transaction.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.purple,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: "Quicksand",
            fontSize: 20
          )
        ),
        textTheme: ThemeData.light().textTheme.copyWith(displayLarge: TextStyle(
          fontFamily: "OpenSans",
          fontWeight: FontWeight.bold
        ))
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  late MyAppState _MyAppState;
  MyApp(){
    _MyAppState = MyAppState(this);
  }
  @override
  State<StatefulWidget> createState() {
    return _MyAppState;
  }
  void addNewTransaction(String txTitle, double txAmount){
    _MyAppState.addNewTransaction(txTitle, txAmount);
  }
}
class MyAppState extends State<MyApp>{
  late MyApp _MyApp;
  MyAppState(MyApp app){
    _MyApp = app;
  }
  final List<Transaction> transactions = [
    /*Transaction(title: "Shoes", id: "tr01", amount: 1000, date: DateTime.now()),
    Transaction(title: "Cloth", id: "tr02", amount: 1500, date: DateTime.now())*/
  ];

  void addNewTransaction(String txTitle, double txAmount){
    final newTx = Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: DateTime.now());
    setState(() {
      transactions.add(newTx);
    });
  }
  void startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
        onTap: (){},
        child: NewTransaction(myApp: _MyApp,),
        behavior: HitTestBehavior.opaque,
      );
    });
  }
  @override
  Widget build(BuildContext cont) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expense plannar"),
          actions: <Widget>[
            IconButton(onPressed: (){}, icon: Icon(Icons.add))
          ],

        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child : Card(
                  color: Colors.blue,
                  child: Text("Transaction"),
                ),
              ),
              Chart(transactions),
              Usertransaction(transactions)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: (){
          startAddNewTransaction(cont);
        },),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}