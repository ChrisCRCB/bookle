import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'database/bookle_database.dart';

part 'providers.g.dart';

/// Provide the database.
@riverpod
BookleDatabase database(final Ref ref) => BookleDatabase();

/// Provide all the users in the database.
@riverpod
Future<List<User>> users(final Ref ref) {
  final database = ref.watch(databaseProvider);
  return database.managers.users.orderBy((final o) => o.name.asc()).get();
}

/// Provide all the people in the database.
@riverpod
Future<List<Person>> people(final Ref ref) {
  final database = ref.watch(databaseProvider);
  return database.managers.people.orderBy((final o) => o.name.asc()).get();
}

/// Provide all the groups in the database.
@riverpod
Future<List<Group>> groups(final Ref ref) {
  final database = ref.watch(databaseProvider);
  return database.managers.groups
      .orderBy((final o) => o.dayOfWeek.asc())
      .orderBy((final o) => o.startHour.asc())
      .orderBy((final o) => o.startMinute.asc())
      .orderBy((final o) => o.name.asc())
      .get();
}
