import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenty_forty_eight/providers/game_provider.dart';
import 'package:twenty_forty_eight/ui/widgets/board.dart';
import 'package:twenty_forty_eight/ui/widgets/header.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: const MainApp(),
    create: (context) => GameProvider(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<GameProvider>(
        builder: (_, gameboard, __) {
          return Scaffold(
            body: SafeArea(
                child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                spacing: 20,
                children: [
                  Header(),
                  Text(gameboard.isGameOver() ? "Game Over" : ""),
                  Board()
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
