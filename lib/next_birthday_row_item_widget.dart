import 'package:flutter/material.dart';

class NextBirthdayRowItemWidget extends StatelessWidget {
  const NextBirthdayRowItemWidget({
    super.key,
    required this.calendarLabel,
    required this.value,
  });

  final String calendarLabel;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5.0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          width: 60.0,
          height: 60.0,
          child: Center(
            child: Text(
              value,
              style:
                  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w900),
            ),
          ),
        ),
        Text(
          calendarLabel,
          style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black54,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
