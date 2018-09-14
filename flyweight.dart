import 'dart:math' as math;


class Texture {

  static const size = 10;
  static const maxData = 100;

  final List<List<int>> data = [];

  Texture() {

    var random = math.Random();
    for (var i = 0; i < Texture.size; i++) {
      this.data.add([]);
      for (var j = 0; j < Texture.size; j++) {
        var value = random.nextInt(Texture.maxData);
        this.data[i].add(value);
      }
    }

  }

}


class Unit {

  static final Texture defaultTexture = Texture();

  Texture texture;

  Unit():
    this.texture = Unit.defaultTexture;

  Texture generateUniqTexture() =>
    this.texture = Texture();

}


void main(List<String> args) {

  var ud1 = Unit();
  var ud2 = Unit();

  var u1 = Unit()..generateUniqTexture();
  var u2 = Unit()..generateUniqTexture();
  var u3 = Unit()..generateUniqTexture();

  print('default is == (true)');
  print(ud1.texture == ud2.texture);

  print('uniq is != (true)');
  print(u1.texture != u2.texture && u1.texture != u3.texture && u2.texture != u3.texture);

  print('default != uniq (true)');
  print(u1.texture != ud1.texture);

}
