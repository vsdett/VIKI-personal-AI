
import 'package:ai_asisst/helper/preference.dart';
import 'package:flutter/services.dart';

import '../helper/global_vars.dart';

import 'package:flutter/material.dart';

import '../model/hometype.dart';
import '../widgets/home_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    Pref.showonboard = false;
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text(app_name,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.blue)),
        

      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * 0.001, vertical: mq.height * 0.014),
        children: Hometype.values.map((e) => HomeCard(hometype: e)).toList(),
      ),
    );
  }
}
