import 'package:age_calculator/age_calculator_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    debugPrint("Inside initState");

    Future.delayed(const Duration(milliseconds: 3 * 1000), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AgeCalculatorPage(),
          ));
    });
  }

  @override
  void dispose() {
    super.dispose();

    debugPrint("Inside dispose");
  }

  @override
  void deactivate() {
    super.deactivate();

    debugPrint("Inside deactivate");
  }

  @override
  void didUpdateWidget(covariant SplashPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    debugPrint("Inside didUpdateWidget");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    debugPrint("Inside didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Inside build");
    return const Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.calendar_month,
              size: 250.0,
              color: Colors.orange,
            ),
          )
        ],
      )),
    );
  }
}
