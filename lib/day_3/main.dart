import 'dart:io';

import 'package:advent_code/day_3/first_riddle.dart';

void main(List<String> args) async {
  File file = File('assets/riddle_3.txt');
  String text = file.readAsStringSync();
  solution(text);
}
