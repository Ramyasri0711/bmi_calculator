import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'Email',
              ),
              TextField(
                controller: nameController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Password',
              ),
              TextField(
                controller: passWordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
