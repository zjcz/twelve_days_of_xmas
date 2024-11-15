import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:twelve_days_of_xmas/player_progress/player_progress_controller.dart';
import 'package:twelve_days_of_xmas/route_config.dart';
import 'package:twelve_days_of_xmas/service_locator.dart';

import '../audio/audio_manager.dart';
import '../audio/sounds.dart';
import '../style/palette.dart';
import '../style/game_button.dart';
import 'instructions_dialog.dart';
import 'levels.dart';

class LevelSelectionScreen extends ConsumerWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = getIt<Palette>();
    final currentPlayerProgress = ref.watch(playerProgressControllerProvider);
    final levelTextStyle =
        Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.4);

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection.color,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select level',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(width: 16),
                  NesButton(
                    type: NesButtonType.normal,
                    child: NesIcon(iconData: NesIcons.questionMark),
                    onPressed: () {
                      NesDialog.show<void>(
                        context: context,
                        builder: (_) => const InstructionsDialog(),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: SizedBox(
              width: 450,
              child: currentPlayerProgress.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) =>
                    Center(child: Text('Error loading data: $error')),
                data: (playerProgress) => ListView(
                  children: [
                    for (final level in gameLevels)
                      ListTile(
                        enabled:
                            playerProgress.length >= level.number - 1,
                        onTap: () {
                          final audioManager = getIt<AudioManager>();
                          audioManager.playSfx(SfxType.buttonTap);

                          GoRouter.of(context)
                              .go('${RouteDefs.playLevel}${level.number}');
                        },
                        leading: Text(
                          level.number.toString(),
                          style: levelTextStyle,
                        ),
                        title: Row(
                          children: [
                            Text(
                              'Level #${level.number}',
                              style: levelTextStyle,
                            ),
                            if (playerProgress.length <
                                level.number - 1) ...[
                              const SizedBox(width: 10),
                              const Icon(Icons.lock, size: 20),
                            ] else if (playerProgress.length >=
                                level.number) ...[
                              const SizedBox(width: 50),
                              Text(
                                '${playerProgress[level.number - 1]}s',
                                style: levelTextStyle,
                              ),
                            ],
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          GameButton(
            onPressed: () {
              GoRouter.of(context).go(RouteDefs.home);
            },
            child: const Text('Back'),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
