import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenty_forty_eight/constants/colorscheme.dart';
import 'package:twenty_forty_eight/providers/game_provider.dart';

class Reset extends StatelessWidget {
  const Reset({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gameboard, child) {
        return TextButton(
            style: TextButton.styleFrom(
              foregroundColor: textColor,
            ),
            onPressed: gameboard.resetGame,
            child: Icon(
              Icons.refresh,
              size: 30.0,
              color: textColor,
            ));
      },
    );
  }
}
