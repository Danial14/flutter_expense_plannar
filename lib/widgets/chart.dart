import 'package:expense_planner/models/Transaction.dart';
import 'package:expense_planner/widgets/chart_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget{
  late List<Transaction> _recentTransactions;
  //late
  Chart(List<Transaction> transactions){
    this._recentTransactions = transactions;
  }
  List<Map<String, Object>> get groupedTranactions{
    return List.generate(7, (index){
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for(int i = 0; i < _recentTransactions.length; i++){
        if(weekDay.day == _recentTransactions[i].date.day &&
            weekDay.month == _recentTransactions[i].date.month &&
            weekDay.year == _recentTransactions[i].date.year
        ){
          totalSum += _recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {
        "day" : DateFormat.E().format(weekDay),
        "amount" : totalSum
      };
  }
    ).reversed.toList();
}
double get getTotalSpending{
    return _recentTransactions.fold(0.0, (sum, iteM){
      print(sum);
      return sum + iteM.amount;
    });
}
  @override
  Widget build(BuildContext context) {
    print(groupedTranactions.toString());
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTranactions.map((iteM){
          return Flexible(fit: FlexFit.tight,child: ChartBar(iteM["day"].toString(), (iteM["amount"] as double), getTotalSpending == 0.0 ? 0.0 : (iteM["amount"] as double) / getTotalSpending));
        }).toList(),
      ),
    )
    );
  }
}