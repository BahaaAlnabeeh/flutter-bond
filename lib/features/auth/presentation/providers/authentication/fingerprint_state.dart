part of 'fingerprint_provider.dart';

class FingerprintState {
  final bool isAuthenticated;
  final bool loading;
  final String? error;

  FingerprintState({
    required this.isAuthenticated,
    required this.loading,
    this.error,
  });

  factory FingerprintState.initial() {
    return FingerprintState(
      isAuthenticated: false,
      loading: false,
    );
  }

  FingerprintState copyWith({
    bool? isAuthenticated,
    bool? loading,
    String? error,
  }) {
    return FingerprintState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }
}