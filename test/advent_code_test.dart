import 'package:test/test.dart';
import 'package:advent_code/day_1/second_riddle.dart' as d1r2;

void main() {
  test('d1r2', () {
    expect(d1r2.getCalibrationValue('twsixtw'), 66);
    expect(d1r2.getCalibrationValue('1tscxsd3'), 13);
    expect(d1r2.getCalibrationValue('1sdsixxc'), 16);
    expect(d1r2.getCalibrationValue('xx4ffc'), 44);
    expect(d1r2.getCalibrationValue('two1nine'), 29);
    expect(d1r2.getCalibrationValue('eightwothree'), 83);
    expect(d1r2.getCalibrationValue('abcone2threexyz'), 13);
    expect(d1r2.getCalibrationValue('xtwone3four'), 24);
    expect(d1r2.getCalibrationValue('4nineeightseven2'), 42);
    expect(d1r2.getCalibrationValue('zoneight234'), 14);
    expect(d1r2.getCalibrationValue('7pqrstsixteen'), 76);
    expect(d1r2.getCalibrationValue('ninesevensrzxkzpmgz8kcjxsbdftwoner'), 91);
  });
}
