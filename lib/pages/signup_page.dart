import 'package:flutter/material.dart';
import 'package:local_database/model/account.dart';
import 'package:local_database/pages/home_page.dart';
import 'package:local_database/service/hive_service.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "SignUpPage";

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF1A1D37),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Create\nAccount",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 2, color: Colors.grey.shade700)),
                  ),
                  child: TextField(
                    controller: _usernameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        icon: const Icon(Icons.person_2_outlined),
                        hintText: "User name",
                        hintStyle: TextStyle(color: Colors.grey.shade700),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 2, color: Colors.grey.shade700)),
                  ),
                  child: TextField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.email_outlined),
                        hintText: "E-mail",
                        hintStyle: TextStyle(color: Colors.grey.shade700),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 2, color: Colors.grey.shade700)),
                  ),
                  child: TextField(
                    controller: _phoneController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.phone_outlined),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(color: Colors.grey.shade700),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 2, color: Colors.grey.shade700)),
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.lock_open),
                        hintText: "Password",
                        labelStyle: const TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.grey.shade700),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    HiveService.storeAccount(
                      Account(
                        _usernameController.text,
                        _emailController.text,
                        _phoneController.text,
                        _passwordController.text,
                      ),
                    );
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        colors: [
                          Color(0xFF1b6aff),
                          Color(0xff206dff),
                          Color(0xff9ec0ff),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
