import "package:flutter/material.dart";

class CustomErrorWidget extends StatelessWidget {
  CustomErrorWidget({
    required this.error
  }) : super(key: UniqueKey());

  final String error;

  @override
  Widget build(BuildContext context) {
    return Text(
      error,
      style: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
