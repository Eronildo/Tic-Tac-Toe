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
                screenHeight * 3 / 8, screenWidth * 1 / 8),
            getMenuButton(context, "assets/images/two_players.png", false,
                screenHeight * 1 / 2, screenWidth * 1 / 8),
          ],
        ),
      ),
    );
  }

  Widget getMenuButton(BuildContext context, String imageAsset,
      bool isOnePlayer, double top, double left) {
    return Positioned(
      top: top,
      left: left,
      child: FlatButton(
        highlightColor: Colors.black26,
        onPressed: () {
          Navigator.of(context).push(
              SlidePageRoute(widget: GamePage(isOnePlayer), isRight: false));
        },
        child: Image.asset(imageAsset, height: 60.0),
      ),
    );
  }
}
