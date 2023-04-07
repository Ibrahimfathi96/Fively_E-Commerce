import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.text, required this.onTap})
      : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28)
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        primary: Theme.of(context).primaryColor
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
      ),
    );
  }
}
