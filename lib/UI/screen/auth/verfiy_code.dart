import 'package:flutter/material.dart';
import 'package:pro/UI/screen/groups/group_screen.dart';
import 'package:pro/UI/widgets/text_form_filed.dart';

import '../../../data/model/api_response.dart';
import '../../../data/model/user.dart';
import '../../../services/Auth/auth_services.dart';

class VerfiyCode extends StatefulWidget {
  const VerfiyCode({super.key});

  @override
  State<VerfiyCode> createState() => _VerfiyCodeState();
}

class _VerfiyCodeState extends State<VerfiyCode> {
  final TextEditingController _code = TextEditingController();
  _verfiyCode() async {
    ApiResponse apiResponse = await AuthServices.verfiyCode(_code.text);
    if (apiResponse.error == null) {
      await AuthServices.setUserVerfiy();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(apiResponse.data.toString())));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => GroupScreen(),
        ),
        (_) => false,
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
    }
  }

  _resendCode() async {
    User user = AuthServices.getUser();
    ApiResponse apiResponse = await AuthServices.resendCode(user.email);
    if (apiResponse.error == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(apiResponse.data.toString())));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextFormFieldWidget(
              name: "code",
              controller: _code,
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(onPressed: _resendCode, child: Text("Resend Code")),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(onPressed: _verfiyCode, child: Text("   Next   "))
          ],
        ),
      ),
    );
  }
}
