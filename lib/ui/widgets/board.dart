import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:provider/provider.dart';
import 'package:twenty_forty_eight/constants/colorscheme.dart';
import 'package:twenty_forty_eight/models/game_board.dart';
import 'package:twenty_forty_eight/providers/game_provider.dart';
import 'package:twenty_forty_eight/ui/widgets/tile.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    return SwipeDetector(
        onSwipeUp: (offset) => gameProvider.swipe(SwipeDirection.up),
        onSwipeDown: (offset) => gameProvider.swipe(SwipeDirection.down),
        onSwipeLeft: (offset) => gameProvider.swipe(SwipeDirection.left),
        onSwipeRight: (offset) => gameProvider.swipe(SwipeDirection.right),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: boardColor),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: gameProvider.gameBoard.grid.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (context, index) =>
                Tile(value: gameProvider.gameBoard.grid[index].value),
          ),
        ));
  }
}
