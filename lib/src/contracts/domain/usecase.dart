// ignore_for_file: one_member_abstracts

import 'package:meta/meta.dart';

@immutable
abstract class UseCase<T, P extends Object?> {
  const UseCase();

  T call(P params);
}

@immutable
abstract class AsyncUseCase<T, P extends Object?> {
  const AsyncUseCase();

  Future<T> call(P params);
}
