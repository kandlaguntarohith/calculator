import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:petitparser/petitparser.dart';
import 'dart:math';

class CalculationLogic with ChangeNotifier {
  Queue<String> dataList = Queue();
  bool show = false;
  bool open = false;
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  Parser buildParser() {
    final builder = ExpressionBuilder();
    builder.group()
      ..primitive((pattern('+-').optional() &
              digit().plus() &
              (char('.') & digit().plus()).optional() &
              (pattern('eE') & pattern('+-').optional() & digit().plus())
                  .optional())
          .flatten('number expected')
          .trim()
          .map(num.tryParse))
      ..wrapper(
          char('(').trim(), char(')').trim(), (left, value, right) => value);
    builder.group()..prefix(char('-').trim(), (op, a) => -a);
    builder.group()..right(char('^').trim(), (a, op, b) => pow(a, b));
    builder.group()
      ..left(char('*').trim(), (a, op, b) => a * b)
      ..left(char('/').trim(), (a, op, b) => a / b);
    builder.group()
      ..left(char('+').trim(), (a, op, b) => a + b)
      ..left(char('-').trim(), (a, op, b) => a - b);
    return builder.build().end();
  }

  double calcString(String text) {
    final parser = buildParser();
    final input = text;
    final result = parser.parse(input);
    if (result.isSuccess)
      return result.value.toDouble();
    else
      return double.parse(text);
  }

  bool get showAns {
    return show;
  }

  void addToStack(String data) {
    show = false;
    notifyListeners();        
    if (data == 'AC') {
      dataList.clear();
      notifyListeners();
      return;
    }

    if (data == '<=') {
      if (dataList.length != 0) dataList.removeLast();
      notifyListeners();
      return;
    }
    if (data == '+' || data == '/' || data == 'X' || data == '%') {
      if (dataList.length == 0) return;
      if (dataList.last == '+' ||
          dataList.last == '-' ||
          dataList.last == '/' ||
          dataList.last == 'X' ||
          dataList.last == '%' ||
          dataList.last == '.') dataList.removeLast();
      dataList.addLast(data);
    } else if (data == '-') {
      if (dataList.last == '+' ||
          dataList.last == '-' ||
          dataList.last == '%' ||
          dataList.last == '.')
        dataList.removeLast();
      else
        dataList.addLast(data);
    } else {
      dataList.addLast(data);
    }
    notifyListeners();
  }

  String getExpression() {
    if (dataList.length == 0) return '';
    final q = [...dataList];
    print(q);
    String expression = '';
    while (q.length > 0) {
      expression = expression + q.first;
      q.removeAt(0);
    }
    print(expression);
    return expression;
  }

  void cal() {
    show = true;
    notifyListeners();
  }

  String calculate() {
    if (dataList.length == 0) return null;
    double ans;
    try {
      ans = calcString(getExpression());
    } catch (e) {
      return null;
    }
    return ans.toStringAsFixed(ans.truncateToDouble() == ans ? 0 : 1);
  }
}
