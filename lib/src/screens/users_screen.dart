import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bookle.dart';

/// A screen to select a user from the database.
class UsersScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const UsersScreen({required this.builder, super.key});

  /// The function to call to build a widget once a user has been selected.
  final Widget Function(int userId) builder;

  /// Create state for this widget.
  @override
  UsersScreenState createState() => UsersScreenState();
}

/// State for [UsersScreen].
class UsersScreenState extends ConsumerState<UsersScreen> {
  /// The ID of the user to build with.
  int? _userId;

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final id = _userId;
    if (id == null) {
      final database = ref.watch(databaseProvider);
      final value = ref.watch(usersProvider);
      return SimpleScaffold(
        title: 'Select User',
        body: value.simpleWhen(
          data: (final users) {
            if (users.isEmpty) {
              return const CenterText(
                text: 'No users have been created yet.',
                autofocus: true,
              );
            }
            return ListView.builder(
              itemBuilder: (final context, final index) {
                final user = users[index];
                return ListTile(
                  autofocus: index == 0,
                  title: Text(
                    user.name,
                    style: const TextStyle(fontSize: 30.0),
                  ),
                  onTap: () => onSelected(user),
                );
              },
              itemCount: users.length,
              shrinkWrap: true,
            );
          },
        ),
        floatingActionButton: NewButton(
          onPressed:
              () => context.pushWidgetBuilder(
                (final innerContext) => GetText(
                  onDone: (final value) async {
                    innerContext.pop();
                    await database.managers.users.create(
                      (final o) => o(name: value),
                    );
                    ref.invalidate(usersProvider);
                  },
                  labelText: 'Name',
                  title: 'Create User',
                ),
              ),
        ),
      );
    }
    return widget.builder(id);
  }

  /// The function to call when [user] is selected.
  void onSelected(final User user) => setState(() => _userId = user.id);
}
