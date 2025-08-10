import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneyquest/l10n/app_localizations.dart';

import '../features/learn/view/learn_page.dart';
import '../features/playground/view/playground_page.dart';
import '../features/progress/view/progress_page.dart';
import '../features/grownups/view/grownups_page.dart';
import 'theme.dart';

class MoneyQuestApp extends ConsumerStatefulWidget {
  const MoneyQuestApp({super.key});
  @override
  ConsumerState<MoneyQuestApp> createState() => _MoneyQuestAppState();
}

class _MoneyQuestAppState extends ConsumerState<MoneyQuestApp> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (ctx) => AppLocalizations.of(ctx)!.appTitle,
      debugShowCheckedModeBanner: false,
      theme: buildTheme(Brightness.light),
      darkTheme: buildTheme(Brightness.dark),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      home: Builder(
        builder: (context) {
          final l10n = AppLocalizations.of(context)!;
          final pages = [
            (widget: const LearnPage(), label: l10n.tabLearn, icon: Icons.menu_book_rounded),
            (widget: const PlaygroundPage(), label: l10n.tabPlay, icon: Icons.sports_esports_rounded),
            (widget: const ProgressPage(), label: l10n.tabProgress, icon: Icons.emoji_events_rounded),
            (widget: const GrownupsPage(), label: l10n.tabGrownups, icon: Icons.settings),
          ];

          return Scaffold(
            body: SafeArea(child: pages[_index].widget),
            bottomNavigationBar: NavigationBar(
              selectedIndex: _index,
              onDestinationSelected: (i) => setState(() => _index = i),
              destinations: [
                for (final p in pages)
                  NavigationDestination(
                    label: p.label,
                    icon: Icon(p.icon),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
