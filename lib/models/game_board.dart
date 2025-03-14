import 'dart:math';

import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:twenty_forty_eight/models/tile.dart';

class GameBoard {
  List<Tile> _grid = [];
  static const size = 4;
  int moves = 0;
  GameBoard() {
    _grid = List.generate(size * size, (index) {
      int row = index ~/ size;
      int col = index % size;
      return Tile(value: 0, row: row, col: col);
    }, growable: false);
    _addRandomTiles();
  }
  List<Tile> get grid => _grid;
  void _addRandomTiles() {
    int tilesAdded = 0;
    while (tilesAdded < 3) {
      spawnNewTile();
      tilesAdded++;
    }
  }

  void spawnNewTile() {
    moves++;
    final random = Random();
    var emptyCells = grid.where((cell) => cell.value == 0).toList();
    if (emptyCells.isNotEmpty) {
      int randomIndex = random.nextInt(emptyCells.length);
      int newTileValue = random.nextDouble() < 0.9 ? 2 : 4;
      emptyCells[randomIndex].updateValue = newTileValue;
    }
  }

  void resetBoard() {
    for (var tile in grid) {
      tile.updateValue = 0;
    }
    _addRandomTiles();
  }

  bool isGameOver() {
    var emptyCells = grid.where((cell) => cell.value == 0).toList();
    return emptyCells.isEmpty;
  }

  void moveHorizontally({SwipeDirection direction = SwipeDirection.left}) {
    for (int row = 0; row < size; row++) {
      List<int> currentRow = [];
      for (int col = 0; col < size; col++) {
        int index = row * size + col;
        currentRow.add(_grid[index].value);
      }
      List<int> newRow;
      if (direction == SwipeDirection.left) {
        newRow = compactRow(row: currentRow, direction: "left");
      } else {
        newRow = compactRow(row: currentRow, direction: "right");
      }

      for (int col = 0; col < size; col++) {
        int index = row * size + col;
        _grid[index].updateValue = newRow[col];
      }
    }
  }

  void moveVertically({SwipeDirection direction = SwipeDirection.up}) {
    for (int col = 0; col < size; col++) {
      List<int> currentCol = [];
      for (int row = 0; row < size; row++) {
        int index = row * size + col;
        currentCol.add(_grid[index].value);
      }
      List<int> newCol;
      if (direction == SwipeDirection.up) {
        newCol =
            compactRow(row: currentCol, direction: "left"); // "left" for up
      } else {
        newCol =
            compactRow(row: currentCol, direction: "right"); // "right" for down
      }
      for (int row = 0; row < size; row++) {
        int index = row * size + col;
        _grid[index].updateValue = newCol[row];
      }
    }
  }

  List<int> compactRow({required List<int> row, String direction = "left"}) {
    List<int> filtered = row.where((tile) => tile != 0).toList();
    List<int> merged = [];

    if (direction == "left") {
      for (int i = 0; i < filtered.length; i++) {
        if (i < filtered.length - 1 && filtered[i] == filtered[i + 1]) {
          merged.add(filtered[i] * 2);
          i++;
        } else {
          merged.add(filtered[i]);
        }
      }
    } else {
      List<int> reversed = filtered.reversed.toList();
      for (int i = 0; i < reversed.length; i++) {
        if (i < reversed.length - 1 && reversed[i] == reversed[i + 1]) {
          merged.add(reversed[i] * 2);
          i++;
        } else {
          merged.add(reversed[i]);
        }
      }

      merged = merged.reversed.toList();
    }
    while (merged.length < row.length) {
      if (direction == "left") {
        merged.add(0);
      } else {
        merged.insert(0, 0);
      }
    }
    return merged;
  }
}
