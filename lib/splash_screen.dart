import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:student_management_app/app_color.dart';

import 'register.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Timer(const Duration(seconds: 4), () {
      Get.offAll(() => const Register());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SlideTransition(
            position: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png", height: 200, width: 300),
                const SizedBox(height: 20),
                const Text(
                  "Student Management App",
                  style: TextStyle(fontWeight: FontWeight.w800 , color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
