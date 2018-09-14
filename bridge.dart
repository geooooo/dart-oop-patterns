abstract class Engine {

  int _power;

  Engine(this._power);

  void run();

}


class CarEngine extends Engine {

  CarEngine(int power): super(power);

  @override
  void run() {
    print("wmwmwmwm !");
  }

}


class TankEngine extends Engine {

  TankEngine(int power): super(power);

  @override
  void run() {
    print("WrrWWRRR !");
  }

}


abstract class Car {

  Engine _engine;

  Car();

  void run() {
    this._engine.run();
  }

}


class CityCar extends Car {

  CityCar() {
    this._engine = CarEngine(100);
  }

}


class Tank extends Car {

  Tank() {
    this._engine = TankEngine(1500);
  }

}


void main(List<String> args) {

  Car car;

  car = CityCar();
  car.run();

  car = Tank();
  car.run();

}
