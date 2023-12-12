int solution(String text) {
  int sum = 0;
  text.split('\n').forEach((singleLine) {
    sum += getCalibrationValue(singleLine);
  });
  return sum;
}

int getCalibrationValue(String singleLine) {
  String firstVal = '';
  String secondVal = '';
  bool firstTime = true;

  for (int i = 0; i < singleLine.length; i++) {
    if (firstTime && int.tryParse(singleLine[i]) is int) {
      firstVal = secondVal = singleLine[i];
      firstTime = false;
    } else {
      int.tryParse(singleLine[i]) is int ? secondVal = singleLine[i] : null;
    }
  }

  return int.parse('$firstVal$secondVal');
}
