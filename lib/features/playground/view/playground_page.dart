import 'package:flutter/material.dart';
import 'package:moneyquest/l10n/app_localizations.dart';

class PlaygroundPage extends StatelessWidget {
  const PlaygroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.playTitle)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.sports_esports_rounded, size: 64),
            const SizedBox(height: 12),
            Text(l10n.comingSoon),
          ],
        ),
      ),
    );
  }
}
