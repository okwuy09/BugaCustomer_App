import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function()? onTap;
  final Color? backgroundColor;
  final Widget? child;
  const MainButton(
      {Key? key, this.onTap, this.backgroundColor, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(4.0)),
        height: 48.0,
        child: Center(child: child),
      ),
    );
  }
}
