import 'package:ai_asisst/helper/global_vars.dart';
import 'package:ai_asisst/screens/Homscreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class secondOnboard extends StatelessWidget {
  const secondOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 90,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 80),
                child: Lottie.asset("assets/lotte/screen2.json",
                    height: mq.height * 0.4, width: mq.width * 0.5)),
           
            Text(
              "AI ASISST",
              style: TextStyle(fontSize: mq.width * 0.05),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "This is an AI-Assisted System",
              style: TextStyle(color: Colors.black, fontSize: mq.width * 0.04),
            ),
            const Spacer(),
            Wrap(
              spacing: 10,
              children: List.generate(
                  2,
                  (i) => Container(
                        width: mq.width * 0.02,
                        height: mq.height * 0.01,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                        ),
                      )),
            ),
            const Spacer(),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
            },
            
            style: ElevatedButton.styleFrom(shape: const StadiumBorder(),
            elevation: 0,
            textStyle: const TextStyle(fontSize: 16),
            minimumSize: Size(mq.width*0.6, 50),
            backgroundColor: Colors.purpleAccent), child: const Text("Next"),
            )
          ],
        ),
      ),
    );
  }
}
