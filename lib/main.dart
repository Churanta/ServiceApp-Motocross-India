import 'package:flutter/material.dart';
import 'package:service_app/Authentication/login_screen.dart';
import 'package:service_app/Authentication/signup_screen.dart';
import 'package:service_app/Authentication/verifyotp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SignUpScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/otpInput': (context) =>  VerifyOtpPage(),
      },
    );
  }
}
