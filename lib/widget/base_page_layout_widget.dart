import 'package:flutter/material.dart';

import '../login_page.dart';

class BasePageLayoutWidget extends StatelessWidget {
  const BasePageLayoutWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.cardBody,
  });

  final String title;
  final String subTitle;
  final Widget cardBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBBB3B),
        leading: const SizedBox.shrink(),
        elevation: 0.0,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          CustomPaint(
            painter: CurvedPainter(),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.w900),
                ),
                Text(
                  subTitle,
                  style: const TextStyle(
                      fontSize: 25.0, fontWeight: FontWeight.w700),
                ),

                cardBody,
              ],
            ),
          )
        ],
      )),
    );
  }
}
