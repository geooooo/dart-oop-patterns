abstract class Node {

  Node(String name, [Node child]):
    this.name = name,
    this.child = child;

  String name;
  Node child;

}


abstract class Element extends Node {

  dynamic value;

  Element(String name, dynamic value, [Node child]):
    this.value = value,
    super(name, child);

  void pprint() => this._pprint(this);

  void _pprint(Element element, [int padding = 0]) {

    if (element.child == null) return;

    print(element.value.toString().padLeft(padding + 1, '-'));
    this._pprint(element.child, padding + 2);

  }

}


class SpanElement extends Element {

  SpanElement(dynamic value, [Node child]):
    super('span', value, child);

}


class DivElement extends Element {

  DivElement(dynamic value, [Node child]):
    super('div', value, child);

}


void main(List<String> args) {

  Element e = DivElement(1,
    DivElement(2, SpanElement(3, SpanElement(4)))
  );

  e.pprint();

}
