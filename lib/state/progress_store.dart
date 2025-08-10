import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProgressState {
  final int xp;
  final Set<String> completedLessonIds;
  const ProgressState({this.xp = 0, this.completedLessonIds = const {}});
  ProgressState copyWith({int? xp, Set<String>? completedLessonIds}) =>
      ProgressState(
        xp: xp ?? this.xp,
        completedLessonIds: completedLessonIds ?? this.completedLessonIds,
      );
}

class ProgressNotifier extends StateNotifier<ProgressState> {
  ProgressNotifier() : super(const ProgressState());

  void addXp(int amount) => state = state.copyWith(xp: state.xp + amount);
  void markCompleted(String lessonId) =>
      state = state.copyWith(
        completedLessonIds: {...state.completedLessonIds, lessonId},
      );
}

final progressProvider =
    StateNotifierProvider<ProgressNotifier, ProgressState>((ref) {
  return ProgressNotifier();
});
