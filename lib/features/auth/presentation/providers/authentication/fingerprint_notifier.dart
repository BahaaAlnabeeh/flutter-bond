part of 'fingerprint_provider.dart';

class FingerprintNotifier extends Notifier<FingerprintState> {

  @override
  FingerprintState build() => FingerprintState.initial();

  Future<void> authenticate() async {
    state = state.copyWith(loading: true, error: null);
    bool canAuthenticate = await FingerprintAuthentication.canAuthenticate();
    if (canAuthenticate) {
      bool auth = await FingerprintAuthentication.authentication();
      state = state.copyWith(loading: false);

      if (auth) {
        state = state.copyWith(isAuthenticated: true);
      } else {
        state = state.copyWith(error: "Authentication failed");
      }
    } else {
      state = state.copyWith(loading: false, error: "Biometrics not available");
    }
  }
}