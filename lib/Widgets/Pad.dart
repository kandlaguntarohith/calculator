import 'package:calculator/Provider/CalculationLogic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pad extends StatelessWidget {
  bool isPoint = false;
  String term;
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  void addData(String data, CalculationLogic expression) {
    expression.addToStack(data);
  }

  @override
  Widget build(BuildContext context) {
    final expression = Provider.of<CalculationLogic>(context, listen: false);
    return Container(
      // color: Colors.grey[900],
      decoration: BoxDecoration(
        color: Colors.grey[900],
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      )),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          bottom: 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: FlatButton(
                    onPressed: () => addData('AC', expression),
                    child: Text(
                      'AC',
                      style: TextStyle(
                        color: Colors.redAccent[700],
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   width:15,
                // ),
                Container(
                  child: FlatButton(
                    onPressed: () => addData('<=', expression),
                    child: Icon(
                      Icons.backspace,
                      size: 30,
                      color: Colors.pinkAccent[700],
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 15,
                // ),
                Container(
                  child: FlatButton(
                    onPressed: () => addData('^', expression),
                    child: Text(
                      '^',
                      style: TextStyle(
                        color: Colors.tealAccent[700],
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () => addData('/', expression),
                    child: Text(
                      '/',
                      style: TextStyle(
                        color: Colors.tealAccent[700],
                        fontSize: 24,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: FlatButton(
                    onPressed: () => addData('7', expression),
                    child: Text(
                      '7',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () => addData('8', expression),
                    child: Text(
                      '8',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () => addData('9', expression),
                    child: Text(
                      '9',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () => addData('*', expression),
                    child: Text(
                      '*',
                      style: TextStyle(
                        color: Colors.tealAccent[700],
                        fontSize: 24,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: FlatButton(
                    onPressed: () => addData('4', expression),
                    child: Text(
                      '4',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () => addData('5', expression),
                    child: Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () => addData('6', expression),
                    child: Text(
                      '6',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () => addData('-', expression),
                    child: Text(
                      '-',
                      style: TextStyle(
                        color: Colors.tealAccent[700],
                        fontSize: 24,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: FlatButton(
                    onPressed: () => addData('1', expression),
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () => addData('2', expression),
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () => addData('3', expression),
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () => addData('+', expression),
                    child: Text(
                      '+',
                      style: TextStyle(
                        color: Colors.tealAccent[700],
                        fontSize: 24,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: FlatButton(
                    onPressed: () => addData('.', expression),
                    child: Text(
                      '.',
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () => addData('0', expression),
                    child: Text(
                      '0',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: null,
                    child: null,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  height: 80,
                  color: Colors.purple[900],
                  child: FlatButton(
                    color: Colors.purple,
                    onPressed: () => expression.cal(),
                    child: Text(
                      '=',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
