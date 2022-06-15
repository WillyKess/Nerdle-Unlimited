import 'package:decimal/decimal.dart';

/*
Check order:
  all operands have exactly two surrounding ints
  parse m/d into variables
  perform a/s on those results
  poe!
*/

void main(List<String> args) {
  // List<String> test1 = ["4", "8", "+", "=", "13"];
  List<String> test2 = ["1", "+", "4", "+", "8", "=", "10", "+", "3"];
  List<String> test3 = ["1", "+", "4", "+", "8", "=", "10", "+", "4"];
  List<String> test4 = ["2", "+", "4", "*", "8", "=", "10", "+", "24"];

  // print(rowIsValid(test1));
  print(rowIsValid(test2));
  print(rowIsValid(test3));
  print(rowIsValid(test4));
}

bool rowIsValid(List<String> row) {
  int numOfEquals = 0;
  // for (var val in row) {
  for (var i = 0; i < row.length; i++) {
    if (row.elementAt(i) == "=") {
      numOfEquals++;
    }
    // if (!(_calc.containsKey(row.elementAt(i)) &&
    //     !_calc.containsKey(row.elementAt(i - 1)) &&
    //     !_calc.containsKey(row.elementAt(i + 1)))) {
    //   return false;
    // }
  }
  if (numOfEquals == 1) {
    List<String> left = [];
    List<String> right = [];
    for (var i = 0; i < row.indexOf("="); i++) {
      left.add(row.elementAt(i));
    }
    for (var i = row.indexOf("=") + 1; i < row.length; i++) {
      right.add(row.elementAt(i));
    }
    return (_compute(left) == _compute(right));
  } else {
    return false;
  }
}

final Map<String, Function> _calc = {
  '/': (String arg1, String arg2) =>
      Decimal.parse(arg1) / Decimal.parse(arg2), // Division
  '*': (String arg1, String arg2) =>
      Decimal.parse(arg1) * Decimal.parse(arg2), // Multiplication
  '+': (String arg1, String arg2) =>
      Decimal.parse(arg1) + Decimal.parse(arg2), // Addition
  '-': (String arg1, String arg2) =>
      Decimal.parse(arg1) - Decimal.parse(arg2), // Subtraction
};
// Reverse Polish Expression _calculation
num _compute(List<String> expression) {
  List<String> tempExpression = [];
  for (var i = 0; i < expression.length - 1; i++) {
    if (expression[i] == "+" || expression[i] == "-") {
      tempExpression.insert(0, expression[i]);
      tempExpression.insert(0, expression[i + 1]);
      tempExpression.insert(0, expression[i - 1]);
    }
  }
  for (var i = 0; i < expression.length - 1; i++) {
    if (expression[i] == "*" || expression[i] == "/") {
      tempExpression.insert(0, expression[i]);
      tempExpression.insert(0, expression[i + 1]);
      tempExpression.insert(0, expression[i - 1]);
    }
  }
  expression = tempExpression;
  List<String> acc = [];
  // for (var i = 0; i < expression.length - 1; i++) {
  //   if (_calc.containsKey(expression[i])) {
  //     final temp = expression[i + 1];
  //     expression[i + 1] = expression[i];
  //     expression[i] = temp;
  //     i++;
  //   }
  // }
  for (var i in expression) {
    if (_calc.containsKey(i)) {
      // print("eee");
      acc.add(Function.apply(
              _calc[i]!, [acc.removeLast(), acc.removeLast()].reversed.toList())
          .toString());
    } else {
      acc.add(i);
    }
    // if (num.tryParse(i) != null) {
    //   acc.add(i);
    // }
  }

  // for (var i = 0; i < expression.length; i++) {
  //   if (_calc.containsKey(expression.elementAt(i))) {
  //     acc.add(Function.apply(_calc[expression.elementAt(i)]!,
  //         [expression.elementAt(i - 1), expression.elementAt(i + 1)]));
  //   }
  // }
  return num.parse(acc.removeAt(0));
}
