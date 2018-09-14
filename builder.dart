abstract class Builder {

  void setFirstElement(String value);
  void setSecondElement(String value);
  void setThirdElement(String value);

  Object getResult();

}


class BuilderList extends Builder {

  List list = ['', '', ''];

  @override
  void setFirstElement(String value) =>
    this.list[0] = value;

  @override
  void setSecondElement(String value) =>
    this.list[1] = value;

  @override
  void setThirdElement(String value) =>
    this.list[2] = value;

  @override
  List getResult() => this.list;

}


class BuilderString extends Builder {

  String string = '';

  @override
  void setFirstElement(String value) =>
    this.string += value[0];

  @override
  void setSecondElement(String value) =>
    this.setFirstElement(value);

  @override
  void setThirdElement(String value) =>
    this.setFirstElement(value);

  @override
  String getResult() => this.string;

}


T createIter<T>(String value) {

  Builder builder;
  var type = T.toString().toLowerCase();

  if (type == "list<dynamic>") {
    builder = BuilderList();
  } else if (type == "string") {
    builder = BuilderString();
  }

  builder.setFirstElement(value[0]);
  builder.setSecondElement(value[1]);
  builder.setThirdElement(value[2]);

  return builder.getResult() as T;

}


void main(List<String> args) {

  Object data;

  data = createIter<List>('123');
  print(data);

  data = createIter<String>('123');
  print(data);

}
