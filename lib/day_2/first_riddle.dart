import 'package:advent_code/day_2/game.dart';

List<List<String>> parseGames(String text) {
  List<List<String>> games = [[]];
  int gamesIndicator = 0;
  List<String> matches = [];

  text.split('\n').forEach((singleLine) {
    singleLine.split(':')[1].split(';').forEach((match) {
      matches.add(match.replaceAll(' ', ''));
    });
    games.insert(gamesIndicator++, List.from(matches));
    matches.clear();
  });

  return games;
}

List<Game> getMaxCubes(List<List<String>> gamesText) {
  List<Game> games = List<Game>.generate(100, (_) => Game());

  gamesText.asMap().forEach((index, game) {
    for (String match in game) {
      match.split(',').forEach((cube) {
        for (int i = 0; i < cube.length; i++) {
          if (int.tryParse(cube[i]) is int) {
          } else {
            String color = cube.substring(i, cube.length).trim();
            int quantity = int.parse(cube.substring(0, i));
            quantity > games[index].maxOccCubes[color]!
                ? games[index].maxOccCubes[color] = quantity
                : null;
            break;
          }
        }
      });
    }
  });

  return games;
}

int solution(
    {required int redCube,
    required int greenCube,
    required int blueCube,
    required List<Game> games}) {
  int sumGameIDPoss = 0;
  Map<String, int> maxCubGa = {};
  games.asMap().forEach((index, value) {
    maxCubGa = value.maxOccCubes;

    maxCubGa['green']! <= greenCube &&
            maxCubGa['red']! <= redCube &&
            maxCubGa['blue']! <= blueCube
        ? sumGameIDPoss += index + 1
        : null;
  });
  return sumGameIDPoss;
}
