import 'package:bakaki_matatu_app/login_page.dart';
import 'package:flutter/material.dart';
import 'register_page.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  //intially show the login page
  bool showLoginPage = true;

  void tooglesScreens (){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(showRegisterPage: tooglesScreens);
    } else{
      return RegisterPage( showLoginPage: tooglesScreens);
    }
     
  }
}