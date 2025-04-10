import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bookle.dart';

/// A widget to manage database lifecycle state.
class ManageDatabase extends ConsumerStatefulWidget {
  /// Create an instance.
  const ManageDatabase({required this.child, super.key});

  /// The widget below this widget in the tree.
  final Widget child;

  /// Create state for this widget.
  @override
  ManageDatabaseState createState() => ManageDatabaseState();
}

/// State for [ManageDatabase].
class ManageDatabaseState extends ConsumerState<ManageDatabase> {
  /// The database to work with.
  late BookleDatabase database;

  /// Dispose of the widget.
  @override
  void dispose() {
    super.dispose();
    database.close();
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    database = ref.watch(databaseProvider);
    return widget.child;
  }
}
