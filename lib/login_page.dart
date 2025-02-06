import 'package:age_calculator/shared_preferences_service.dart';
import 'package:age_calculator/sign_up_account_info_page.dart';
import 'package:flutter/material.dart';

import 'age_calculator_page.dart';
import 'widget/base_page_layout_widget.dart';
import 'widget/common_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SharedPreferencesService _preferencesService = SharedPreferencesService();

  String emailId = "";
  String password = "";

  @override
  void initState() {
    super.initState();

    _getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageLayoutWidget(
      title: "Hello",
      subTitle: "Welcome Back",
      cardBody: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Login Account",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(height: 5.0),
              const Text(
                "To get the access of this application please login",
                style: TextStyle(fontSize: 14.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              const Text(
                textAlign: TextAlign.start,
                "Email Address",
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10.0),
              TextField(
                onChanged: (value) {
                  emailId = value;
                },
                decoration: InputDecoration(
                  hintText: "Your Email Address",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      "assets/user.png",
                      height: 15.0,
                      width: 15.0,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                textAlign: TextAlign.start,
                "Password",
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10.0),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter your password",
                  suffixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text(
                    "Save Password",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Text(
                    "Forgot Password?",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              CommonButtonWidget(
                buttonLabel: "Login Account",
                onClick: () {
                  if (validateUserAccount()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AgeCalculatorPage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("EmailId or password is wrong.")));
                  }
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SignUpAccountInfoPage()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Create New Account",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// GET ALL SAVED DATA
  void _getAllData() {
    debugPrint(
        "First Name : ${_preferencesService.getPrefString(prefKey: SharedPreferencesService.kFirstName)}");
    // debugPrint("Last Name : ${prefs.getString("lastName")}");
    // debugPrint("Email : ${prefs.getString("email")}");
    // debugPrint("UserName : ${prefs.getString("userName")}");
    // debugPrint("Password : ${prefs.getString("password")}");
  }

  bool validateUserAccount() {
    if (emailId.isEmpty) {
      return false;
    }
    if (password.isEmpty) {
      return false;
    }
    String? dbEmailId = _preferencesService.getPrefString(
        prefKey: SharedPreferencesService.kEmail);
    String? dbPassword = _preferencesService.getPrefString(
        prefKey: SharedPreferencesService.kPassword);

    debugPrint("User Input email : ${emailId}");
    debugPrint("User Input password : ${password}");
    if (emailId == dbEmailId && password == dbPassword) {
      _preferencesService.savePrefBool(
          prefKey: SharedPreferencesService.kIsUserLoggedIn, value: true);
      return true;
    } else {
      _preferencesService.savePrefBool(
          prefKey: SharedPreferencesService.kIsUserLoggedIn, value: false);
      return false;
    }
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xFFFBBB3B)
      ..style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.35);

    // First control point
    var firstControlPoint = Offset(size.width, size.height * 0.6);
    // First end point
    var firstEndPoint = Offset(size.width, size.height * 0.5);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    // Second control point
    var secondControlPoint = Offset(size.width, size.height * 0.75);
    // Second end point
    var secondEndPoint = Offset(size.width, size.height * 0.4);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
