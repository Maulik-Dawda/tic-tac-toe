import 'package:flutter/material.dart';

class GameController extends ChangeNotifier {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  String? winner;
  bool gameOver = false;
  List<int> winningIndices = [];
  int xScore = 0;
  int oScore = 0;

  void makeMove(int index) {
    if (board[index] == '' && !gameOver) {
      board[index] = currentPlayer;
      if (_checkWinner()) {
        winner = currentPlayer;
        if (winner == 'X') xScore++;
        if (winner == 'O') oScore++;
        gameOver = true;
      } else if (!board.contains('')) {
        winner = 'Draw';
        gameOver = true;
      } else {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }
      notifyListeners();
    }
  }

  bool _checkWinner() {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] != '' &&
          board[pattern[0]] == board[pattern[1]] &&
          board[pattern[1]] == board[pattern[2]]) {
        winningIndices = pattern;
        return true;
      }
    }
    return false;
  }

  void resetGame() {
    board = List.filled(9, '');
    currentPlayer = 'X';
    winner = null;
    gameOver = false;
    winningIndices.clear();
    notifyListeners();
  }
}
