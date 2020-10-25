import 'dart:math';
import 'dart:io';
import 'console.dart';
import 'difficulty.dart';
import 'exceptions/argumentOutOfRangeException.dart';

class Game {
  Game._privateConstructor();

  static final Game _game = Game._privateConstructor();

  factory Game() {
    return _game;
  }

  void start(Difficulty difficulty) {
    Console.clear();

    final random = Random();
    int secretNum = random.nextInt(100);
    print('Computer thought of a number.');

    int attempts = 0;
    switch (difficulty) {
      case Difficulty.easy:
        attempts = 7;
        break;
      case Difficulty.medium:
        attempts = 5;
        break;
      case Difficulty.hard:
        attempts = 3;
        break;
      default:
        throw ArgumentOutOfRangeException();
    }

    while(attempts > 0) {
      print('Try to guess. You have $attempts attempts.');
      int userNum = int.tryParse(stdin.readLineSync());

      attempts--;

      if (userNum == null) {
        print('You enter not a number.');
        continue;
      }

      if (userNum == secretNum) {
        print('You win! Secret number: $secretNum.');
        return;
      }

      if (userNum < secretNum) {
        print('Your number < secret number.');
      } else {
        print('Your number > secret number.');
      }
    }

    print('You lose! Secret number: $secretNum.');
  }
}