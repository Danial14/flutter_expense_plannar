import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget{
  late String _label;
  late double _spendAMount;
  late double _spendingPctOfTotal;
  ChartBar(String label, double spendAMount, double spendingPctOfTotal){
    this._label = label;
    _spendAMount = spendAMount;
    this._spendingPctOfTotal = spendingPctOfTotal;
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      return Column(
        children: <Widget>[
          Container(
<<<<<<< HEAD
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text("\$${_spendAMount.toStringAsFixed(0)}",
              ),
=======
              height: constraints.maxHeight * 0.1,
              child: FittedBox(child: Text("\$${_spendAMount.toStringAsFixed(0)}"),
>>>>>>> 48066d95b93aef17dce7d33b75463dc7a93f81a0
              )),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: _spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
<<<<<<< HEAD
          Container(
              height: constraints.maxHeight * 0.15,
              child: Text(
              _label
          )
          )
        ],
      );
    });
  }
=======
          Container(child: FittedBox(child: Text(
              _label.substring(0, 1)
          )),
          height: constraints.maxHeight * 0.15,
          ),
        ],
      );

    });  }
>>>>>>> 48066d95b93aef17dce7d33b75463dc7a93f81a0
}