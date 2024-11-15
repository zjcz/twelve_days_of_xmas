import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'persistence/local_storage_player_progress_persistence.dart';
import 'persistence/player_progress_persistence.dart';

part 'player_progress_controller.g.dart';

/// Encapsulates the player's progress
@riverpod
class PlayerProgressController extends _$PlayerProgressController {
  static final _log = Logger('PlayerProgressController');

  /// The persistence store that is used to save player progress.
  final PlayerProgressPersistence _store;

  /// Creates a new instance of [PlayerProgressPersistence] backed by [store].
  ///
  /// By default, settings are persisted using [LocalStoragePlayerProgressPersistence]
  /// (i.e. NSUserDefaults on iOS, SharedPreferences on Android or
  /// local storage on the web).
  PlayerProgressController({PlayerProgressPersistence? store})
      : _store = store ?? LocalStoragePlayerProgressPersistence();

  @override
  Future<List<int>> build() async {
    final scores = await _store.getFinishedLevels();
    _log.fine(() => 'Loaded high scores: $scores');
    return scores;
  }

  void resetScores() async {
    _store.reset();
    ref.invalidateSelf();
  }

  void setLevelFinished(int level, int time) async {
    await _store.saveLevelFinished(level, time);
    ref.invalidateSelf();
  }
}
