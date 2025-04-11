import 'package:backstreets_widgets/extensions.dart';
import 'package:flutter/material.dart';

import '../../bookle.dart';

/// A tile that represents a group within a grid column.
/// It shows the group's name, start time, and end time,
/// and is fully interactive via tap and keyboard.
class GroupTile extends StatelessWidget {
  /// Creates a [GroupTile] for the given group and tap callback.
  const GroupTile({required this.group, super.key});

  /// The group object containing display information.
  final Group group;

  @override
  Widget build(final BuildContext context) {
    final startTime = TimeOfDay(
      hour: group.startHour,
      minute: group.startMinute,
    );
    final endTime = TimeOfDay(hour: group.endHour, minute: group.endMinute);
    return Material(
      color: Colors.blue.shade50,
      child: InkWell(
        onTap:
            () => context.pushWidgetBuilder((_) {
              throw UnimplementedError();
            }),
        borderRadius: BorderRadius.circular(4),
        focusColor: Colors.blue.shade100,
        hoverColor: Colors.blue.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(group.name, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(
                '${startTime.format(context)} - ${endTime.format(context)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
