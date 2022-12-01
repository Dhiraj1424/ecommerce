import 'dart:async';

import 'package:ecommerce_app/screens/login.dart';
import 'package:ecommerce_app/services/splascScreenServices.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  SplashService splashService=SplashService();
  @override
  void initState() {
    // Timer(const Duration( seconds: 3),
    //  (() => Navigator.push(context,
    //   MaterialPageRoute(builder: ((context) =>const LoginPage() ))))
      
    //   );

    splashService.authentication(context);
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children:const [
          Text('Welcome to Shopping app')
        ],
      )),
    );
  }
}