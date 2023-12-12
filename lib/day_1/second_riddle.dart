int solution(String text) {
  int sum = 0;
  text.split('\n').forEach((singleLine) {
    sum += getCalibrationValue(singleLine);
  });
  return sum;
}

int getCalibrationValue(String singleLine) {
  String firstValue = '', secondValue = '', subString = '';
  bool firstTime = true;

  Map<String, int> listOfNumbers = {
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9,
  };

  for (int i = 0; i < singleLine.length; i++) {
    if (int.tryParse(singleLine[i]) is int) {
      if (firstTime) {
        firstValue = secondValue = singleLine[i];
        firstTime = false;
      } else {
        secondValue = singleLine[i];
      }
    } else {
      subString = singleLine.substring(i, singleLine.length);
      if (subString.length >= 3) {
        for (String number in listOfNumbers.keys) {
          if (subString.startsWith(number)) {
            if (firstTime) {
              firstValue = secondValue = listOfNumbers[number].toString();
              firstTime = false;
              break;
            } else {
              secondValue = listOfNumbers[number].toString();
              break;
            }
          }
        }
      }
    }
  }

  return int.parse('$firstValue$secondValue');
}
