// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseHash() => r'8522b1166d7b0b26aab0de9439f27340ec9e5739';

/// Provide the database.
///
/// Copied from [database].
@ProviderFor(database)
final databaseProvider = AutoDisposeProvider<BookleDatabase>.internal(
  database,
  name: r'databaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$databaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DatabaseRef = AutoDisposeProviderRef<BookleDatabase>;
String _$usersHash() => r'8d0bcba9614d4135d8cb81bc3834d24fbcfed9f7';

/// Provide all the users in the database.
///
/// Copied from [users].
@ProviderFor(users)
final usersProvider = AutoDisposeFutureProvider<List<User>>.internal(
  users,
  name: r'usersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$usersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UsersRef = AutoDisposeFutureProviderRef<List<User>>;
String _$peopleHash() => r'91a2ebd23785637d3aee63263cb1c56961265961';

/// Provide all the people in the database.
///
/// Copied from [people].
@ProviderFor(people)
final peopleProvider = AutoDisposeFutureProvider<List<Person>>.internal(
  people,
  name: r'peopleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$peopleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PeopleRef = AutoDisposeFutureProviderRef<List<Person>>;
String _$groupsHash() => r'51ae88e1fe1fa343101c5643c27259d3f0d8d1af';

/// Provide all the groups in the database.
///
/// Copied from [groups].
@ProviderFor(groups)
final groupsProvider = AutoDisposeFutureProvider<List<Group>>.internal(
  groups,
  name: r'groupsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$groupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GroupsRef = AutoDisposeFutureProviderRef<List<Group>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
