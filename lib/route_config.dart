import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:twelve_days_of_xmas/level_selection/level_selection_screen.dart';

import 'flame_game/game_screen.dart';
import 'level_selection/levels.dart';
import 'main_menu/main_menu_screen.dart';
import 'service_locator.dart';
import 'settings/settings_screen.dart';
import 'style/page_transition.dart';
import 'style/palette.dart';

class RouteDefs {
  static const String home = '/';
  static const String play = '/play';
  static const String playLevel = '/play/session/';
  static const String settings = '/settings';

  static String getPageName(String pageName, {String? parentPage}) {
    return pageName.replaceAll(parentPage ?? '', '').substring(1);
  }
}

GoRouter setupRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: RouteDefs.home,
        builder: (context, state) =>
            const MainMenuScreen(key: Key('main menu')),
        routes: [
          GoRoute(
            path: RouteDefs.getPageName(RouteDefs.play),
            pageBuilder: (context, state) => buildPageTransition<void>(
              key: const ValueKey('play'),
              color: getIt<Palette>().backgroundLevelSelection.color,
              child: const LevelSelectionScreen(
                key: Key('level selection'),
              ),
            ),
            routes: [
              GoRoute(
                path: RouteDefs.getPageName('${RouteDefs.playLevel}:level',
                    parentPage: RouteDefs.play),
                pageBuilder: (context, state) {
                  final levelNumber = int.parse(state.pathParameters['level']!);
                  final level = gameLevels[levelNumber - 1];
                  return buildPageTransition<void>(
                    key: const ValueKey('level'),
                    color: getIt<Palette>().backgroundPlaySession.color,
                    child: GameScreen(level: level),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: RouteDefs.getPageName(RouteDefs.settings),
            builder: (context, state) => const SettingsScreen(
              key: Key('settings'),
            ),
          ),
        ],
      ),
    ],
  );
}
