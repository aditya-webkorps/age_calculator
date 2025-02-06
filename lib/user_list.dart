import 'package:age_calculator/services/datbase_service.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final DatabaseService _databaseService = DatabaseService();

  List<Map<String, Object?>> userList = [];

  @override
  void initState() {
    super.initState();

    getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          var item = userList[index];

          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item['emailId'] as String),
                Text(item['password'] as String),
                InkWell(
                    onTap: () async {
                      await _databaseService.deleteUser(
                          emailId: item['emailId'] as String);

                      getUserList();
                    },
                    child: const Icon(Icons.delete)),
              ],
            ),
          );
        },
      )),
    );
  }

  Future<void> getUserList() async {
    userList = await _databaseService.getUserList();

    setState(() {});
  }
}
