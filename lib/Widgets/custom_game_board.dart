import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Widgets/custom_cell_tile.dart';

class CustomGameBoard extends StatelessWidget {
  const CustomGameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 9,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => CustomCellTile(index: index),
    );
  }
}
