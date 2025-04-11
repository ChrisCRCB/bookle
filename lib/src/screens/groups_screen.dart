import 'package:backstreets_widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../bookle.dart';

/// A screen that shows the groups calendar.
class GroupsScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const GroupsScreen({required this.user, super.key});

  /// The user to show.
  final User user;

  /// Create state for this widget.
  @override
  GroupsScreenState createState() => GroupsScreenState();
}

/// State for [GroupsScreen].
class GroupsScreenState extends ConsumerState<GroupsScreen> {
  /// Generates a list of 30-minute interval time strings from 00:00 to 23:30.
  List<TimeOfDay> _generateTimeSlots() {
    final times = <TimeOfDay>[];
    for (var hour = 0; hour < 24; hour++) {
      for (var minute = 0; minute < 60; minute += 30) {
        times.add(TimeOfDay(hour: hour, minute: minute));
      }
    }
    return times;
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final value = ref.watch(groupsProvider);
    return SimpleScaffold(
      title: 'Groups - ${widget.user.name}',
      body: value.simpleWhen(
        data: (final groups) {
          final timeSlots = _generateTimeSlots();
          return Column(
            children: [
              // Header Row with empty top-left and day headings
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 60), // Empty space for time column
                    ...DayOfWeek.values.map(
                      (final day) => Flexible(
                        child: Center(
                          child: Text(
                            day.name.sentenceCase,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: ListView.builder(
                  itemCount: timeSlots.length,
                  itemBuilder: (final context, final index) {
                    final time = timeSlots[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 50,
                          child: Center(child: Text(time.format(context))),
                        ),
                        ...DayOfWeek.values.map((final day) {
                          final current = groups.where(
                            (final group) =>
                                group.dayOfWeek == day &&
                                group.startHour == time.hour &&
                                group.startMinute >= time.minute &&
                                group.startMinute <= (time.minute + 30),
                          );
                          if (current.isEmpty) {
                            return const EmptyGridTile();
                          }
                          return Flexible(
                            child: Column(
                              children: [
                                ...current.map(
                                  (final group) => GroupTile(group: group),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    );
                  },
                  shrinkWrap: true,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
