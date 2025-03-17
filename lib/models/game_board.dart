import 'dart:math';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:twenty_forty_eight/models/tile.dart';

class GameBoard {
  List<Tile> _grid = [];
  int size = 4;
  int score = 0;
  int bestScore = 0;
  bool gameOver = false;

  GameBoard() {
    resetBoard();
  }

  List<Tile> get grid => _grid;

  void resetBoard() {
    score = 0;
    gameOver = false;
    _grid = List.generate(size * size, (index) {
      int row = index ~/ size;
      int col = index % size;
      return Tile(value: 0, row: row, col: col);
    });
    addRandomTile();
    addRandomTile();
  }

  void addRandomTile() {
    final random = Random();
    var emptyCells = _grid.where((cell) => cell.value == 0).toList();
    if (emptyCells.isNotEmpty) {
      int randomIndex = random.nextInt(emptyCells.length);
      int newValue = random.nextDouble() < 0.9 ? 2 : 4;
      emptyCells[randomIndex].updateValue = newValue;
    }
  }

  bool isGameOver() {
    if (_grid.any((tile) => tile.value == 0)) {
      return false;
    }

    for (int row = 0; row < size; row++) {
      for (int col = 0; col < size - 1; col++) {
        int index = row * size + col;
        int nextIndex = row * size + (col + 1);
        if (_grid[index].value == _grid[nextIndex].value) {
          return false;
        }
      }
    }
    for (int col = 0; col < size; col++) {
      for (int row = 0; row < size - 1; row++) {
        int index = row * size + col;
        int nextIndex = (row + 1) * size + col;
        if (_grid[index].value == _grid[nextIndex].value) {
          return false;
        }
      }
    }

    return true;
  }

  bool move(SwipeDirection direction) {
    bool moved = false;
    switch (direction) {
      case SwipeDirection.left:
      case SwipeDirection.right:
        moved = moveHorizontally(direction: direction);
        break;
      case SwipeDirection.up:
      case SwipeDirection.down:
        moved = moveVertically(direction: direction);
        break;
    }

    if (moved) {
      if (score > bestScore) {
        bestScore = score;
      }

      addRandomTile();
      gameOver = isGameOver();
      return true;
    }
    return false;
  }

  bool moveHorizontally({required SwipeDirection direction}) {
    bool moved = false;
    for (int row = 0; row < size; row++) {
      List<int> currentRow = [];
      for (int col = 0; col < size; col++) {
        int index = row * size + col;
        currentRow.add(_grid[index].value);
      }

      List<int> newRow;
      if (direction == SwipeDirection.left) {
        newRow = compactRow(currentRow, "left");
      } else {
        newRow = compactRow(currentRow, "right");
      }
      bool rowChanged = false;
      for (int col = 0; col < size; col++) {
        if (currentRow[col] != newRow[col]) {
          rowChanged = true;
          break;
        }
      }

      if (rowChanged) {
        moved = true;
        for (int col = 0; col < size; col++) {
          int index = row * size + col;
          _grid[index].updateValue = newRow[col];
        }
      }
    }

    return moved;
  }

  bool moveVertically({required SwipeDirection direction}) {
    bool moved = false;

    for (int col = 0; col < size; col++) {
      List<int> currentCol = [];
      for (int row = 0; row < size; row++) {
        int index = row * size + col;
        currentCol.add(_grid[index].value);
      }

      List<int> newCol;
      if (direction == SwipeDirection.up) {
        newCol = compactRow(currentCol, "left"); // "left" for up
      } else {
        newCol = compactRow(currentCol, "right"); // "right" for down
      }

      // Check if column changed
      bool colChanged = false;
      for (int row = 0; row < size; row++) {
        if (currentCol[row] != newCol[row]) {
          colChanged = true;
          break;
        }
      }

      if (colChanged) {
        moved = true;
        for (int row = 0; row < size; row++) {
          int index = row * size + col;
          _grid[index].updateValue = newCol[row];
        }
      }
    }

    return moved;
  }

  List<int> compactRow(List<int> row, String direction) {
    List<int> filtered = row.where((value) => value != 0).toList();
    List<int> result = [];

    if (direction == "left") {
      for (int i = 0; i < filtered.length; i++) {
        if (i < filtered.length - 1 && filtered[i] == filtered[i + 1]) {
          result.add(filtered[i] * 2);
          score += filtered[i] * 2;
          i++;
        } else {
          result.add(filtered[i]);
        }
      }

      while (result.length < row.length) {
        result.add(0);
      }
    } else {
      List<int> reversedFiltered = filtered.reversed.toList();
      for (int i = 0; i < reversedFiltered.length; i++) {
        if (i < reversedFiltered.length - 1 &&
            reversedFiltered[i] == reversedFiltered[i + 1]) {
          result.add(reversedFiltered[i] * 2);
          score += reversedFiltered[i] * 2;
          i++;
        } else {
          result.add(reversedFiltered[i]);
        }
      }
      result = result.reversed.toList();
      while (result.length < row.length) {
        result.insert(0, 0);
      }
    }
    return result;
  }
}
