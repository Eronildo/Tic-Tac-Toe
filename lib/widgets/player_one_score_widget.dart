import 'package:flutter/material.dart';

class PlayerOneScoreWidget extends StatelessWidget {
  const PlayerOneScoreWidget({
    Key key,
    this.scorePoints,
    this.showShadow,
  }) : super(key: key);

  final int scorePoints;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(top: screenHeight / 80),
      width: screenWidth / 2.3,
      height: screenHeight / 6,
      child: Stack(
        children: <Widget>[
          showShadow
              ? Positioned(
                  top: screenHeight / 40,
                  left: screenWidth / 25,
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(-12 / 360),
                    child: Container(
                      width: screenWidth / 2.8,
                      height: screenHeight / 13,
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
            left: screenWidth / 40,
            child: Container(
              width: screenWidth / 2.5,
              child: Image.asset(
                "assets/images/eraser.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            left: screenWidth / 10,
            child: Container(
              height: screenHeight / 10,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(-12 / 360),
                child: Column(
                  children: <Widget>[
                    Text(
                      'PLAYER 1',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth / 20,
                        fontFamily: "Comic Sans MS",
                      ),
                    ),
                    Text(
                      'X: $scorePoints',
                      style: TextStyle(
                        color: Colors.white,
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
