import 'dart:math' as math;


abstract class Disk {

  List<String> trackList;
  int playedIndex = 0;

  Disk(this.trackList);

  void play() =>
    print('Track: ${this.trackList[this.playedIndex]}');

  void next() {
    this.playedIndex++;
    if (this.playedIndex == this.trackList.length) {
      this.playedIndex = 0;
    }
  }

  void prev() {
    this.playedIndex--;
    if (this.playedIndex < 0) {
      this.playedIndex = this.trackList.length - 1;
    }
  }

}


class RammsteinDisk extends Disk  {

  @override
  RammsteinDisk(): super(<String>[
    'Rammstein - Ohne dich',
    'Rammstein - Sonne',
    'Rammstein - Mutter',
  ]);

}


class RandomedDisk extends Disk {

  @override
  RandomedDisk(List<String> trackList):
    super(trackList);

  @override
  void next() => this._toggle();

  @override
  void prev() => this._toggle();

  void _toggle() {
    this.playedIndex = this._random();
  }

  int _random() =>
    math.Random().nextInt(this.trackList.length);

}


class EisbrecherDisk extends RandomedDisk {

  EisbrecherDisk():
    super(<String>[
      'Eisbrecher - Dein Weg',
      'Eisbrecher - Misstuck',
      'Eisbrecher - Eisbrecher',
      'Eisbrecher - Ohne dich',
      'Eisbrecher - Rette mich',
      'Eisbrecher - Der Flieger',
    ]);

}


class Player {

  Disk disk;
  /// 0.0 .. 1.0 (0.1)
  double volume = 1.0;
  bool playedRandom = false;

  void play() {
    print('Volume: ${this.volume}');
    this.disk.play();
  }

  void next() => this.disk.next();

  void prev() => this.disk.prev();

  void insert(Disk disk) {
    this.playedRandom = (disk is RandomedDisk)? true : false;
    this.disk = disk;
  }
}


void main(List<String> args) {

  var player = Player();

  player.volume = 0.8;
  player.insert(RammsteinDisk());
  for (var i = 0; i < player.disk.trackList.length; i++) {
    player.play();
    player.next();
  }

  print('');

  player.volume = 0.3;
  player.insert(EisbrecherDisk());
  for (var i = 0; i < player.disk.trackList.length; i++) {
    player.play();
    player.next();
  }

}
