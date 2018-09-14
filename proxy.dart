class DB {

  static String _data = 'this is data';

  String read() => DB._data;
  String write(String data) => DB._data = data;

}


class LoginDBProxy implements DB {

  final DB _db;

  static final String _login = 'root';
  static final String _password = '123';

  LoginDBProxy(this._db, String login, String password) {
    if (!LoginDBProxy._checkLogin(login, password)) {
      throw FormatException('Access denied !');
    }
  }

  static bool _checkLogin(String login, String password) =>
    LoginDBProxy._password == password &&
    LoginDBProxy._login    == login;

  String read() => this._db.read();
  String write(String data) => this._db.write(data);

}


void main(List<String> args) {

  var db = DB();

  print('Without authorization');
  print(db.read());
  db.write('new string');
  print(db.read());

  print('With autoriztion');
  var proxy;

  try {
    proxy = LoginDBProxy(db, 'vasia', '123');
  } on FormatException catch (e) {
    print('Error: ${e.message}');
    proxy = LoginDBProxy(db, 'root', '123');
  }

  print(proxy.read());
  proxy.write('any string');
  print(proxy.read());

}
