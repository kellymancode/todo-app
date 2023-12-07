
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(backgroundColor: Colors.grey,),
        const Text(
          'My Notes',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        IconButton(
            onPressed: onPressed,
            padding: const EdgeInsets.all(0),
            icon: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey.shade800.withOpacity(.8),
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.sort,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}