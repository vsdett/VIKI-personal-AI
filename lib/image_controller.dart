import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
enum Status{none, success,loading, complete}
class ImageController extends GetxController{
  final textprompt=TextEditingController();
  final status=Status.none.obs;
  String url="";
  Future<void> createimage() async{
    if(textprompt.text.trim().isNotEmpty){
      status.value = Status.loading;
      OpenAIImageModel image= await OpenAI.instance.image.create(prompt: textprompt.text,
      n: 1,
      size: OpenAIImageSize.size512,
      responseFormat: OpenAIImageResponseFormat.url);
      url = image.data[0].url.toString();
      status.value = Status.success;



    }
  }

}