// ignore_for_file: use_build_context_synchronously

import 'package:firebase_authentication/auth_services.dart';
import 'package:firebase_authentication/create_account.dart';
import 'package:firebase_authentication/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Authentication',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              const Text(
                'SIGN IN',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Enter Your Email'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                decoration:
                    const InputDecoration(hintText: 'Enter Your Password'),
              ),
              const SizedBox(
                height: 20,
              ),
              //LOGIN BUTTON
              ElevatedButton(
                onPressed: () async {
                  print(
                      'Email: ${emailController.text}\nPassword:${passwordController.text}');

                  final message = await AuthService().login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (message!.contains('Success')) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Home()));
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                },
                child: const Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              //Create Account Button
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CreateAccount()));
                  },
                  child: const Text('Need an account? Create Now'))
            ],
          ),
        ),
      ),
    );
  }
}
