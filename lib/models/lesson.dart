class Lesson {
  final String id;
  final String titleKey;
  final String summaryKey;
  final List<CardItem> cards;
  final List<QuizItem> quiz;
  final int xp;

  Lesson({
    required this.id,
    required this.titleKey,
    required this.summaryKey,
    required this.cards,
    required this.quiz,
    required this.xp,
  });

  factory Lesson.fromJson(Map<String, dynamic> j) => Lesson(
    id: j['id'],
    titleKey: j['titleKey'],
    summaryKey: j['summaryKey'],
    cards: (j['cards'] as List).map((e) => CardItem.fromJson(e)).toList(),
    quiz: (j['quiz'] as List).map((e) => QuizItem.fromJson(e)).toList(),
    xp: j['xp'] as int,
  );
}

class CardItem {
  final String textKey;
  final String? image;
  CardItem({required this.textKey, this.image});
  factory CardItem.fromJson(Map<String, dynamic> j) =>
      CardItem(textKey: j['textKey'], image: j['image']);
}

class QuizItem {
  final String id;
  final String promptKey;
  final List<String> choices;
  final int correctIndex;
  QuizItem({
    required this.id,
    required this.promptKey,
    required this.choices,
    required this.correctIndex,
  });
  factory QuizItem.fromJson(Map<String, dynamic> j) => QuizItem(
    id: j['id'],
    promptKey: j['promptKey'],
    choices: (j['choices'] as List).cast<String>(),
    correctIndex: j['correctIndex'] as int,
  );
}
