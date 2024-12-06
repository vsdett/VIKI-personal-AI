import 'package:ai_asisst/helper/global_vars.dart';
import 'package:ai_asisst/model/onboard.dart';
import 'package:ai_asisst/screens/Homscreen.dart';
import 'package:ai_asisst/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();

    final list = [
      onboard(
          title: "Welcom to the Ai Assistant",
          subtitle: "Unlcok the immersive universe of AI",
          lottie: "screen1 loadani"),
      onboard(
          title: "Get Started",
          subtitle: "Click next to get started",
          lottie: "screen2")
      // TODO: implement event handler
    ];

    return Scaffold(
        body: PageView.builder(
      controller: c,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final islast = index == list.length - 1;
        return SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 90,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 100),
                  child: Lottie.asset("assets/lotte/${list[index].lottie}.json",
                      height: mq.height * 0.5)),
              Text(
                list[index].title,
                style: TextStyle(fontSize: mq.width * 0.05),
              ),
              SizedBox(height: mq.height * 0.015),
              Text(
                list[index].subtitle,
                style:
                    TextStyle(color: Colors.black, fontSize: mq.width * 0.04),
              ),
              const Spacer(),
              Wrap(
                spacing: 10,
                children: List.generate(
                    list.length,
                    (i) => Container(
                          width: i == index ? mq.width * 0.04 : mq.width * 0.02,
                          height: mq.height * 0.01,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: i == index ? Colors.blue : Colors.grey,
                          ),
                        )),
              ),
              const Spacer(),
              CustomBtn(onTap: (){
                if (islast) {
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const HomeScreen()));
                  Get.off(() => const HomeScreen());
                } else {
                  c.nextPage(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.ease);
                }
              }, text: islast ? "Finish" : "Next")
              ,
              const Spacer()
            ],
          ),
        );
      },
    ));
  }
}
