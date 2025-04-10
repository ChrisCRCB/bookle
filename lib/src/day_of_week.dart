/// The days of the week.
enum DayOfWeek {
  /// Monday.
  monday(1),

  /// Tuesday.
  tuesday(2),

  /// Wednesday.
  wednesday(3),

  /// Thursday.
  thursday(4),

  /// Friday.
  friday(5),

  /// Saturday.
  saturday(6),

  /// Sunday.
  sunday(7);

  /// Create an instance.
  const DayOfWeek(this.dayNumber);

  /// The number of the day.
  final int dayNumber;
}
