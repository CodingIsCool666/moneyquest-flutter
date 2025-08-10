import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../../../models/lesson.dart';

class LessonRepository {
  Future<List<Lesson>> loadLessons() async {
    final raw = await rootBundle.loadString('assets/data/lessons.json');
    final list = jsonDecode(raw) as List;
    return list.map((e) => Lesson.fromJson(e)).toList();
  }
}
