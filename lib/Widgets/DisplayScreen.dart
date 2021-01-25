import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/CalculationLogic.dart';

class DisplayScreen extends StatelessWidget {
  final expression = TextEditingController();
  final result = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    expression.text = Provider.of<CalculationLogic>(context).getExpression();
    result.text = Provider.of<CalculationLogic>(context).showAns
        ? Provider.of<CalculationLogic>(context, listen: false).calculate()
        : '';
    return Container(
      // color: Colors.pink,
      width: double.infinity,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 20),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 150,
              width: double.infinity,
              child: TextField(
                controller: expression,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
                textAlign: TextAlign.end,
                enabled: false,
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: TextField(
                controller: result,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 35,
                ),
                textAlign: TextAlign.end,
                enabled: false,
              ),
            ),
          ],
        ),
      ),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     width: .5,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}
