import 'dart:convert';
import 'dart:io';


import 'package:ai_asisst/helper/global_vars.dart';
import 'package:http/http.dart';
Future<Response> geminiPost(Uri url, {Map<String, String>? headers, dynamic body}) async {
  try {
    final response = await post(
      url,
      headers: headers,
      body: body,
      
    );
    return response;
  } catch (error) {
    // Handle any errors that occurred during the HTTP request.
    print('Error: $error');
    throw Exception('Failed to make HTTP post request');
  }
}
class API {
  
  

// Import the necessary package for Gemini API
// import 'gemini_api_package';

static Future<void> getAnswerFromGemini(String ques) async {
  // Replace 'GeminiApi.post' with the actual function provided by the Gemini API package
  final res = await geminiPost(
    Uri.parse('https://api.gemini.com/v1/chat/completions'), // Update endpoint URL
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer $api_key" // Update with your API key
    },
    body: jsonEncode({
      "model": "gemini-3.0-turbo", // Update with the desired model
      "max_tokens": 2000,
      "messages": [{"role": "user", "content": ques}]
    })
  );
  print('Response: ${res.body}'); // Handle the response according to your needs
}

  }

