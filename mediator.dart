import 'dart:math' as math;


abstract class Mediator {

  void notify(Object Sender, num result);

}


class Squarer {

  final Mediator mediator;

  Squarer(this.mediator);

  void run(num x) {
    var result = x * x;
    this.mediator.notify(this, result);
  }

}


class NumberRandomizer {

  static const num maxInt = 10;

  final Mediator mediator;
  final random = math.Random();

  NumberRandomizer(this.mediator);

  void run() {
    var result = this.random.nextInt(NumberRandomizer.maxInt);
    this.mediator.notify(this, result);
  }

}


class Calculator {

  final Mediator mediator;

  Calculator(this.mediator);

  void sum(num x, num y) {
    var result = x + y;
    this.mediator.notify(this, result);
  }

  void sub(num x, num y) {
    var result = x - y;
    this.mediator.notify(this, result);
  }

}


class App extends Mediator {

  num result = 0;

  Calculator calculator;
  Squarer squarer;
  NumberRandomizer numberRandomizer;

  App() {
    this.calculator = Calculator(this);
    this.squarer = Squarer(this);
    this.numberRandomizer = NumberRandomizer(this);
  }

  @override
  void notify(Object sender, num result) {

    this.result = result;

  }

  void run() {

    this.numberRandomizer.run();
    print('x = ${this.result}');

    this.squarer.run(this.result);
    var x2 = this.result;

    this.numberRandomizer.run();
    print('y = ${this.result}');

    this.squarer.run(this.result);
    var y2 = this.result;

    this.calculator.sum(x2, y2);
    print('x**2 + y**2 = ${this.result}');

  }

}


void main(List<String> args) {

  App().run();

}
