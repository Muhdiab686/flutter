import 'package:flutter/material.dart';
import 'package:pro/UI/screen/auth/login.dart';
import 'package:pro/UI/screen/groups/add_group_screen.dart';
import 'package:pro/data/model/group.dart';
import 'package:pro/services/Auth/auth_services.dart';
import 'package:pro/services/group_services.dart';

import '../../../data/model/api_response.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  List groups=[];
  _getGroup() async {

    ApiResponse apiResponse =
    await GroupServices.getGroup();
    if (apiResponse.error == null) {

    setState(() {
      groups=apiResponse.data as List;
    });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
    }
  }
@override
  void initState() {
  _getGroup();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Group"),
        centerTitle: true,
        elevation: 0,
        leading:   IconButton(
            onPressed: () async{
              AuthServices.removeUserVerfiy();
              AuthServices.removetoken();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  LoginScreen(),
                  ));
            },
            icon: const Icon(Icons.logout)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddGroupScreen(),
                    ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          _getGroup();
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 600,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    Group g= groups[index];
                    return Container(
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(0.3))
                          ]),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text("${g.membersCount}"),
                        ),
                        title:  Text(
                          g.groupName,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle:  Text(
                          " Create by ${g.owner}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        trailing: MaterialButton(
                          onPressed: () {},
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          child: Text("Join"),
                        ),
                      ),
                    );
                  },
                  itemCount: groups.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
