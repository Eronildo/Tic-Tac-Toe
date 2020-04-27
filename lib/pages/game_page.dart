import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tictactoe/models/victory.dart';
import 'package:tictactoe/utils/ai.dart';
import 'package:tictactoe/utils/constants.dart';
import 'package:tictactoe/utils/enums.dart';
import 'package:tictactoe/utils/field_checker.dart';
import 'package:tictactoe/widgets/grid_widget.dart';
import 'package:tictactoe/widgets/player_score_widget.dart';
import 'package:tictactoe/widgets/popup_widget.dart';

class GamePage extends StatefulWidget {
  final bool isOnePlayer;
  GamePage(this.isOnePlayer);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Turn _currentTurn;
  List<List<String>> _field;
  bool _showPopUp;
  int _playerOneScore, _playerTwoScore;
  String _message;
  Victory _victory;
  AI _ai;
  Turn _lastTurnStarted;

  @override
  void initState() {
    _playerOneScore = _playerTwoScore = 0;
    _currentTurn = Turn.X;
    _reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isOnePlayer)
      _ai = AI(_field, Constants.playerOne, Constants.playerTwo);

    return Scaffold(
      appBar: AppBar(
        title: Text('TIC-TAC-TOE'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: _getBackgroundDecoration(),
        child: Stack(
          children: <Widget>[
            _buildPlayersScores(),
            GridWidget(
              victory: _victory,
              field: _field,
              onCellTap: _onCellTap,
            ),
            _buildBackToMenuButton(),
            _showPopUp ? _showWinDrawPopup() : Container(),
          ],
        ),
      ),
    );
  }

  void _reset() {
    _victory = null;
    _showPopUp = false;
    _field = [
      ['', '', ''],
      ['', '', ''],
      ['', '', '']
    ];
    _message = '';
    _lastTurnStarted = _currentTurn;
  }

  Decoration _getBackgroundDecoration() => BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/bg_game.png",
            ),
            fit: BoxFit.fill),
      );

  Widget _buildPlayersScores() => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PlayerScoreWidget(
              player: Player.ONE,
              scorePoints: _playerOneScore,
              showShadow: _currentTurn == Turn.X,
            ),
            PlayerScoreWidget(
              player: widget.isOnePlayer ? Player.COMPUTER : Player.TWO,
              scorePoints: _playerTwoScore,
              showShadow: _currentTurn == Turn.O,
            ),
          ],
        ),
      );

  Widget _buildBackToMenuButton() => Positioned(
        bottom: 20.0,
        child: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            "assets/images/back_menu.png",
            fit: BoxFit.fill,
          ),
        ),
      );

  void _onCellTap(int row, int column) {
    if (!_showPopUp &&
        (!widget.isOnePlayer ||
            (widget.isOnePlayer && _currentTurn == Turn.X))) {
      if (_field[row][column].isEmpty) {
        setState(() {
          var player = _currentTurn == Turn.X
              ? Constants.playerOne
              : Constants.playerTwo;
          _field[row][column] = player;
          _checkField(player);
        });
      }
    }
  }

  void _checkField(String player) {
    _victory = FieldChecker.checkForVictory(_field);

    var win = _victory != null;
    var draw = false;

    var isOneTurn = player == Constants.playerOne;

    if (!win) {
      draw = FieldChecker.checkForDraw(_field);
      if (draw) {
        _message = 'DRAW\n GAME!';
      }
    } else {
      if (isOneTurn) {
        _playerOneScore++;
        _message = 'PLAYER ONE\n WINS!';
      } else {
        _playerTwoScore++;
        _message =
            widget.isOnePlayer ? 'COMPUTER\n WINS!' : 'PLAYER TWO\n WINS!';
      }
    }

    _showPopUp = win || draw;

    if (!_showPopUp && widget.isOnePlayer && isOneTurn) _startAiTurn();

    _setNextTurn(win, draw);
  }

  void _setNextTurn(bool isWin, bool isDraw) {
    if (isWin) {
      if (_currentTurn == Turn.X)
        _currentTurn = Turn.X;
      else
        _currentTurn = Turn.O;
    } else {
      if (isDraw) {
        if (_lastTurnStarted == Turn.X)
          _currentTurn = Turn.O;
        else
          _currentTurn = Turn.X;
      } else {
        if (_currentTurn == Turn.X)
          _currentTurn = Turn.O;
        else
          _currentTurn = Turn.X;
      }
    }
  }

  Widget _showWinDrawPopup() {
    return PopUpWidget(
      message: _message,
      onTap: () {
        setState(() {
          _reset();
          if (widget.isOnePlayer && _currentTurn == Turn.O) _startAiTurn();
        });
      },
    );
  }

  void _startAiTurn() {
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        var aiDecision = _ai?.getDecision();
        _field[aiDecision.row][aiDecision.column] = Constants.playerTwo;

        Timer(Duration(milliseconds: 600), () {
          setState(() {
            _checkField(Constants.playerTwo);
          });
        });
      });
    });
  }
}
