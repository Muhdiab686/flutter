import 'package:flutter/material.dart';
import 'package:pro/UI/screen/auth/verfiy_code.dart';
import 'package:pro/UI/screen/main_screen.dart';

import 'package:pro/UI/widgets/text_form_filed.dart';
import 'package:pro/core/app_assets.dart';
import 'package:pro/core/colors.dart';
import 'package:pro/data/model/api_response.dart';
import 'package:pro/services/Auth/auth_services.dart';

import '../../../data/model/user.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _name = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  _register() async {

    ApiResponse apiResponse =
        await AuthServices.register(_email.text, _password.text, _name.text);
    if (apiResponse.error == null) {
      AuthServices.saveUser(apiResponse.data as User);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => VerfiyCode(),
        ),
        (_) => false,
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Image.asset(
                  AppAssets.logo,
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "do you have account ?",
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.3),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => RegisterScreen()));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: AppColors.buttonColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Register",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Welcome ",
                style: TextStyle(
                  color: Color.fromARGB(101, 158, 158, 158),
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormFieldWidget(
                name: "Name",
                controller: _name,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormFieldWidget(
                name: "E-mail",
                controller: _email,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormFieldWidget(
                name: "Password",
                controller: _password,
                isPassword: true,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                 _register();
                    },
                    color: AppColors.buttonColor,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            const BorderSide(color: AppColors.buttonColor)),
                    minWidth: 120,
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Or",
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.3),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: AppColors.secondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(AppAssets.google),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
