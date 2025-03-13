import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:twenty_forty_eight/models/game_board.dart';

class GameProvider extends ChangeNotifier {
  late GameBoard gameBoard;

  GameProvider() {
    gameBoard = GameBoard();
  }
  void resetGame() {
    gameBoard.resetBoard();
    notifyListeners();
  }

  bool isGameOver() => gameBoard.isGameOver();

  swipe(SwipeDirection direction) {
    if (!gameBoard.isGameOver()) {
      gameBoard.spawnNewTile();
    }
    gameBoard.moveLeft();
    notifyListeners();
  }
}
