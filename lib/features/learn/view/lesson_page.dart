import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneyquest/l10n/app_localizations.dart';
import '../../../models/lesson.dart';
import '../../../state/progress_store.dart';
import 'quiz_page.dart';

class LessonPage extends ConsumerStatefulWidget {
  final Lesson lesson;
  const LessonPage({super.key, required this.lesson});

  @override
  ConsumerState<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends ConsumerState<LessonPage> {
  int step = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final lesson = widget.lesson;
    final title = _t(l10n, lesson.titleKey);

    final isCards = step < lesson.cards.length;
    final isQuiz = step >= lesson.cards.length;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isCards
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_t(l10n, lesson.cards[step].textKey),
                      style: Theme.of(context).textTheme.titleMedium),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FilledButton(
                      onPressed: () => setState(() => step++),
                      child: const Text('Next'),
                    ),
                  )
                ],
              )
            : QuizPage(
                items: lesson.quiz,
                onFinished: (correct) {
                  ref.read(progressProvider.notifier).addXp(lesson.xp);
                  ref.read(progressProvider.notifier).markCompleted(lesson.id);
                  Navigator.of(context).pop(); // back to list for now
                },
              ),
      ),
    );
  }

  String _t(AppLocalizations l10n, String key) {
    switch (key) {
      case 'needsWantsTitle': return l10n.needsWantsTitle;
      case 'needsWantsSummary': return l10n.needsWantsSummary;
      case 'nw_card1': return l10n.nw_card1;
      case 'nw_card2': return l10n.nw_card2;
      case 'nw_q1': return l10n.nw_q1;
      case 'nw_q1_c1': return l10n.nw_q1_c1;
      case 'nw_q1_c2': return l10n.nw_q1_c2;
      case 'nw_q1_c3': return l10n.nw_q1_c3;
      case 'nw_q2': return l10n.nw_q2;
      case 'nw_q2_c1': return l10n.nw_q2_c1;
      case 'nw_q2_c2': return l10n.nw_q2_c2;
      case 'nw_q2_c3': return l10n.nw_q2_c3;
      case 'savingBasicsTitle': return l10n.savingBasicsTitle;
      case 'savingBasicsSummary': return l10n.savingBasicsSummary;
      case 'sb_card1': return l10n.sb_card1;
      case 'sb_q1': return l10n.sb_q1;
      case 'sb_q1_c1': return l10n.sb_q1_c1;
      case 'sb_q1_c2': return l10n.sb_q1_c2;
      default: return key;
    }
  }
}
