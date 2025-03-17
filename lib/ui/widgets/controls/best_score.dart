import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenty_forty_eight/constants/colorscheme.dart';
import 'package:twenty_forty_eight/providers/game_provider.dart';

class BestScore extends StatelessWidget {
  const BestScore({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gameboard, child) {
        return Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: emptyTileColor,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: Column(
              children: [
                Text(
                  "Score",
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
                Text(gameboard.gameBoard.score.toString(),
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))
              ],
            ));
      },
    );
  }
}
