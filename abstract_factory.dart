abstract class Widget {

  String type;

}


abstract class Button extends Widget {}


class HtmlButton extends Button {

  @override
  HtmlButton() {
    this.type = 'html';
  }

}


class WinButton extends Button {

  @override
  WinButton() {
    this.type = 'window';
  }

}


abstract class TextField extends Widget {}


class HtmlTextField extends TextField {

  @override
  HtmlTextField() {
    this.type = 'html';
  }

}


class WinTextField extends TextField {

  @override
  WinTextField() {
    this.type = 'window';
  }

}


abstract class Form extends Widget {

  Button button;
  TextField textField;

  void render() {
    print('button: ${this.button.type}');
    print('textField: ${this.textField.type}');
  }

}


class HtmlForm extends Form {

  @override
  HtmlForm() {
    this.button = HtmlButton();
    this.textField = HtmlTextField();
  }

}


class WinForm extends Form {

  @override
  WinForm() {
    this.button = WinButton();
    this.textField = WinTextField();
  }

}



void main(List<String> args) {

  Form form;

  form = WinForm();
  form.render();

  form = HtmlForm();
  form.render();

}
