import 'package:flutter/material.dart';
import 'package:twenty_forty_eight/constants/colorscheme.dart';

class Tile extends StatefulWidget {
  int value;
  Tile({super.key, required this.value});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30,
        child: Container(
            decoration: BoxDecoration(
                color: tileColors[widget.value],
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: Center(
              child: Text(
                widget.value == 0 ? "" : widget.value.toString(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: widget.value < 8 ? textColor : Colors.white),
              ),
            )));
  }
}
