import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:equations/equations.dart';

String generateEquation() {
  List<String> operators = ["+", "-", "*", "/"];
  List<String> numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
  List<String> row = [];
  while (row.isEmpty ||
      (!(row.length +
                  1 +
                  (() {
                    try {
                      return ((ExpressionParser().evaluate(row.join()).toInt())
                          .toString());
                    } catch (e) {
                      return "12345678";
                    }
                  }())
                      .length ==
              8) ||
          (() {
            try {
              return ((ExpressionParser().evaluate(row.join()).toInt())
                  .isNegative);
            } catch (e) {
              return true;
            }
          }()) ||
          !(() {
            try {
              return ((ExpressionParser().evaluate(row.join()))) % 1 == 0;
            } catch (e) {
              return false;
            }
          }()))) {
    row = [];
    int iterTimes = randomChoice([4, 5, 6]);
    for (int i = 0; i < iterTimes; i++) {
      row.add((i > 0 &&
              i < iterTimes &&
              !operators.contains(row.elementAt(i - 1)) &&
              row.elementAt(i - 1) != "0")
          ? randomChoice([randomChoice(operators), randomChoice(numbers)])
          : randomChoice(numbers.getRange(1, 10)));
      if (row.length +
              1 +
              (() {
                try {
                  return ((ExpressionParser().evaluate(row.join()).toInt())
                      .toString());
                } catch (e) {
                  return "12345678";
                }
              }())
                  .length ==
          8) {
        break;
      }
    }
  }
  return row.join() +
      '=' +
      ExpressionParser().evaluate(row.join()).toInt().toString();
}

void main() {
  for (int i = 0; i < 10; i++) {
    // while (true) {
    print(generateEquation());
  }
}


// TODO: probably do in another file, but implement communicativeness so that 1+2=3 and 2+1=3 both check out
// could probably do this by stripping the operands so that we have 2 or 3 ints (depending on the equation) and come together to equal something, and just checking if that holds with the user input, subsituting the remaining and the known in their places
// example:
/*
  5*9=45 // equation
  int one = 5
  int two = 9
  String operand = "*"
  switch (userinput) {
    case one:
      return (one * two == 45)
    case two:
      return (two * one == 45)
    default:
      return false
  }
*/