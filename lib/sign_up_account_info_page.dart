import 'package:age_calculator/services/datbase_service.dart';
import 'package:age_calculator/shared_preferences_service.dart';
import 'package:age_calculator/user_list.dart';
import 'package:age_calculator/widget/base_page_layout_widget.dart';
import 'package:flutter/material.dart';

import 'widget/common_button_widget.dart';

class SignUpAccountInfoPage extends StatefulWidget {
  const SignUpAccountInfoPage({super.key});

  @override
  State<SignUpAccountInfoPage> createState() => _SignUpAccountInfoPageState();
}

class _SignUpAccountInfoPageState extends State<SignUpAccountInfoPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  SharedPreferencesService service = SharedPreferencesService();

  final DatabaseService _databaseService = DatabaseService();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _saveUserInfo() async {
    // service.savePrefString(
    //     key: SharedPreferencesService.kFirstName,
    //     value: _firstNameController.text);

    int id = DateTime.now().millisecondsSinceEpoch;
    debugPrint("$id");
    await _databaseService.insertUser(
        id: id,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        emailId: _emailController.text,
        password: 'test123');

    List<dynamic> userList = await _databaseService.getUserList();
    debugPrint("${userList}");
    debugPrint("");

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const UserList()));
  }

  @override
  Widget build(BuildContext context) {
    return BasePageLayoutWidget(
        title: "Join Us",
        subTitle: "Create Free Account",
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
                    "Personal Info",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w900),
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
                  "Your Name",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          hintText: "First Name",
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black26, width: 0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          hintText: "Last Name",
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black26, width: 0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const Text(
                  textAlign: TextAlign.start,
                  "Email Address",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Your Email Address",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.email_rounded),
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
                  "Username",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: "User Name",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.email_rounded),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26, width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                CommonButtonWidget(
                  buttonLabel: "Save & Continue",
                  onClick: _saveUserInfo,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Back To Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
