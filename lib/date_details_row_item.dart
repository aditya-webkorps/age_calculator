import 'package:flutter/material.dart';

class DateDetailsRowItem extends StatelessWidget {
  const DateDetailsRowItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Months Old", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
          Text("233", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }
}