import 'package:flutter/material.dart';
import 'package:moneyquest/l10n/app_localizations.dart';

class GrownupsPage extends StatelessWidget {
  const GrownupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.grownupsTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(l10n.aboutApp),
            subtitle: const Text('Offline-first • Privacy-friendly'),
          ),
          const Divider(),
          const SwitchListTile(
            value: false,
            onChanged: null,
            title: Text('High Contrast Mode'),
          ),
          const SwitchListTile(
            value: false,
            onChanged: null,
            title: Text('Large Text'),
          ),
        ],
      ),
    );
  }
}
