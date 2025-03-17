class Position {
  int row;
  int col;

  Position({required this.row, required this.col});
}

class Tile {
  int _value;
  final Position _position;

  int get value => _value;
  Position get position => _position;

  set updateValue(int newValue) => _value = newValue;

  // set updatePosition(Position coordinates) {
  //   _position.col = coordinates.col;
  //   _position.row = coordinates.row;
  // }

  Tile({required int value, required int row, required int col})
      : _value = value,
        _position = Position(row: row, col: col);
}
