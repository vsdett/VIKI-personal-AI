import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../apis/image_api.dart';
import '../../helper/dialogs.dart';
import '../../helper/global_vars.dart';

// ignore: camel_case_types
class Image_generate extends StatefulWidget {
  const Image_generate({super.key});

  @override
  State<Image_generate> createState() => _Image_generateState();

}

class _Image_generateState extends State<Image_generate> {
  final prompt=TextEditingController();
  bool loading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Image Generator"),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: mq.height*0.02,
        bottom: mq.height *0.1,
        left: mq.width*0.04,
        right: mq.width *0.04),
        children: [
          TextFormField(
            controller: prompt,

            textAlign: TextAlign.center,
            minLines: 2,
            maxLines: null,
            onTapOutside: (e) => FocusScope.of(context).unfocus(),

            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              fillColor: Colors.white,
              filled: true,
              isDense: true,
              hintText: "Turn your imagination into reality",
              hintStyle: TextStyle(fontSize: 16),


            ),
          ),
          Container(
            alignment: Alignment.center,
            height: mq.height*0.5,

            child: Lottie.asset("assets/lotte/aiimage.json",
            height: mq.height*0.3),
          ),
      Align(
        child: ElevatedButton(
          onPressed: (){
            if(prompt.text.trim().isNotEmpty){

            converttoimage(prompt.text, context);
            loading=true;
            setState(() {

            });}
            else{
              Dialogs.info("Please enter valid prompt");
            }
          }
          ,
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              elevation: 0,
              textStyle: const TextStyle(fontSize: 16),
              minimumSize: Size(mq.width * 0.6, 50),
              backgroundColor: Colors.purpleAccent),
          child: loading?
          const SizedBox(height: 15,width: 15, child: CircularProgressIndicator(color: Colors.blue,)):
              const Text(
                "Generate Image",
                style: TextStyle(fontSize: 16),
              ),
        ),


      )],
      ),
    );

  }
}
