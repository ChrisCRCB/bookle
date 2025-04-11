import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bookle.dart';
import 'groups_screen.dart';

/// A screen to select a user from the database.
class UsersScreen extends ConsumerWidget {
  /// Create an instance.
  const UsersScreen({super.key});

  /// Build a widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
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
                title: Text(user.name, style: const TextStyle(fontSize: 30.0)),
                onTap:
                    () => context.pushWidgetBuilder(
                      (_) => GroupsScreen(user: user),
                    ),
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
}
