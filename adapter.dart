class StupidAdapter {

  StupidNumber stupidNumber;

  StupidAdapter(this.stupidNumber);

  NormalNumber normalize() =>
    NormalNumber(this.stupidNumber.value.length);

}


class StupidNumber {

  String value;

  StupidNumber(this.value);

}


class NormalNumber {

  int value;

  NormalNumber(this.value);

}


void main(List<String> args) {

  var sn1 = StupidNumber('III');
  var sn2 = StupidNumber('II');

  var sum = StupidAdapter(sn1).normalize().value +
            StupidAdapter(sn2).normalize().value;

  print(sum);

}
