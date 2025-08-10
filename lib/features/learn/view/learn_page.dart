import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneyquest/l10n/app_localizations.dart';
import '../../learn/data/lesson_providers.dart';
import '../../../models/lesson.dart';
import 'lesson_page.dart';

class LearnPage extends ConsumerWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final asyncLessons = ref.watch(lessonsFutureProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.learnTitle)),
      body: asyncLessons.when(
        data: (lessons) => ListView.builder(
          itemCount: lessons.length,
          itemBuilder: (_, i) {
            final lesson = lessons[i];
            return ListTile(
              leading: const Icon(Icons.menu_book_rounded),
              title: Text(AppLocalizations.of(context)!.getString(lesson.titleKey) ?? lesson.titleKey),
              subtitle: Text(AppLocalizations.of(context)!.getString(lesson.summaryKey) ?? ''),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => LessonPage(lesson: lesson)),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

// helper extension to safely fetch unknown keys (optional)
extension on AppLocalizations {
  String? getString(String key) {
    try {
      final map = <String, String>{
        // This map is only needed if you want dynamic lookup.
        // For now we’ll access via switch in LessonPage to avoid reflection.
      };
      return map[key];
    } catch (_) {
      return null;
    }
  }
}
