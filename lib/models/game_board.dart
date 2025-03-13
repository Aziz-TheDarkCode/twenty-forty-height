import 'dart:math';

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
    while (tilesAdded < 2) {
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

  move() {
    List<Tile> compactedArray = grid.where((tile) => tile.value != 0).toList();
    for (int col = 0; col < size; col++) {
      print("Column $col:");
      for (int row = 0; row < size; row++) {
        int index = row * size + col;
        print("Tile at ($row, $col) => Value: ${_grid[index].value}");
      }
    }
    _grid = compactedArray;
  }

  List<Tile> compactRow(List<Tile> row) {
    List<Tile> compactedRow = row.where((tile) => tile.value != 0).toList();
    while (compactedRow.length < row.length) {
      compactedRow.add(Tile(
          value: 0, col: compactedRow.length, row: row.indexOf(row.first)));
    }
    return compactedRow;
  }

  void moveLeft() {
    for (int row = 0; row < size; row++) {
      List<int> currentRow = [];
      print("Row ${row + 1}:");
      for (int col = 0; col < size; col++) {
        int index = row * size + col;
        currentRow.add(_grid[index].value);
        print("Tile at ($row, $col) => Value: ${_grid[index].value}");
      }
    }
  }
}
