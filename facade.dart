class Math {

  static num sum(num x, num y) => x + y;
  static num mul(num x, num y) => x * y;
  static num sub(num x, num y) => x - y;
  static num div(num x, num y) => x / y;

}


typedef OpFunc = num Function(num, num);


class Calc {

  static final _opFuncs = <String, OpFunc>{
    '+': (x, y) => x + y,
    '-': (x, y) => x - y,
    '*': (x, y) => x * y,
    '/': (x, y) => x / y,
  };

  static num eval(String expression) {

    var values = expression.trim().split('');
    return Calc._eval(
      num.parse(values[0]),
      num.parse(values[2]),
      values[1]
    );

  }

  static num _eval(num x, num y, String operation) =>
    Calc._opFuncs[operation](x, y);

}


void main(List<String> args) {

  print('Before');
  print(Math.sum(2, 5));
  print(Math.mul(3, 2));

  print('After');
  print(Calc.eval('2+5'));
  print(Calc.eval('3*2'));

}
