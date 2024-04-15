import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:test_app/game/flappy_bird_game.dart';
import 'package:test_app/Pages/main_menu_screen.dart';
import 'package:test_app/Pages/game_over_screen.dart';

class GamePage extends StatelessWidget {
  final GameWidget gameWidget;

  const GamePage({Key? key, required this.gameWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: gameWidget,
    );
  }
}

Future<GameWidget> maingame() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();

  final game = FlappyBirdGame();
  final gameWidget = GameWidget(
    game: game,
    initialActiveOverlays: const [MainMenuScreen.id],
    overlayBuilderMap: {
      'mainMenu': (context, _) => MainMenuScreen(game: game),
      'gameOver': (context, _) => GameOverScreen(game: game),
    },
  );

  return gameWidget;
}
