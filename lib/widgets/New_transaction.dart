import 'dart:io';

import 'package:expense_planner/main.dart';
import 'package:expense_planner/widgets/adaptive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'User_transaction.dart';

class NewTransaction extends StatefulWidget{

  final MyApp myApp;
  NewTransaction({
    required this.myApp
});

  @override
  State<StatefulWidget> createState() {
    return NewTransactionState(myApp);
  }
}
class NewTransactionState extends State<NewTransaction>{
  final titleController = TextEditingController();
  final aMountController = TextEditingController();
  DateTime? dateTime = null;
  late VoidCallback showDate;
  late MyApp _MyApp;
  NewTransactionState(MyApp app){
    this._MyApp = app;
  }
  void _subMitData(){
    if(titleController.text.isEmpty || aMountController.text.isEmpty || dateTime == null){
      return;
    }
    _MyApp.addNewTransaction(titleController.text, double.parse(aMountController.text), dateTime!);
    Navigator.of(context).pop();

  }
  @override
  Widget build(BuildContext context) {
    showDate = (){
      showDatePicker(context: context, initialDate: DateTime.now(),
          firstDate: DateTime(2019), lastDate: DateTime.now()).
      then((pickedDate){
        if(pickedDate == null){
          return;
        }
        setState(() {
          dateTime = pickedDate;
        });
      });
    };
    return
      SingleChildScrollView(child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: "Title",
                  ),
                  controller: titleController,
                  onSubmitted: (_){
                    _subMitData();
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "AMount"
                  ),
                  controller: aMountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_){
                    _subMitData();
                  },
                ),
                Container(
                  height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(dateTime == null ? "No date chosen" : DateFormat.yMd().format(dateTime!)),
                    AdaptiveButton("Choose date", showDate)
                  ],
                )
                ),
                RaisedButton(onPressed: (){
                  _MyApp.addNewTransaction(titleController.text, double.parse(aMountController.text), dateTime!);
                      Navigator.of(context).pop();
                  },color: Theme.of(context).primaryColor,
                    child: Text("Add transaction", style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                ),))
              ],
            ),
          )
      )
      );

  }
}