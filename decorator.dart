abstract class BaseWrapper {

  String wrap(String sym);

}


class Wrapper1 implements BaseWrapper {

  String value;

  Wrapper1(this.value);

  @override
  String wrap(String sym) => '$sym${this.value}${sym}1';

}


class Wrapper2 implements BaseWrapper {

  String value;

  Wrapper2(this.value);

  @override
  String wrap(String sym) => '$sym${this.value}${sym}2';

}


class SharpWrapper implements BaseWrapper {

  BaseWrapper  _wrapper;

  SharpWrapper(this._wrapper);

  @override
  String wrap(String sym) => '#${this._wrapper.wrap(sym)}#';

}


class StarWrapper implements BaseWrapper {

  BaseWrapper  _wrapper;

  StarWrapper(this._wrapper);

  @override
  String wrap(String sym) => '*${this._wrapper.wrap(sym)}*';

}


void main(List<String> args) {

  BaseWrapper w = SharpWrapper(
    StarWrapper(StarWrapper(Wrapper1('string')))
  );

  print(w.wrap('!'));

}
