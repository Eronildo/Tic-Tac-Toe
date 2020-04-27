import 'package:flutter/material.dart';
import 'package:tictactoe/utils/enums.dart';

class PlayerScoreWidget extends StatelessWidget {
  const PlayerScoreWidget({
    Key key,
    this.player,
    this.scorePoints,
    this.showShadow,
  }) : super(key: key);

  final Player player;
  final int scorePoints;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    var isPlayerOne = player == Player.ONE;
    return Padding(
      padding: EdgeInsets.only(top: isPlayerOne ? 20.0 : 0.0),
      child: Stack(
        children: <Widget>[
          showShadow
              ? Padding(
                  padding: EdgeInsets.only(top: isPlayerOne ? 30.0 : 0.0),
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(
                        isPlayerOne ? (-12 / 360) : (10 / 360)),
                    child: Container(
                      width: 150.0,
                      height: isPlayerOne ? 60.0 : 150.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius:
                                20.0, // has the effect of softening the shadow
                            spreadRadius:
                                1.0, // has the effect of extending the shadow
                            offset: Offset(
                              5.0, // horizontal, move right 10
                              5.0, // vertical, move down 10
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
          Container(
            width: isPlayerOne ? 160.0 : 150.0,
            height: isPlayerOne ? 120.0 : 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    isPlayerOne
                        ? "assets/images/eraser.png"
                        : "assets/images/bg_pencil.png",
                  ),
                  fit: BoxFit.fitWidth),
            ),
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(
                  isPlayerOne ? (-12 / 360) : (10 / 360)),
              child: Padding(
                padding: EdgeInsets.only(
                  top: isPlayerOne ? 0.0 : 45.0,
                  right: isPlayerOne ? 5.0 : 15.0,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      isPlayerOne
                          ? 'PLAYER 1'
                          : player == Player.TWO ? 'PLAYER 2' : 'COMPUTER',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: isPlayerOne ? 22.0 : 19.0,
                        fontFamily: "Comic Sans MS",
                      ),
                    ),
                    SizedBox(
                      height: isPlayerOne ? 5.0 : 0.0,
                    ),
                    Text(
                      "${isPlayerOne ? 'X: ' : 'O: '}$scorePoints",
                      style: TextStyle(
                        color: isPlayerOne ? Colors.white : Colors.black,
                        fontSize: 28.0,
                        fontFamily: "Comic Sans MS",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
