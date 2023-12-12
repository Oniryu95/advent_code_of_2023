import 'dart:io';
import 'package:advent_code/day_1/second_riddle.dart' as d1r2;

void main(List<String> arguments) async {
  File file = File('assets/riddle_1.txt');
  String text = await file.readAsString();
  print(d1r2.solution(text));
}
