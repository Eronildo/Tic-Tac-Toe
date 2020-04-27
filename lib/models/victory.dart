import 'package:tictactoe/utils/enums.dart';

class Victory {
  final LineTypes lineType;
  final int row;
  final int column;

  Victory(this.lineType, {this.row, this.column});
}
