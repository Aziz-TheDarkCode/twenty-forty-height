import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenty_forty_eight/constants/colorscheme.dart';
import 'package:twenty_forty_eight/providers/game_provider.dart';

class Score extends StatelessWidget {
  const Score({super.key});
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
                  "Best",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                Text(gameboard.gameBoard.bestScore.toString(),
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
