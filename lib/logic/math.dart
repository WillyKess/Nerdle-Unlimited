import 'package:expressions/expressions.dart';
import 'package:equations/equations.dart';
import 'package:dart_random_choice/dart_random_choice.dart';

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
      return const ExpressionEvaluator().eval(Expression.parse(row.join()), {});
      // return const ExpressionParser().evaluate(row.join());
    } catch (e) {
      return false;
    }
  } else {
    return false;
  }
}

String generateEquation() {
  List<String> operators = ["+", "-", "*", "/"];
  List<String> numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
  List<String> row = [];
  while (row.isEmpty ||
      (!(row.length +
                  1 +
                  (() {
                    try {
                      return ((const ExpressionParser()
                              .evaluate(row.join())
                              .toInt())
                          .toString());
                    } catch (e) {
                      return "12345678";
                    }
                  }())
                      .length ==
              8) ||
          (() {
            try {
              return ((const ExpressionParser().evaluate(row.join()).toInt())
                  .isNegative);
            } catch (e) {
              return true;
            }
          }()) ||
          !(() {
            try {
              return ((const ExpressionParser().evaluate(row.join()))) % 1 == 0;
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
                  return ((const ExpressionParser()
                          .evaluate(row.join())
                          .toInt())
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
      const ExpressionParser().evaluate(row.join()).toInt().toString();
}

// return a row of widgets, with correct text and color
// should store generated equation in cache, maybe

class Equation {
  static final List<String> originalEquation = generateEquation().split('');
  late final List<List<String>> validPermutations = (() {
    for (var item in items) {

    }
    return [
      [""]
    ];
  }());

  List<String> checkEquation() {
    return originalEquation;
  }
}
