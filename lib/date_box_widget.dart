import 'package:flutter/material.dart';

class DateBoxWidget extends StatelessWidget {
  const DateBoxWidget(
      {super.key,
      required this.boxColor,
      required this.label,
      required this.calendarLabel});

  final Color boxColor;
  final String label;
  final String calendarLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: boxColor,
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          calendarLabel,
          style: const TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.grey),
        )
      ],
    );
  }
}
