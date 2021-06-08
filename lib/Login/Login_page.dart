import 'package:flutter/material.dart';
import 'package:login_authentication/Login/Widget/LoginForm.dart';
class OurLoginScreen extends StatefulWidget {
  @override
  _OurLoginScreenState createState() => _OurLoginScreenState();
}

class _OurLoginScreenState extends State<OurLoginScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:

                OurLoginForm(),

    );
  }
}
