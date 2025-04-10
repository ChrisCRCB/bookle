import 'package:drift/drift.dart';

import 'mixins.dart';

/// The people table.
@DataClassName('Person')
class People extends Table with IdMixin, NameMixin {
  /// The ID of this person on Compass.
  IntColumn get compassId => integer()();

  /// Whether this person is a user of the service.
  BoolColumn get serviceUser => boolean()();

  /// Whether this person is a volunteer.
  BoolColumn get volunteer => boolean()();
}
