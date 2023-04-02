import 'package:flutter/material.dart';
import 'package:service_app/Authentication/login_screen.dart';
import 'package:service_app/Authentication/signup_screen.dart';
import 'package:service_app/Authentication/verifyotp.dart';
import 'package:service_app/ProfilePageContents/ContactUs.dart';
import 'package:service_app/ProfilePageContents/ReferAndEarn.dart';
import 'package:service_app/ProfilePageContents/Wishlist.dart';
import 'package:service_app/Screens/BookingsScreen.dart';
import 'package:service_app/Screens/CartScreen.dart';
import 'package:service_app/Screens/EditUserDetails.dart';
import 'package:service_app/Screens/HomeScreen.dart';

import 'MainPage.dart';
import 'ProfilePageContents/Rewards.dart';

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
        '/otpInput': (context) => VerifyOtpPage(),
        '/home': (context) => MyHomePage(),
        '/edituser': (context) => const EditDetails(),
        '/my_rewards': (context) => MyRewardsPage(),
        '/refer_and_earn': (context) => ReferAndEarnPage(),
        '/wishlist': (context) => WishlistPage(),
        '/contact_us': (context) => ContactUsPage(),
        '/homepage': (context) => Home(),
        '/bookings': (context) => Bookings(),
        '/cart': (context) => Cart(),
      },
    );
  }
}
