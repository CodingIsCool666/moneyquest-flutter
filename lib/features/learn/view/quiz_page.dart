import 'package:flutter/material.dart';
import 'package:moneyquest/l10n/app_localizations.dart';
import 'package:moneyquest/l10n/loc.dart';
import '../../../models/lesson.dart';

class QuizPage extends StatefulWidget {
  final List<QuizItem> items;
  // Changed: now returns (correctCount, hadWrong)
  final void Function(int correctCount, bool hadWrong) onFinished;
  const QuizPage({super.key, required this.items, required this.onFinished});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  int correctCount = 0;
  bool hadWrong = false;

  int? selectedIndex;   // which choice user tapped this question
  bool answered = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final item = widget.items[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t(l10n, item.promptKey),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),

        // Choices
        for (var i = 0; i < item.choices.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _AnswerButton(
              text: t(l10n, item.choices[i]),
              enabled: !answered,
              isCorrect: answered && i == item.correctIndex,
              isWrongSelected: answered && selectedIndex == i && i != item.correctIndex,
              onTap: () {
                if (answered) return;
                final isCorrect = i == item.correctIndex;
                setState(() {
                  selectedIndex = i;
                  answered = true;
                  if (isCorrect) {
                    correctCount++;
                  } else {
                    hadWrong = true;
                  }
                });
              },
            ),
          ),

        const SizedBox(height: 12),

        // Feedback
        if (answered)
          Row(
            children: [
              Icon(
                (selectedIndex == item.correctIndex)
                    ? Icons.check_circle_rounded
                    : Icons.cancel_rounded,
              ),
              const SizedBox(width: 8),
              Text(
                (selectedIndex == item.correctIndex) ? 'Correct!' : 'Try again',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),

        const Spacer(),

        // Next / Finish
        Align(
          alignment: Alignment.bottomRight,
          child: FilledButton(
            onPressed: !answered
                ? null
                : () {
                    if (index + 1 < widget.items.length) {
                      setState(() {
                        index++;
                        selectedIndex = null;
                        answered = false;
                      });
                    } else {
                      widget.onFinished(correctCount, hadWrong);
                    }
                  },
            child: Text(index + 1 < widget.items.length ? 'Next' : 'Finish'),
          ),
        ),
      ],
    );
  }
}

class _AnswerButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final bool isCorrect;
  final bool isWrongSelected;
  final VoidCallback onTap;

  const _AnswerButton({
    required this.text,
    required this.enabled,
    required this.isCorrect,
    required this.isWrongSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color? bg;
    if (isCorrect) bg = Theme.of(context).colorScheme.primary.withOpacity(0.12);
    if (isWrongSelected) bg = Theme.of(context).colorScheme.error.withOpacity(0.12);

    return OutlinedButton(
      onPressed: enabled ? onTap : null,
      style: OutlinedButton.styleFrom(
        backgroundColor: bg,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text),
      ),
    );
  }
}
