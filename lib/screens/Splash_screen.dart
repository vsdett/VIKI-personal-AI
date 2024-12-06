
import 'package:ai_asisst/helper/global_vars.dart';
import 'package:ai_asisst/helper/preference.dart';
import 'package:ai_asisst/screens/Homscreen.dart';
import 'package:ai_asisst/screens/onboarding_screen.dart';
import 'package:ai_asisst/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => Pref.showonboard? OnBoarding():HomeScreen()),
      // );
      Get.off(() => Pref.showonboard ? const OnBoarding() : const HomeScreen());

    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(children: [
          const Spacer(),
          Card(
            child: Image.asset(
              "assets/images/ai-assistant.png",
              width: mq.width * 0.4,
            ),
          ),
          const Loading(),
          const Spacer()
        ]),
      ),
    );
  }
}
