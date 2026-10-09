import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_constants.dart';

final sharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

class OnboardingNotifier extends StateNotifier<bool> {
  final SharedPreferences? _prefs;

  OnboardingNotifier(this._prefs)
      : super(_prefs?.getBool(AppConstants.keyOnboardingSeen) ?? false);

  Future<void> completeOnboarding() async {
    state = true;
    if (_prefs != null) {
      await _prefs.setBool(AppConstants.keyOnboardingSeen, true);
    }
  }

  Future<void> resetOnboarding() async {
    state = false;
    if (_prefs != null) {
      await _prefs.setBool(AppConstants.keyOnboardingSeen, false);
    }
  }
}

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, bool>((ref) {
  final prefsAsync = ref.watch(sharedPreferencesProvider);
  return OnboardingNotifier(prefsAsync.value);
});
