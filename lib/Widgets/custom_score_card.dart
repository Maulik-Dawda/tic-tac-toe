import 'package:flutter/material.dart';

class CustomScoreCard extends StatelessWidget {
  final bool isActive;
  final Color color;
  final String player;
  final int score;

  const CustomScoreCard({
    super.key,
    required this.isActive,
    required this.color,
    required this.player,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isActive ? Colors.white10 : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        boxShadow: isActive
            ? [BoxShadow(color: color.withValues(alpha: 0.3), blurRadius: 12)]
            : [],
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        children: [
          Text(
            player,
            style: TextStyle(
              color: color,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Wins: $score",
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
