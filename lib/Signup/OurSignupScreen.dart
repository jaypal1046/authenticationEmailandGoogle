import 'package:flutter/material.dart';
import 'package:login_authentication/Signup/Widget/SignUpForm.dart';

class OurSignUpScreen extends StatefulWidget {
  @override
  _OurSignUpScreenState createState() => _OurSignUpScreenState();
}

class _OurSignUpScreenState extends State<OurSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
                OurSignupForm(),
    );

  }
}
