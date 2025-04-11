import 'package:flutter/material.dart';

/// A simple empty box widget to represent a blank tile in a grid.
class EmptyGridTile extends StatelessWidget {
  /// Creates a constant [EmptyGridTile].
  const EmptyGridTile({super.key});

  @override
  Widget build(final BuildContext context) => Container(
    width: 50, // You can adjust the size to fit your grid
    height: 50,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      color: Colors.transparent,
    ),
  );
}
