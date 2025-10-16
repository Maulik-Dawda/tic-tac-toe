import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/Controller/game_controller.dart';
import 'package:tic_tac_toe/Utils/app_colors.dart';

class CustomCellTile extends StatelessWidget {
  final int index;
  const CustomCellTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameController>(context);
    bool isWinningCell = game.winningIndices.contains(index);

    return GestureDetector(
      onTap: () => game.makeMove(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isWinningCell
              ? AppColors.winHighlight.withValues(alpha: 0.3)
              : Colors.transparent,
          border: Border.all(color: AppColors.gridColor, width: 2),
          boxShadow: isWinningCell
              ? [
            BoxShadow(
                color: AppColors.winHighlight.withValues(alpha: 0.3),
                blurRadius: 12)
          ]
              : [],
        ),
        child: Center(
          child: AnimatedScale(
            scale: game.board[index] != '' ? 1.2 : 0.8,
            duration: const Duration(milliseconds: 300),
            child: Text(
              game.board[index],
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: game.board[index] == 'X'
                    ? AppColors.xColor
                    : AppColors.oColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
