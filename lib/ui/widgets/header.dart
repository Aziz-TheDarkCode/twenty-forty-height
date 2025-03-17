import 'package:flutter/material.dart';
import 'package:twenty_forty_eight/constants/colorscheme.dart';
import 'package:twenty_forty_eight/ui/widgets/controls/best_score.dart';
import 'package:twenty_forty_eight/ui/widgets/controls/reset.dart';
import 'package:twenty_forty_eight/ui/widgets/controls/score.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "2048",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: textColor),
        ),
        // Undo(),
        Row(
          spacing: 6,
          children: [
            Reset(),
            Score(),
            BestScore(),
          ],
        ),
      ],
    );
  }
}
