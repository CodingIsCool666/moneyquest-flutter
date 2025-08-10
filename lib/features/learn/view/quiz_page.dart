import 'package:flutter/material.dart';
import 'package:moneyquest/l10n/app_localizations.dart';
import '../../../models/lesson.dart';

class QuizPage extends StatefulWidget {
  final List<QuizItem> items;
  final void Function(int correctCount) onFinished;
  const QuizPage({super.key, required this.items, required this.onFinished});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  int correct = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final item = widget.items[index];

    String t(String key) => switch (key) {
      'nw_q1' => l10n.nw_q1,
      'nw_q1_c1' => l10n.nw_q1_c1,
      'nw_q1_c2' => l10n.nw_q1_c2,
      'nw_q1_c3' => l10n.nw_q1_c3,
      'nw_q2' => l10n.nw_q2,
      'nw_q2_c1' => l10n.nw_q2_c1,
      'nw_q2_c2' => l10n.nw_q2_c2,
      'nw_q2_c3' => l10n.nw_q2_c3,
      'sb_q1' => l10n.sb_q1,
      'sb_q1_c1' => l10n.sb_q1_c1,
      'sb_q1_c2' => l10n.sb_q1_c2,
      _ => key
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t(item.promptKey), style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        for (var i = 0; i < item.choices.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: OutlinedButton(
              onPressed: () {
                if (i == item.correctIndex) correct++;
                if (index + 1 < widget.items.length) {
                  setState(() => index++);
                } else {
                  widget.onFinished(correct);
                }
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(t(item.choices[i])),
              ),
            ),
          ),
      ],
    );
  }
}
