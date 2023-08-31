import 'package:flutter/material.dart';

class ButtonOperation extends StatelessWidget {
  const ButtonOperation({
    super.key,
    required this.value,
    required this.onpress,
  });

  final String value;
  final void Function(String value) onpress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 5,
        fixedSize: const Size(72, 72),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      onPressed: () {
        onpress(value);
      },
      child: Text(
        value,
        style: const TextStyle(fontSize: 32),
      ),
    );
  }
}
