// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ContainerDecorator extends StatelessWidget {
  final Widget widget;
  const ContainerDecorator({required this.widget});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: widget,
    );
  }
}
