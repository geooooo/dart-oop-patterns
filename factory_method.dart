abstract class Car {

  void run();

}


class Truck implements Car {

  void run() {
    print("rrr");
  }

}


class SportCar implements Car {

  void run() {
    print("RRR");
  }

}


Car createCar(int type) {

  Car car;

  switch (type) {
    case 0:
      car = SportCar();
      break;
    case 1:
      car = Truck();
      break;
  }

  return car;

}


void main(List<String> args) {

  var car = createCar(int.parse(args[0], radix: 10));
  car.run();

}
