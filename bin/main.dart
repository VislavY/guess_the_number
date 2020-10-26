import 'dart:io';
import 'difficulty.dart';
import 'game.dart';
import 'console.dart';

var _difficulty = Difficulty.easy;

void main() {
  final Game game = Game();

  while (true) {
    Console.clear();

    String sections = 
      '[1] Play              \n' +
      '[2] Change difficulty \n' +
      '[0] Exit              \n'; 
    print(sections);

    print('Select and Enter section number.');
    String sectionNum = stdin.readLineSync();

    switch (sectionNum) {
      case '0':
        return;
      case '1':
        game.start(_difficulty);
        break;
      case '2':
        ChangeDifficulty();
        break;
      default:
        print('Your section number not a found!');
        break;
    }

    stdin.readLineSync();
  }
}

void ChangeDifficulty() {
  while (true) {
    Console.clear();

    String difficulties =
      '[1] $Difficulty.easy   \n' +
      '[2] $Difficulty.medium \n' +
      '[3] $Difficulty.hard   \n' +
      '[0] Exit               \n';
    print(difficulties);

    print('Select and Enter difficulty number.');
    String difficultyNum = stdin.readLineSync();

    switch (difficultyNum) {
      case '0':
        return;
      case '1':
        _difficulty = Difficulty.easy;
        break;
      case '2':
        _difficulty = Difficulty.medium;
        break;
      case '3':
        _difficulty = Difficulty.hard;
        break;
      default:
        print('Your difficulty number not a found!');
        break;
    }

    print('Difficulty has been changed to $_difficulty.');
  }
}