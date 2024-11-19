import 'package:flutter/material.dart';
import 'package:pro/UI/screen/groups/add_group_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Members"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(14),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.3))
                      ]),
                  child: const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("fff"),
                    ),
                    title: Text(
                      "user name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "username@gmail.com",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    trailing: Text("Join at 2024-2-5"),
                  ),
                );
              },
              itemCount: 7,
            )
          ],
        ),
      ),
    );
  }
}
