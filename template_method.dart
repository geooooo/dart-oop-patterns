import 'dart:io' as io;


abstract class FileReader<T> {

  List<T> data;

  void show(String filename) {
    this._read(filename);
    this._print();
  }

  void _print() => this.data.forEach(print);

  void _read(String filename);


}


class IntFileReader extends FileReader<int> {

  @override
  void _read(String filename) {
    var data = io.File(filename).readAsStringSync();
    this.data = List.from(
      data.split(RegExp(r'(\t|\n| )+'))
          .where((e) => e.isNotEmpty)
         .map((e) => int.parse(e, radix: 10))
    );
  }

}


class WordFileReader extends FileReader<String> {

  @override
  void _read(String filename) {
    var data = io.File(filename).readAsStringSync();
    this.data = List.from(
      data.split(RegExp(r'(\t|\n| )+'))
          .where((e) => e.isNotEmpty)
          .map((e) => e.toLowerCase())
    );
  }

}


void main(List<String> args) {

  print('int:');
  IntFileReader().show('i');

  print('word:');
  WordFileReader().show('s');

}
