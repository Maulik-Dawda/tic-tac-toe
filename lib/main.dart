import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/Controller/game_controller.dart';
import 'package:tic_tac_toe/Utils/app_colors.dart';
import 'package:tic_tac_toe/View/play_screen.dart';
import 'package:tic_tac_toe/View/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tic Tac Toe',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontFamily: 'Poppins'),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
