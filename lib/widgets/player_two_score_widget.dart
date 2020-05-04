import 'package:flutter/material.dart';

class PlayerTwoScoreWidget extends StatelessWidget {
  const PlayerTwoScoreWidget(
      {Key key, this.scorePoints, this.showShadow, this.isComputer})
      : super(key: key);

  final int scorePoints;
  final bool showShadow;
  final bool isComputer;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight / 4.5,
      width: screenWidth / 2.3,
      child: Stack(
        children: <Widget>[
          showShadow
              ? Positioned(
                  top: screenHeight / 100,
                  right: screenWidth / 15,
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(10 / 360),
                    child: Container(
                      width: screenWidth / 3,
                      height: screenHeight / 6,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 20.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
          Positioned(
            top: screenHeight / 100,
            right: screenWidth / 15,
            child: Container(
              width: screenWidth / 3,
              child: Image.asset(
                "assets/images/bg_pencil.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            top: screenHeight / 20,
            right: screenWidth / 9,
            child: Container(
              width: screenWidth / 3.5,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(10 / 360),
                child: Column(
                  children: <Widget>[
                    Text(
                      isComputer ? 'COMPUTER' : 'PLAYER 2',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:
                            isComputer ? screenWidth / 25 : screenWidth / 20,
                        fontFamily: "Comic Sans MS",
                      ),
                    ),
                    Text(
                      'O: $scorePoints',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth / 15,
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
