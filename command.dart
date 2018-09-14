import 'dart:io' as io;


abstract class Operation {

  int number;

  void run() => print('Operation -> ${this.number}');

}


class Operation1 extends Operation {

  Operation1() {
    this.number = 1;
  }

}


class Operation2 extends Operation {

  Operation2() {
    this.number = 2;
  }

}


class Operation3 extends Operation {

  Operation3() {
    this.number = 3;
  }

}


void runOperation(int number) {

  Operation operation;

  switch (number) {
    case 1:
      operation = Operation1();
      break;
    case 2:
      operation = Operation2();
      break;
    case 3:
      operation = Operation3();
      break;
  }

  operation.run();

}


void main(List<String> args) {

  while (true) {

    var line = io.stdin.readLineSync().trim();
    if (line.isEmpty) break;

    var number = int.parse(line, radix: 10);
    runOperation(number);

  }

}
