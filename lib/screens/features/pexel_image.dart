import 'dart:convert';

import 'package:ai_asisst/helper/global_vars.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ImageGeneratorPage extends StatefulWidget {
  const ImageGeneratorPage({super.key});

  @override
  _ImageGeneratorPageState createState() => _ImageGeneratorPageState();
}

class _ImageGeneratorPageState extends State<ImageGeneratorPage> {
  final TextEditingController _controller = TextEditingController();
  String query = '';
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchImage() async {

    const String apiUrl = 'https://api.pexels.com/v1/search?query=';
    query = _controller.text.trim();
    if (query.isEmpty) {
      return;
    }

    try {
      var response = await get(Uri.parse(apiUrl + query), headers: {
        'Authorization': pexel,
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          if (data['photos'].isEmpty) {
            imageUrl = ''; // Handle no results found
          } else {
            imageUrl = data['photos'][0]['src']['medium']; // Change 'medium' to 'large' for higher resolution images
          }
        });
      } else {
        print('Failed to load image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Image Generator'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter a keyword',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: fetchImage,
                ),
              ),
            ),
          ),
          imageUrl.isEmpty
              ? const Expanded(
            child: Center(
              child: Text('Enter a keyword to generate an image.'),
            ),
          )
              : Expanded(
            child: Center(
              child: Image.network(imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}