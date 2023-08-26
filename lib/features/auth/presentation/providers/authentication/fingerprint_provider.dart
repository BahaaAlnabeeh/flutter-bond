import 'package:bond/features/auth/presentation/views/authentication/fingerprint_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'fingerprint_notifier.dart';

part 'fingerprint_state.dart';

final fingerprintNotifierProvider = NotifierProvider<FingerprintNotifier, FingerprintState>(
  () => FingerprintNotifier(),
);

