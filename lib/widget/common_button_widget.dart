import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget(
      {super.key, required this.buttonLabel, required this.onClick});

  final String buttonLabel;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.0,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: WidgetStateColor.resolveWith(
                (state) => const Color(0xFFFBBC3B))),
        onPressed: () {
          onClick();
        },
        child: Text(
          buttonLabel,
          style: const TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
