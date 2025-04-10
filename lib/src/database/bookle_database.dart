import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../bookle.dart';

part 'bookle_database.g.dart';

/// The database class.
@DriftDatabase(tables: [People, Users, Groups])
class BookleDatabase extends _$BookleDatabase {
  /// Create an instance.
  BookleDatabase()
    : super(
        LazyDatabase(() async {
          final documentsDirectory = await getApplicationDocumentsDirectory();
          final file = File(
            path.join(documentsDirectory.path, 'bookle.sqlite3.db'),
          );
          // ignore: avoid_print
          print('Database file: ${file.path}.');
          return NativeDatabase(file);
        }),
      );

  /// The schema version.
  @override
  int get schemaVersion => 1;

  /// Migrate the database.
  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (final details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
    onCreate: (final m) async {
      await m.createAll();
    },
    onUpgrade: (final m, final from, final to) async {},
  );
}
