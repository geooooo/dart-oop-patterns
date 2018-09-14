abstract class Iterator<T> {

  bool isEnd = false;
  int index = 0;

  T next();

}


class MapIterator<T> extends Iterator<T> {

  Map<String, T> data = {};

  MapIterator(this.data);

  T next() {

    var result = this.data.values.elementAt(this.index++);

    if (this.data.length == this.index) {
      this.isEnd = true;
    }

    return result;

  }

}


class ListIterator<T> extends Iterator<T> {

  List<T> data = [];

  ListIterator(this.data);

  T next() {

    var result = this.data[this.index++];

    if (this.data.length == this.index) {
      this.isEnd = true;
    }

    return result;

  }

}


abstract class My<T> {

  Iterator<T> iterator();

}


class MyMap<T> {

  Map<String, T> data = {};

  iterator() => MapIterator<T>(this.data);

}


class MyList<T> {

  List<T> data = [];

  iterator() => ListIterator<T>(this.data);

}


void main(List<String> args) {

  var l = MyList<int>();
  l.data = [1,2,3];

  print("MyList:");
  for (var i = l.iterator(); !i.isEnd; ) {
    print(i.next());
  }

  var m = MyMap<int>();
  m.data = {"a": 4, "b": 5, "c": 6};

  print("MyMap:");
  for (var i = m.iterator(); !i.isEnd; ) {
    print(i.next());
  }

}
