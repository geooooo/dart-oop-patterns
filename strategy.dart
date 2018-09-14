typedef MapCallback<T> = T Function(T e);


class IntArray {

  List<int> data = [];

  IntArray(int size) {
    for (var i = 0; i < size; i++) {
      this.data.add(0);
    }
  }

  int length() => this.data.length;

  void vset(int index, int value) {
    this._checkIndex(index);
    this.data[index] = value;
  }

  int vget(int index) {
    this._checkIndex(index);
    return this.data[index];
  }

  IntArray map(MapCallback callback) {
    var result = IntArray(this.data.length);
    for (var i = 0; i < this.data.length; i++) {
      result.data[i] = callback(this.data[i]);
    }
    return result;
  }

  void _checkIndex(int index) {
    if (index < 0 || index > this.data.length) {
      throw Exception('Index out of range :(');
    }
  }

}


void main(List<String> args) {

  var i = 1;
  var l1 = IntArray(5).map((e) => i++);

  var l2 = l1.map((e) => e * 2);

  print(l1.data);
  print(l2.data);

}
