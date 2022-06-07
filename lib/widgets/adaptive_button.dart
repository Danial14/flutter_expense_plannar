import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptiveButton extends StatelessWidget{
  late String buttonText;
  late VoidCallback showDate;
  AdaptiveButton(String buttonText, VoidCallback showDate){
    this.buttonText = buttonText;
    this.showDate = showDate;
  }
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS? CupertinoButton(child: Text(buttonText, style: TextStyle(
        fontWeight: FontWeight.bold
    ),), onPressed: showDate) : FlatButton(onPressed: showDate, child: Text(buttonText,
      style: TextStyle(
          color: Theme.of(context).primaryColor
      ),
    ));
  }
}