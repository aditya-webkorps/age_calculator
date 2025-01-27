import 'package:flutter/material.dart';

class DateDetailsRowItem extends StatelessWidget {
  const DateDetailsRowItem({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
