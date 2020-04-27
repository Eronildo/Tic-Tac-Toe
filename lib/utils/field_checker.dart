import 'package:tictactoe/models/victory.dart';

import 'enums.dart';

class FieldChecker {
  static bool checkForDraw(List<List<String>> field) {
    return field[0][0].isNotEmpty &&
        field[0][1].isNotEmpty &&
        field[0][2].isNotEmpty &&
        field[1][0].isNotEmpty &&
        field[1][1].isNotEmpty &&
        field[1][2].isNotEmpty &&
        field[2][0].isNotEmpty &&
        field[2][1].isNotEmpty &&
        field[2][2].isNotEmpty;
  }

  static Victory checkForVictory(List<List<String>> field) {
    //check horizontal lines
    if (field[0][0].isNotEmpty &&
        field[0][0] == field[0][1] &&
        field[0][0] == field[0][2]) {
      return new Victory(LineTypes.HORIZONTAL, row: 0);
    } else if (field[1][0].isNotEmpty &&
        field[1][0] == field[1][1] &&
        field[1][0] == field[1][2]) {
      return new Victory(LineTypes.HORIZONTAL, row: 1);
    } else if (field[2][0].isNotEmpty &&
        field[2][0] == field[2][1] &&
        field[2][0] == field[2][2]) {
      return new Victory(LineTypes.HORIZONTAL, row: 2);
    }

    //check vertical lines
    else if (field[0][0].isNotEmpty &&
        field[0][0] == field[1][0] &&
        field[0][0] == field[2][0]) {
      return new Victory(LineTypes.VERTICAL, column: 0);
    } else if (field[0][1].isNotEmpty &&
        field[0][1] == field[1][1] &&
        field[0][1] == field[2][1]) {
      return new Victory(LineTypes.VERTICAL, column: 1);
    } else if (field[0][2].isNotEmpty &&
        field[0][2] == field[1][2] &&
        field[0][2] == field[2][2]) {
      return new Victory(LineTypes.VERTICAL, column: 2);
    }

    //check diagonal
    else if (field[0][0].isNotEmpty &&
        field[0][0] == field[1][1] &&
        field[0][0] == field[2][2]) {
      return new Victory(LineTypes.DIAGONAL_DESCENDING);
    } else if (field[2][0].isNotEmpty &&
        field[2][0] == field[1][1] &&
        field[2][0] == field[0][2]) {
      return new Victory(LineTypes.DIAGONAL_ASCENDING);
    }

    return null;
  }
}
