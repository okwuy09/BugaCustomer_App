import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Popover extends StatelessWidget {
  final Widget? child;
  MainAxisSize mainAxisSize;
  Popover({
    Key? key,
    required this.mainAxisSize,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(top: 8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(2.0)),
      ),
      child: Column(
        mainAxisSize: mainAxisSize,
        children: [
          _buildHandle(context),
          if (child != null)
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: child!,
            )
        ],
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      widthFactor: 0.15,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: theme.dividerColor,
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}
