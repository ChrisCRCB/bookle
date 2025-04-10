import 'package:drift/drift.dart';

import 'mixins.dart';

/// A user of the system.
class Users extends Table with IdMixin, NameMixin {
  /// The font size to use.
  IntColumn get fontSize => integer().withDefault(const Constant(16))();

  /// Whether to use bold text or not.
  BoolColumn get boldText => boolean().withDefault(const Constant(false))();
}
