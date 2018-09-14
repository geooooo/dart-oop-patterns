import 'dart:math' as math;


class Listener {

  final int id = math.Random().nextInt(100);

  void notify(int id) {
    print('Emitter$id -> Listener${this.id}');
  }

}


class Emitter {

  final int id = math.Random().nextInt(100);
  List<Listener> listeners = [];

  void add(Listener listener) =>
    this.listeners.add(listener);

  void remove(Listener listener) =>
    this.listeners.remove(listener);

  void emit() =>
    this.listeners.forEach((l) => l.notify(this.id));

}


void main(List<String> args) {

  var l1 = Listener();
  print('l${l1.id}');
  var l2 = Listener();
  print('l${l2.id}');
  var l3 = Listener();
  print('l${l3.id}');

  var e1 = Emitter();
  print('e${e1.id}');
  var e2 = Emitter();
  print('e${e2.id}');

  e1.add(l1);
  e1.add(l2);
  e1.add(l3);
  e1.remove(l1);

  e1.emit();

  e2.emit();

  e2.add(l2);
  e2.emit();

}
