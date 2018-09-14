import 'dart:io' as io;


enum Color {
  red,
  green,
  blue,
  white,
  black,
}


class TextBlock {

  String value = '';
  Color color = Color.black;

}


// =============================================== //


class TextFieldSnapshot {

  List<TextBlock> _value;
  DateTime _time;

  TextFieldSnapshot(this._value, this._time);

  String get time => this._time.toString();

}


class TextField extends TextFieldSnapshot {

  TextField():
    super(List<TextBlock>(), DateTime.now());

  TextFieldSnapshot get snapshot => this;

  void input(TextBlock textBlock) {
    io.sleep(Duration(milliseconds: 100));
    this._value.add(textBlock);
    this._time = DateTime.now();
  }

  void undo(TextFieldSnapshot snapshot) {
    this._value = snapshot._value;
    this._time = snapshot._time;
  }

}


// =============================================== //


class History {

  var memory = List<TextFieldSnapshot>();

  void add(TextFieldSnapshot snapshot) {

    var snapshotCopy = TextFieldSnapshot(
      List.from(snapshot._value),
      DateTime.fromMicrosecondsSinceEpoch(
        snapshot._time.microsecondsSinceEpoch
      )
    );

    this.memory.add(snapshotCopy);

  }

}


// =============================================== //


void main(List<String> args) {

  var history = History();
  var field = TextField();

  // 0
  history.add(field.snapshot);

  field.input(
    TextBlock()..value = '1'
               ..color = Color.green
  );

  // 1
  history.add(field.snapshot);

  field.input(
    TextBlock()..value = '2'
               ..color = Color.white
  );

  field.input(
    TextBlock()..value = '3'
  );


  // 3
  history.add(field.snapshot);

  print('Last snapshot: ${field.snapshot.time}');

  print('Snapshot list:');
  for (var s in history.memory) {
    print(s.time);
    s._value.forEach((e) => print(e.value));
  }

  print('Undo');
  field.undo(history.memory.first);
  print('Snapshot: ${field.snapshot.time}');
  print(field._value);

}
