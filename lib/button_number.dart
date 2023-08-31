import 'package:flutter/material.dart';

class ButtonNumber extends StatelessWidget {
  const ButtonNumber({
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
        fixedSize: const Size(72, 72),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 5,
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
