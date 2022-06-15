import 'package:expressions/expressions.dart';

void main(List<String> args) {
  List<String> test1 = ["4", "+", "9", "=", "13"];
  List<String> test2 = ["1", "+", "4", "+", "8", "=", "10", "+", "3"];
  List<String> test3 = ["1", "+", "4", "+", "8", "=", "10", "+", "4"];
  List<String> test4 = ["2", "+", "4", "*", "8", "=", "10", "+", "24"];
  print(rowIsValid(test1));
  print(rowIsValid(test2));
  print(rowIsValid(test3));
  print(rowIsValid(test4));
}

bool rowIsValid(List<String> row) {
  int numOfEquals = 0;
  for (var i = 0; i < row.length; i++) {
    if (row.elementAt(i) == "=") {
      numOfEquals++;
    }
  }
  if (numOfEquals == 1) {
    row.insert(row.indexOf("="), "=");
    try {
      return ExpressionEvaluator().eval(Expression.parse(row.join()), {});
    } catch (e) {
      return false;
    }
  } else {
    return false;
  }
}
