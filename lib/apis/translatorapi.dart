import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../helper/dialogs.dart';
import '../helper/global_vars.dart';
import '../image_controller.dart';
class Translate_Api extends GetxController{
  final fromtext=TextEditingController();
  final totext=TextEditingController();
  final to="".obs,from="".obs;
  final List<String> lang = const [
    "Afar",
  "Abkhazian",
  "Avestan",
  "Afrikaans",
  "Akan",
  "Amharic",
  "Aragonese",
  "Arabic",
  "Assamese",
  "Avaric",
  "Aymara",
  "Azerbaijani",
  "Bashkir",
  "Belarusian",
  "Bulgarian",
  "Bihari languages",
  "Bislama",
  "Bambara",
  "Bengali",
  "Tibetan",
  "Breton",
  "Bosnian",
  "Catalan",
  "Chechen",
  "Chamorro",
  "Corsican",
  "Cree",
  "Czech",
  "Church Slavic",
  "Chuvash",
  "Welsh",
  "Danish",
  "German",
  "Maldivian",
  "Dzongkha",
  "Ewe",
  "Greek",
  "English",
  "Esperanto",
  "Spanish",
  "Estonian",
  "Basque",
  "Persian",
  "Fulah",
  "Finnish",
  "Fijian",
  "Faroese",
  "French",
  "Western Frisian",
  "Irish",
  "Gaelic",
  "Galician",
  "Guarani",
  "Gujarati",
  "Manx",
  "Hausa",
  "Hebrew",
  "Hindi",
  "Hiri Motu",
  "Croatian",
  "Haitian",
  "Hungarian",
  "Armenian",
  "Herero",
  "Interlingua",
  "Indonesian",
  "Interlingue",
  "Igbo",
  "Sichuan Yi",
  "Inupiaq",
  "Ido",
  "Icelandic",
  "Italian",
  "Inuktitut",
  "Japanese",
  "Javanese",
  "Georgian",
  "Kongo",
  "Kikuyu",
  "Kuanyama",
  "Kazakh",
  "Kalaallisut",
  "Central Khmer",
  "Kannada",
  "Korean",
  "Kanuri",
  "Kashmiri",
  "Kurdish",
  "Komi",
  "Cornish",
  "Kirghiz",
  "Latin",
  "Luxembourgish",
  "Ganda",
  "Limburgan",
  "Lingala",
  "Lao",
  "Lithuanian",
  "Luba-Katanga",
  "Latvian",
  "Malagasy",
  "Marshallese",
  "Maori",
  "Macedonian",
  "Malayalam",
  "Mongolian",
  "Marathi",
  "Malay",
  "Maltese",
  "Burmese",
  "Nauru",
  "Norwegian",
  "North Ndebele",
  "Nepali",
  "Ndonga",
  "Dutch",
  "South Ndebele",
  "Navajo",
  "Chichewa",
  "Occitan",
  "Ojibwa",
  "Oromo",
  "Oriya",
  "Ossetic",
  "Panjabi",
  "Pali",
  "Polish",
  "Pushto",
  "Portuguese",
  "Quechua",
  "Romansh",
  "Rundi",
  "Romanian",
  "Russian",
  "Kinyarwanda",
  "Sanskrit",
  "Sardinian",
  "Sindhi",
  "Northern Sami",
  "Sango",
  "Sinhala",
  "Slovak",
  "Slovenian",
  "Samoan",
  "Shona",
  "Somali",
  "Albanian",
  "Serbian",
  "Swati",
  "Sotho, Southern",
  "Sundanese",
  "Swedish",
  "Swahili",
  "Tamil",
  "Telugu",
  "Tajik",
  "Thai",
  "Tigrinya",
  "Turkmen",
  "Tagalog",
  "Tswana",
  "Tonga",
  "Turkish",
  "Tsonga",
  "Tatar",
  "Twi",
  "Tahitian",
  "Uighur",
  "Ukrainian",
  "Urdu",
  "Uzbek",
  "Venda",
  "Vietnamese",
  "Volapük",
  "Walloon",
  "Wolof",
  "Xhosa",
  "Yiddish",
  "Yoruba",
  "Zhuang",
  "Chinese",
  "Zulu"
];
  final url ='https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=$api_key';
  final header={
    'Content-Type': 'application/json'
  };

  final status = Status.none.obs;
  Future<void> translate() async {
    if (fromtext.text.trim().isNotEmpty && to.isNotEmpty) {
      status.value = Status.loading;

      String prompt = '';

      if (from.isNotEmpty) {
        prompt =
        'Can you translate given text from ${from.value} to ${to.value}:\n${fromtext.text}';
      } else {
        prompt = 'Can you translate given text to ${to.value}:\n${fromtext.text}';
      }
      var data={"contents":[{"parts":[{"text":prompt}]}]};

      log(prompt);
      await post(Uri.parse(url), headers: header, body: jsonEncode(data)).then((
          value) {
        if (value.statusCode == 200) {
          var result = jsonDecode(value.body);
          print(result);
          totext.text = utf8.decode(result.codeUnits);

          status.value = Status.complete;
          //
          //
          //
        }
        else {
          status.value = Status.none;
          if (to.isEmpty) Dialogs.info('Select To Language!');
          if (fromtext.text.isEmpty) Dialogs.info('Type Something to Translate!') ;       }
      }).catchError((e) {});
    }


    }
  }


