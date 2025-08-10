import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/lesson.dart';
import 'lesson_repository.dart';

final lessonRepositoryProvider = Provider((ref) => LessonRepository());

final lessonsFutureProvider = FutureProvider<List<Lesson>>((ref) async {
  return ref.read(lessonRepositoryProvider).loadLessons();
});
