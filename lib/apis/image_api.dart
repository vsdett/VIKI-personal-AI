

import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:ai_asisst/helper/global_vars.dart';
import 'package:ai_asisst/screens/image_show.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

Future<dynamic> converttoimage(
String prompt,
BuildContext context
) async {
  Uint8List image=Uint8List(0);
  const baseUrl = 'https://api.stability.ai';
  final url = Uri.parse(
      '$baseUrl/v1alpha/generation/stable-diffusion-512-v2-1/text-to-image');

  // Make the HTTP POST request to the Stability Platform API
  final response = await post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization':
      //add ypur secreat key here
      'Bearer sk-$stable_api',
      'Accept': 'image/png',
    },
    body: jsonEncode({
      'cfg_scale': 15,
      'clip_guidance_preset': 'FAST_BLUE',
      'height': 512,
      'width': 512,
      'samples': 1,
      'steps': 150,
      'seed': 0,
      'style_preset': "3d-model",
      'text_prompts': [
        {
          'text': prompt,
          'weight': 1,
        }
      ],
    }),
  );
  if(response.statusCode==200){
    try{
      Uint8List imagedata=(response.bodyBytes);
      Get.to(()=>Imageshow(image: imagedata));

      return response.bodyBytes;
    }on Exception{
      log((response.statusCode) as String);
    }}
    else{
      print(response.body);
  }



  }

  

