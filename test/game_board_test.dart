import 'package:test/test.dart' show expect, group, test;
import 'package:twenty_forty_eight/models/game_board.dart';
import 'package:twenty_forty_eight/models/tile.dart';

void main() {
  GameBoard gameBoard = GameBoard();
  group("Game initialization", () {
    test("Check if the board has 16 tiles", () {
      expect(gameBoard.grid.length, 16);
    });
    test("Check if at least two tiles are not empty", () {
      List<Tile> filledTiles =
          gameBoard.grid.where((tile) => tile.value != 0).toList();
      expect(filledTiles.length, 2);
    });
  });
}
