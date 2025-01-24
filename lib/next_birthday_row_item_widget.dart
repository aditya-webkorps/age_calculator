import 'package:flutter/material.dart';

class NextBirthdayRowItemWidget extends StatelessWidget {
  const NextBirthdayRowItemWidget({
    super.key,
    required this.calendarLabel
  });

  final String calendarLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                  Radius.circular(8.0))),
          child: const Center(
            child: Text(
              "12",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900),
            ),
          ),
          width: 60.0,
          height: 60.0,
        ),

        Text(calendarLabel, style: const TextStyle(fontSize: 14.0, color: Colors.black54, fontWeight: FontWeight.bold),),
      ],
    );
  }
}