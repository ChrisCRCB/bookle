import 'package:drift/drift.dart';

import 'users.dart';

/// Add an [id] column.
mixin IdMixin on Table {
  /// The primary key column.
  IntColumn get id => integer().autoIncrement()();
}

/// Add a [name] column.
mixin NameMixin on Table {
  /// Name this column.
  TextColumn get name => text()();
}

/// Add a [createdAt] column.
mixin CreatedAtMixin on Table {
  /// When this column was created.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// Add a [userId] column.
mixin UserIdMixin on Table {
  /// The ID of the user who created this column.
  IntColumn get userId =>
      integer().references(Users, #id, onDelete: KeyAction.restrict)();
}
