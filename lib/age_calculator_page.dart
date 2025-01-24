import 'dart:io';

import 'package:age_calculator/date_details_row_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'date_box_widget.dart';
import 'next_birthday_row_item_widget.dart';

class AgeCalculatorPage extends StatefulWidget {
  const AgeCalculatorPage({super.key});

  @override
  State<AgeCalculatorPage> createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {
  TextEditingController _birthdayController = TextEditingController();

  int totalYears = 0;
  int totalMonths = 0;
  int totalDays = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAEAEC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(children: [
              /// DATE
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    color: Color(0xFF3945B5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 30, top: 15, bottom: 8),
                      child: Text(
                        "BirthDate",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 5.0, bottom: 20.0),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          )),
                      child: TextField(
                        controller: _birthdayController,
                        readOnly: true,
                        keyboardType: TextInputType.datetime,
                        onTap: () {
                          showCalendarView();
                        },
                        decoration: const InputDecoration(
                          hintText: "Enter your birth date",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          suffixIcon: Icon(Icons.calendar_month_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// AGE DETAILS
              Card(
                margin: EdgeInsets.zero,
                elevation: 5.0,
                shadowColor: Colors.grey,
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "You are (Your age right now)",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16.0),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DateBoxWidget(
                          boxColor: const Color(0xFF686FE0),
                          label: "$totalYears",
                          calendarLabel: "Years",
                        ),
                        DateBoxWidget(
                          boxColor: const Color(0xFFCED497),
                          label: "$totalMonths",
                          calendarLabel: "Months",
                        ),
                        DateBoxWidget(
                          boxColor: const Color(0xFF72E1B7),
                          label: "$totalDays",
                          calendarLabel: "Days",
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(
                        thickness: 1.0,
                        height: 40.0,
                      ),
                    ),
                    const DateDetailsRowItem(),
                    const DateDetailsRowItem(),
                    const DateDetailsRowItem(),
                    const DateDetailsRowItem(),
                    const DateDetailsRowItem(),
                    const DateDetailsRowItem(),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),

              Card(
                margin: EdgeInsets.zero,
                color: const Color(0xFF72E1B6),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, left: 16.0, right: 16.0, bottom: 12.0),
                  child: Row(
                    children: [
                      // NEXT BIRTHDAY
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Next Birthday',
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              NextBirthdayRowItemWidget(
                                calendarLabel: "Months",
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              NextBirthdayRowItemWidget(
                                calendarLabel: "Days",
                              ),
                            ],
                          )
                        ],
                      ),

                      // YOUR BIRTHDAY
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.end,
                          text: const TextSpan(
                              text: "Your birthday is on ",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                    text: 'Thursday ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16.0,
                                    )),
                                TextSpan(text: 'this year.'),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  /// THIS METHOD WILL SHOW THE DATE PICKER DIALOG
  Future<void> showCalendarView() async {
    if (Platform.isAndroid) {
      showAndroidCalendar();
    } else if (Platform.isIOS) {
      showIosCalendar();
    }
  }

  Future<void> showAndroidCalendar() async {
    DateTime? birthdate = await showDatePicker(
      context: context,
      firstDate: DateTime(
          DateTime.now().year - 100, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime.now(),
    );

    if (birthdate != null) {
      calculateAge(birthdate);
    } else {
      showSnackbar();
    }
  }

  void showIosCalendar() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                maximumDate: DateTime.now(),
                onDateTimeChanged: (DateTime newDate) {
                  _birthdayController.text = newDate.toString();
                  calculateAge(newDate);
                }),
          );
        });
  }

  void showSnackbar() {
    var snackBar = const SnackBar(
      content: Text("Please select valid birthdate"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void calculateAge(DateTime birthdate) {
    _birthdayController.text = birthdate.toString();
    debugPrint(birthdate.toString());

    totalYears = DateTime.now().year - birthdate.year;
    totalMonths = DateTime.now().month - birthdate.month;
    setState(() {});
  }
}
