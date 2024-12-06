import 'package:ai_asisst/helper/global_vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

import '../model/hometype.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.hometype});
  final Hometype hometype;

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return InkWell(
      onTap: hometype.OnTap,
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.blue.withOpacity(0.2),
        child: hometype.left
            ? Row(children: [
                Lottie.asset("assets/lotte/${hometype.lottie}.json",
                    width: mq.width * 0.4, height: mq.height * 0.15),
                const Spacer(flex: 2,),
                Text(hometype.title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                const Spacer(
                  flex: 3,
                )
              ])
            : Row(
                children: [
                  const Spacer(),
                  Text(hometype.title,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  const Spacer(
                    flex: 3,
                  ),
                  Lottie.asset("assets/lotte/${hometype.lottie}.json",
                      width: mq.width * 0.4, height: mq.height * 0.15)
                ],
              ),
      ).animate().fade(duration: NumDurationExtensions(2).seconds),
    );
  }
}
