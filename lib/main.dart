import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/pages/menu_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe',
      debugShowCheckedModeBanner: false,
      home: MenuPage(),
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}
