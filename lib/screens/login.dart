import 'dart:convert';

import 'package:ecommerce_app/provider/login.dart';
import 'package:ecommerce_app/screens/navbar.dart';
import 'package:ecommerce_app/screens/productPage.dart';
import 'package:ecommerce_app/services/apiservice.dart';
import 'package:ecommerce_app/utils/function.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 
 //bool isloading = false;

 

  @override
  Widget build(BuildContext context) {
     TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
    final auth=Provider.of<AuthProvider>(context,listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Ecommerce',
              style: TextStyle(
                  color: pinkColor, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: _emailController,
            //  keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: 'Please enter your Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Please enter your Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 40,
            ),
            SummitButton(
              ontap: () {
                if(_emailController.text.isEmpty){
FunctionName.toastMessage('email is null');

                }
                else if(_passwordController.text.isEmpty){
FunctionName.toastMessage('password is null');
                }
                 else if(_passwordController.text.length<2){
FunctionName.toastMessage('password is short');
                }
                else {
                  auth.login(_emailController.text.toString(), _passwordController.text.toString(), context);
                }
              },
              text: 'Log-in',
            )
          ],
        ),
      ),
    );
  }
}

class SummitButton extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  const SummitButton({
    Key? key,
    required this.ontap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: 
        
        ontap,
      
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            text,
            style:
                const TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
