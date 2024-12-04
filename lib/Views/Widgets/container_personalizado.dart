import 'package:flutter/material.dart';

class ContainerPersonalizado extends StatelessWidget {
  ContainerPersonalizado({super.key, required this.child, required this.color});
  Widget? child;
  final color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
