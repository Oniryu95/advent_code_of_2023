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
  int sum = 0;

  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      if (int.tryParse(matrix[i][j]) is int) {
        sum += checkNumIsValid(matrix, i, j, getNumLength(matrix, i, j));
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
  //3 case:
  // first num : up, down, left, top left, top right
  // center num: up, down
  // last num:  up, down, right, top right, top left
  if (numLength == 1) {
    return checkOneNum(matrix, i, j);
  } else if (numLength == 2) {
    return checkTwoNums();
  } else {
    return checkMajorOfTwo();
  }
}

int checkOneNum(List<String> matrix, int i, int j) {
  bool isValid = false;

  for (var entry in positions.entries) {
    int x = i + entry.value[0];
    int y = j + entry.value[1];

    if (x >= 0 && x < matrix.length && y >= 0 && y < matrix[i].length) {
      isValid = matrix[x][y] != '.' && int.tryParse(matrix[x][y]) is! int;
    }
    if (isValid) break;
  }

  return isValid ? int.parse(matrix[i][j]) : 0;
}

int checkTwoNums() {
  return 0;
}

int checkMajorOfTwo() {
  return 0;
}
