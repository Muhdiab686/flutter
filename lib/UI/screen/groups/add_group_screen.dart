import 'package:flutter/material.dart';
import 'package:pro/UI/widgets/text_form_filed.dart';
import 'package:pro/data/model/user_model.dart';

import '../../../data/model/api_response.dart';
import '../../../services/group_services.dart';

class AddGroupScreen extends StatefulWidget {
  const AddGroupScreen({super.key});

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  final TextEditingController _groupName = TextEditingController();
  List<int> m=[];
  _addGroup() async {

    ApiResponse apiResponse =
    await GroupServices.createGroup(_groupName.text, m);

    if (apiResponse.error == null) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
    }
  }
  List user=[];
  _getUser() async {

    ApiResponse apiResponse =
    await GroupServices.getUser();
    if (apiResponse.error == null) {

      setState(() {
        user=apiResponse.data as List;
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
    }
  }
  @override
  void initState() {
    _getUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormFieldWidget(name: "Group name", controller: _groupName),
              Container(
                height: 350,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    UserModel g= user[index];
                    return GestureDetector(
                      onLongPress: ! m.contains(g.id)?(){
                       setState(() {
                         m.add(g.id);
                       });
                      }:null,
                      onTap:  m.contains(g.id)?(){
                        setState(() {
                          m.remove(g.id);
                        });
                      }:null,
                      child: Container(
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
                            child: Text("${g.id}"),
                            backgroundColor: m.contains(g.id)?Colors.blue:null,
                          ),
                          title:  Text(
                            g.name,
                            style: TextStyle(
                                color: m.contains(g.id)?Colors.blue: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle:  Text(
                            " ${g.email}",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),

                        ),
                      ),
                    );
                  },
                  itemCount: user.length,
                ),
              ),
              ElevatedButton(onPressed: _addGroup, child: const Text(" Add "))
            ],
          ),
        ),
      ),
    );
  }
}
