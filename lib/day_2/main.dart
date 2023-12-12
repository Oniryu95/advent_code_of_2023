import 'dart:io';

import 'package:advent_code/day_2/first_riddle.dart';
import 'package:advent_code/day_2/game.dart';
import 'package:advent_code/day_2/second_riddle.dart' as d2r2;

void main(List<String> args) async {
  File file = File('assets/riddle_2.txt');
  String text = file.readAsStringSync();
  List<List<String>> gamesText = parseGames(text);
  List<Game> games = getMaxCubes(gamesText);
  print(solution(redCube: 12, greenCube: 13, blueCube: 14, games: games));
  print(d2r2.solution(games));
}
