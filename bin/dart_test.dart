import 'dart:math';

class Hero {
  String name;
  int hp;

  Hero(this.name, this.hp);
  void attack() {
    print('공격했다.');
  }
}

class Cleric extends Hero {
  static final int maxHp = 50;
  static final int maxMp = 10;
  int mp = maxMp;

  Cleric(String name, int hp) : super(name, hp);

  void selfAid() {
    mp -= 5;
    hp = maxHp;
  }

  int pray(int sec) {
    int recoveryMp = sec + Random().nextInt(3);

    int beforeMp = mp; //회복전 mp
    mp += recoveryMp; // 회복을 했고

    if (maxMp < mp) {
      mp = maxMp; //maxMp를 넘으면
    }
    return mp - beforeMp; //실제회복된 양
  }
}

void main() {
  final hong = Hero('홍길동', 50);
  final lim = Hero('임꺽정', 50);
  print(hong.hashCode);
  print(lim.hashCode);
  final cleric = Cleric('안데르센 신부', 1000);
  print(cleric.name);
}
