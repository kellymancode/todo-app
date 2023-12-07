import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key,
  this.onPressed,
  required this.text,
  this.style
  });
  final void Function()? onPressed;
  final Widget text;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {
        Navigator.pop(context, true);
      },
      style: style ?? ElevatedButton.styleFrom(
          backgroundColor: Colors.green),
      child: SizedBox(
        width: 60,
        child: text,
      ),);
  }
}