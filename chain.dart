abstract class Message {

  String text;

  Message(String text);

  /// return true if ok
  bool make();

}


class CensorValidator implements Message {

  static const List<String> badWords = [
    'fuck',
    'eb',
    'blad',
  ];

  String text;

  @override
  CensorValidator(String text) {
    this.text = text;
  }

  @override
  bool make() {
    var result = true;
    for (var word in CensorValidator.badWords) {
      var regExp = RegExp(r'\b' + word + r'\b');
      if (this.text.contains(regExp)) {
        result = false;
        break;
      }
    }
    print('CENSOR: ${(result)? 'success' : 'failure'}');
    return result;
  }

}


class LetterCounter implements Message {

  String text;

  @override
  LetterCounter(String text) {
    this.text = text;
  }

  @override
  bool make([bool toUpper = false]) {
    print('LENGTH: ${this.text.length}');
    return true;
  }

}


class MessageLogger implements Message {

  String text;

  @override
  MessageLogger(String text) {
    this.text = text;
  }

  @override
  bool make() {
    print('MESSAGE: "${this.text}"');
    return true;
  }

}


void main(List<String> args) {

  var arg = args[0];
  var handlers = <Message>[
    CensorValidator(arg),
    MessageLogger(arg),
    LetterCounter(arg),
  ];

  for (var handler in handlers) {
    if (!handler.make()) {
      print('HANDLER: ${handler.runtimeType} say "false"');
      break;
    }
  }

}
