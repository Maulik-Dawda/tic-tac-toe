import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/Controller/game_controller.dart';
import 'package:tic_tac_toe/Utils/app_colors.dart';
import 'package:tic_tac_toe/Widgets/custom_game_board.dart';
import 'package:tic_tac_toe/Widgets/custom_score_card.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameController>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Tic Tac Toe",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomScoreCard(
                  isActive: game.currentPlayer == "X",
                  color: AppColors.xColor,
                  player: "X",
                  score: game.xScore,
                ),
                const SizedBox(width: 30),
                CustomScoreCard(
                  isActive: game.currentPlayer == "O",
                  color: AppColors.oColor,
                  player: "O",
                  score: game.oScore,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              game.winner == null
                  ? "Current Player: ${game.currentPlayer}"
                  : game.winner == 'Draw'
                  ? "It's a Draw!"
                  : "🎉 ${game.winner} Wins!",
              style: TextStyle(
                color: game.winner == 'X'
                    ? AppColors.xColor
                    : game.winner == 'O'
                    ? AppColors.oColor
                    : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: CustomGameBoard(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.gridColor,
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {
                HapticFeedback.mediumImpact();
                game.resetGame();
              },
              child: const Text(
                "Restart",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
