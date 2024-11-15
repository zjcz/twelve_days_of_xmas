import 'package:get_it/get_it.dart';
import 'audio/audio_manager.dart';
import 'style/palette.dart';

// This is the global ServiceLocator
GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Palette>(Palette());
  getIt.registerSingleton<AudioManager>(AudioManager());
}

void disposeServiceLocator() {
  AudioManager audioManager = getIt<AudioManager>();
  audioManager.dispose();

  getIt.reset();
}
