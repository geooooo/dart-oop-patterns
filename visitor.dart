class Saver {

  void save(MyStructData structData) {

    if (structData is MyIntArray) {
      print(structData.data.join(', '));
    } else if (structData is MyStringMap) {
      var mapData = structData.data;
      for (var i = 0; i < mapData.length; i++) {
        print('"${mapData.keys.elementAt(i)}": "${mapData.values.elementAt(i)}"');
      }
    }

  }

}


abstract class MyStructData {

  void save(Saver saver) =>
    saver.save(this);

}


class MyIntArray extends MyStructData {

  List<int> data = [];

}


class MyStringMap extends MyStructData {

  Map<String, String> data = {};

}


void main(List<String> args) {

  var ia = MyIntArray();
  ia.data = [1, 2, 3];
  print('Int array:');
  ia.save(Saver());

  var sm = MyStringMap();
  sm.data = {
    'a': 'abc',
    'b': 'qwerty',
    'x': 'y',
  };
  print('String map');
  sm.save(Saver());

}
