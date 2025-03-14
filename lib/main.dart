import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenty_forty_eight/constants/colorscheme.dart';
import 'package:twenty_forty_eight/providers/game_provider.dart';
import 'package:twenty_forty_eight/ui/widgets/board.dart';
import 'package:twenty_forty_eight/ui/widgets/controls/reset.dart';
import 'package:twenty_forty_eight/ui/widgets/controls/score.dart';
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
    var gameProvider = Provider.of<GameProvider>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [Header(), Board()],
          ),
        ),
      ),
    );
  }
}
