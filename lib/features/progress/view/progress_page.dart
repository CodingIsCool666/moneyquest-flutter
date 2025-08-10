import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneyquest/l10n/app_localizations.dart';

import '../../../state/progress_store.dart';

class ProgressPage extends ConsumerWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final xp = ref.watch(progressProvider.select((p) => p.xp));
    return Scaffold(
      appBar: AppBar(title: Text(l10n.progressTitle)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${l10n.xpLabel}: $xp', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(l10n.comingSoon),
          ],
        ),
      ),
    );
  }
}
