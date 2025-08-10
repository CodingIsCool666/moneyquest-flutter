import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneyquest/l10n/app_localizations.dart';
import 'package:moneyquest/l10n/loc.dart';
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
    final isCards = step < lesson.cards.length;

    return Scaffold(
      appBar: AppBar(title: Text(t(l10n, lesson.titleKey))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isCards
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t(l10n, lesson.cards[step].textKey),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FilledButton(
                      onPressed: () => setState(() => step++),
                      child: const Text('Next'),
                    ),
                  ),
                ],
              )
            : QuizPage(
                items: lesson.quiz,
                // New signature: (correctCount, hadWrong)
                onFinished: (correct, hadWrong) {
                  if (!hadWrong) {
                    // Award XP only if no wrong answers at all
                    ref.read(progressProvider.notifier).addXp(lesson.xp);
                    ref.read(progressProvider.notifier).markCompleted(lesson.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Perfect! +${lesson.xp} XP'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No XP this time, get all answers correct to earn XP.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }

                  Navigator.of(context).pop(); // back to Learn list
                },
              ),
      ),
    );
  }
}
