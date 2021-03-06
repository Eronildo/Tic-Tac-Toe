import 'package:flutter/material.dart';
import 'package:tictactoe/pages/game_page.dart';
import 'package:tictactoe/utils/slide_page_route.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('TIC-TAC-TOE'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/bg_menu.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: <Widget>[
            getMenuButton(context, "assets/images/one_player.png", true,
                screenHeight * 3 / 9, screenWidth / 8, screenHeight / 12),
            getMenuButton(context, "assets/images/two_players.png", false,
                screenHeight / 2, screenWidth / 16, screenHeight / 12),
          ],
        ),
      ),
    );
  }

  Widget getMenuButton(BuildContext context, String imageAsset,
      bool isOnePlayer, double top, double left, double size) {
    return Positioned(
      top: top,
      left: left,
      child: FlatButton(
        highlightColor: Colors.black26,
        onPressed: () {
          Navigator.of(context).push(
              SlidePageRoute(widget: GamePage(isOnePlayer), isRight: false));
        },
        child: Image.asset(imageAsset, height: size),
      ),
    );
  }
}
