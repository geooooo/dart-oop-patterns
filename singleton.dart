class Singleton {

  static Singleton _instance;
  int field;

  factory Singleton(int value) {

    if (Singleton._instance == null) {
      Singleton._instance = Singleton._create(value);
    }

    return Singleton._instance;

  }

  Singleton._create(this.field);

}


void main(List<String> args) {

  for (var i in [1, 2, 3]) {
    var s = Singleton(i);
    print(s.field);
  }

}
