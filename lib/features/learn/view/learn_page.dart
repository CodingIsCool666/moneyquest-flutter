import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneyquest/l10n/app_localizations.dart';
import 'package:moneyquest/l10n/loc.dart';
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
        data: (lessons) => ListView.separated(
          itemCount: lessons.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (_, i) {
            final lesson = lessons[i];
            return ListTile(
              leading: const Icon(Icons.menu_book_rounded),
              title: Text(t(l10n, lesson.titleKey)),
              subtitle: Text(t(l10n, lesson.summaryKey)),
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
