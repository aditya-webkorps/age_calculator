import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'shared_preferences_service.dart';
import 'widget/base_page_layout_widget.dart';
import 'widget/common_button_widget.dart';

class SignUpSecureInfoPage extends StatefulWidget {
  const SignUpSecureInfoPage({super.key});

  @override
  State<SignUpSecureInfoPage> createState() => _SignUpSecureInfoPageState();
}

class _SignUpSecureInfoPageState extends State<SignUpSecureInfoPage> {
  SharedPreferencesService prefService = SharedPreferencesService();

  String password = "";

  @override
  void initState() {
    super.initState();
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
                  "Secure Account",
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
                "Birthday",
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10.0),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Select birth date",
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.calendar_month_outlined),
                  ),
                  border: OutlineInputBorder(
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
                obscureText: true,
                onChanged: (value) {
                  debugPrint(value);
                  password = value;
                },
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
                height: 20.0,
              ),
              const Text(
                textAlign: TextAlign.start,
                "Phone number",
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
              ),
              Row(
                children: [
                  CountryCodePicker(
                    mode: CountryCodePickerMode.dialog,
                    onChanged: (country) {
                      debugPrint('Country code selected: ${country.code}');
                    },
                    initialSelection: 'US',
                    showFlag: true,
                    showDropDownButton: true,
                  ),
                  Expanded(
                    child: TextField(
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: const InputDecoration(
                        hintText: "Enter your mobile number",
                        suffixIcon: Icon(Icons.phone_android),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black26, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              CommonButtonWidget(
                buttonLabel: "Create Account",
                onClick: () {
                  if (validateUserInput()) {
                    saveData();
                    _getAllData();
                  }
                },
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
      ),
    );
  }

  void showCustomCountryPicker() {
    // showCountryPicker(
    //   context: context,
    //   countryListTheme: CountryListThemeData(
    //     flagSize: 25,
    //     backgroundColor: Colors.white,
    //     textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
    //     bottomSheetHeight: 500, // Optional. Country list modal height
    //     //Optional. Sets the border radius for the bottomsheet.
    //     borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(20.0),
    //       topRight: Radius.circular(20.0),
    //     ),
    //     //Optional. Styles the search field.
    //     inputDecoration: InputDecoration(
    //       labelText: 'Search',
    //       hintText: 'Start typing to search',
    //       prefixIcon: const Icon(Icons.search),
    //       border: OutlineInputBorder(
    //         borderSide: BorderSide(
    //           color: const Color(0xFF8C98A8).withOpacity(0.2),
    //         ),
    //       ),
    //     ),
    //   ),
    //   onSelect: (Country country) => print('Select country: ${country.displayName}'),
    // );
  }

  void saveData() {
    // SAVE PASSWORD
    prefService.savePrefString(
        key: SharedPreferencesService.kPassword, value: password);
  }

  bool validateUserInput() {
    if (password.isEmpty) {
      return false;
    }
    return true;
  }

  void _getAllData() {
    debugPrint(
        "First Name : ${prefService.getPrefString(prefKey: SharedPreferencesService.kFirstName)}");
    debugPrint(
        "Last Name : ${prefService.getPrefString(prefKey: SharedPreferencesService.kLastName)}");
    debugPrint(
        "Email : ${prefService.getPrefString(prefKey: SharedPreferencesService.kEmail)}");
    debugPrint(
        "UserName : ${prefService.getPrefString(prefKey: SharedPreferencesService.kUserName)}");
    debugPrint(
        "Password : ${prefService.getPrefString(prefKey: SharedPreferencesService.kPassword)}");
  }
}
