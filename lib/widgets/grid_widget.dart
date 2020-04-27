import 'package:flutter/material.dart';
import 'package:tictactoe/models/victory.dart';
import 'package:tictactoe/utils/constants.dart';
import 'package:tictactoe/utils/victory_line_painter.dart';

typedef void OnCellTapCallback(int row, int column);

class GridWidget extends StatelessWidget {
  const GridWidget({Key key, this.victory, this.field, this.onCellTap})
      : super(key: key);

  final Victory victory;
  final List<List<String>> field;
  final OnCellTapCallback onCellTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildGridLines(),
        buildGridFields(),
        victory != null ? buildVictoryLine() : Container(),
      ],
    );
  }

  buildVictoryLine() {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          child: CustomPaint(
            painter: VictoryLinePainter(victory),
          ),
        ),
      ),
    );
  }

  Widget buildGridLines() => Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildHorizontalLine,
                    buildHorizontalLine,
                  ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                buildVerticalLine,
                buildVerticalLine,
              ]),
            ],
          ),
        ),
      );

  Container get buildVerticalLine => Container(
      margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
      color: Colors.black,
      width: 5.0);

  Container get buildHorizontalLine => Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      color: Colors.black,
      height: 5.0);

  Widget buildGridFields() => Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildCell(0, 0),
                      buildCell(0, 1),
                      buildCell(0, 2),
                    ]),
              ),
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildCell(1, 0),
                      buildCell(1, 1),
                      buildCell(1, 2),
                    ]),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCell(2, 0),
                    buildCell(2, 1),
                    buildCell(2, 2),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildCell(int row, int column) => AspectRatio(
        aspectRatio: 1.0,
        child: FlatButton(
            highlightColor: Colors.black38,
            onPressed: () {
              onCellTap(row, column);
            },
            child: buildCellItem(row, column)),
      );

  Widget buildCellItem(int row, int column) {
    var cell = field[row][column];
    if (cell.isNotEmpty) {
      if (cell == Constants.playerOne) {
        return Image.asset('assets/images/X.png');
      } else {
        return Image.asset('assets/images/O.png');
      }
    } else {
      return null;
    }
  }
}
