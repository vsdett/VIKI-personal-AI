import 'dart:convert';

import 'package:ai_asisst/helper/global_vars.dart';
import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:http/http.dart' as http;
class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  ChatUser user = ChatUser(id: "1", firstName: "Arvind");
  ChatUser bot = ChatUser(id: "2", firstName: "Chat gpt");
  List<ChatMessage> messsages = [];
  final url ='https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=$api_key';
  final header={
    'Content-Type': 'application/json'
  };

  getdata(ChatMessage m) async {
    messsages.insert(0, m);
    setState(() {});
    var data={"contents":[{"parts":[{"text":m.text}]}]};
    await http.post(Uri.parse(url),headers: header,body:jsonEncode(data)).then((value){
      if(value.statusCode==200){
        var result=jsonDecode(value.body);

      ChatMessage m1= ChatMessage(user: bot, createdAt: DateTime.now(),text:result["candidates"][0]["content"]["parts"][0]["text"] );
      messsages.insert(0, m1);
      setState(() {

      });
      }
      else{
        print("Error occurred");
      }
    }).catchError((e){});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI ChatBot'),
      ),
      body: DashChat(
        messages: messsages,
        currentUser: user,
        onSend: (ChatMessage m) {
          getdata(m);
        },
      ),
    );
  }
}
