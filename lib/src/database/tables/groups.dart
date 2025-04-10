import 'package:drift/drift.dart';

import '../../../bookle.dart';

/// A group that users can sign up to.
class Groups extends Table
    with IdMixin, NameMixin, CreatedAtMixin, UserIdMixin {
  /// The day of the week this group runs on.
  IntColumn get dayOfWeek =>
      intEnum<DayOfWeek>().withDefault(Constant(DayOfWeek.monday.index))();

  /// Which week this group runs on.
  ///
  /// If [weekNumber] is `null`, then this group will run every week.
  IntColumn get weekNumber => integer().nullable()();

  /// The hour this group starts.
  IntColumn get startHour => integer().withDefault(const Constant(10))();

  /// The minute this group starts.
  IntColumn get startMinute => integer().withDefault(const Constant(0))();

  /// The hour this group ends.
  IntColumn get endHour => integer().withDefault(const Constant(12))();

  /// The minute this group ends.
  IntColumn get endMinute => integer().withDefault(const Constant(0))();
}
