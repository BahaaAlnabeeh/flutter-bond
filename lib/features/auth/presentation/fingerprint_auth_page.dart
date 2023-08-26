import 'package:auto_route/auto_route.dart';
import 'package:bond/core/localizations/app_localizations_extension.dart';
import 'package:bond/features/auth/presentation/providers/authentication/fingerprint_provider.dart';
import 'package:bond/routes/app_router.dart';
import 'package:bond_core/bond_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FingerprintAuthPage extends ConsumerWidget {
  const FingerprintAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fingerprintState = ref.watch(fingerprintNotifierProvider);
    final fingerprintNotifier = ref.read(fingerprintNotifierProvider.notifier);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            context.localizations.fingerprint_confirm,
            style: context.textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 20),
            child: Text(
              context.localizations.use_fingerprint,
              style: context.textTheme.titleMedium,
            ),
          ),
          Divider(
            color: context.colorScheme.surface,
          ),
          ElevatedButton.icon(
            onPressed: () async {
              await fingerprintNotifier.authenticate();
              if (fingerprintState.isAuthenticated) {
                context.router.push(const MainRoute());
              }
            },
            icon: const Icon(Icons.fingerprint),
            label: Text(
              context.localizations.authenticate,
            ),
          ),
          if (fingerprintState.error != null)
            Text(
              fingerprintState.error!,
            ),
        ],
      ),
    );
  }
}