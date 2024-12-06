import 'package:flutter/material.dart';

import '../helper/global_vars.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomBtn({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
        onPressed: onTap
        ,

        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            elevation: 0,
            textStyle: const TextStyle(fontSize: 16),
            minimumSize: Size(mq.width * 0.6, 50),
            backgroundColor: Colors.purpleAccent),
        child: Text(text),
      ),
    );
  }
}
