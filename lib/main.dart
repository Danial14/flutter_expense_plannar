import 'dart:io';

import 'package:expense_planner/widgets/New_transaction.dart';
import 'package:expense_planner/widgets/User_transaction.dart';
import 'package:expense_planner/widgets/chart.dart';
import 'package:flutter/cupertino.dart';
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
  void addNewTransaction(String txTitle, double txAmount, DateTime dateTime){
    _MyAppState.addNewTransaction(txTitle, txAmount, dateTime);
  }
}
class MyAppState extends State<MyApp>{
  late MyApp _MyApp;
  bool _showState = false;
  MyAppState(MyApp app){
    _MyApp = app;
  }
  final List<Transaction> transactions = [
    /*Transaction(title: "Shoes", id: "tr01", amount: 1000, date: DateTime.now()),
    Transaction(title: "Cloth", id: "tr02", amount: 1500, date: DateTime.now())*/
  ];

  void addNewTransaction(String txTitle, double txAmount, DateTime dateTime){
    final newTx = Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: dateTime);
    setState(() {
      transactions.add(newTx);
    });
  }
  void deleteNewTransaction(String id){
    print("delete call");
    setState(() {
      transactions.removeWhere((tx){
        print(id);
        print(tx.id);
        return tx.id == id;
      });
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
  List<Widget> builtLandescapeContent(PreferredSizeWidget appBar, Widget txWidget){
    return [Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Show chart"),
        Switch.adaptive(value: _showState, onChanged: (val){
          setState(() {
            _showState = val;
          });
        })
      ],
    ),
      _showState ? Container(
        height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.7,
        child: Chart(transactions),
      ) :
      txWidget
    ];
  }
  List<Widget> builtPortraitContent(PreferredSizeWidget appBar, Widget txWidget){
    return [
      Container(
        height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.3,
        child: Chart(transactions),
      ),
      txWidget
    ];
  }
  @override
  Widget build(BuildContext cont) {
    final bool isLandescape = MediaQuery.of(context).orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = AppBar(
      title: Text("Expense plannar"),
      actions: <Widget>[
        IconButton(onPressed: (){}, icon: Icon(Icons.add))
      ],
    );
    final Widget txWidget = Container(
        height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.7,
        child: Usertransaction(transactions, deleteNewTransaction)
    );
    final Widget content = SingleChildScrollView(
      child: Column(
        children: <Widget>[
          if(isLandescape)
            ...builtLandescapeContent(appBar, txWidget)
          ,
          if(!isLandescape)
            ...builtPortraitContent(appBar, txWidget)
        ],
      ),
    );

    return Platform.isIOS? CupertinoPageScaffold(child: content) : Scaffold(
        appBar: Platform.isIOS ? CupertinoNavigationBar() : appBar,
        body: content,
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: (){
          startAddNewTransaction(cont);
        },),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}