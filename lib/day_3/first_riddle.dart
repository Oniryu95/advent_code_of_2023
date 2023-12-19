Map<String, List<int>> positions = {
  'u': [-1, 0],
  'd': [1, 0],
  'l': [0, -1],
  'r': [0, 1],
  'tl': [-1, -1],
  'tr': [-1, 1],
  'bl': [1, -1],
  'br': [1, 1],
};

List<String> _createMatrix(String text) {
  List<String> matrix = [];

  text.split('\n').asMap().forEach((index, string) {
    matrix.insert(index, string.trim());
  });

  return matrix;
}

int solution(String text) {
  List<String> matrix = _createMatrix(text);
  int sum = 0, numLenght = 0, number = 0;

  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      if (int.tryParse(matrix[i][j]) is int) {
        numLenght = getNumLength(matrix, i, j);
        number = checkNumIsValid(matrix, i, j, numLenght);
        if (number != 0) {
          sum += number;
          j += numLenght - 1;
        }
      }
    }
  }
  return sum;
}

int getNumLength(List<String> matrix, int i, int j) {
  int length = 0;

  while (int.tryParse(matrix[i][j]) is int) {
    length++;
    if (j + 1 < matrix[i].length) {
      j++;
    } else {
      break;
    }
  }
  return length;
}

int checkNumIsValid(List<String> matrix, int i, int j, int numLength) {
  bool isValid = false;
  String number = "";
  int x, y;

  for (int offset = 0; offset < numLength && !isValid; offset++) {
    for (var entry in positions.entries) {
      x = i + entry.value[0];
      y = j + entry.value[1] + offset;

      if (x >= 0 && x < matrix.length && y >= 0 && y < matrix[i].length) {
        isValid = matrix[x][y] != '.' && int.tryParse(matrix[x][y]) is! int;
      }
      if (isValid) break;
    }
  }
  for (int a = 0; a < numLength; a++) {
    number += matrix[i][j + a];
  }

  return isValid ? int.parse(number) : 0;
}
