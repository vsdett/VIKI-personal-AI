import 'package:ai_asisst/screens/features/Image_generate.dart';
import 'package:ai_asisst/screens/features/chat_screen.dart';
import 'package:ai_asisst/screens/features/translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Hometype { aichat, aiimage , aiTranslator }

extension MyHometype on Hometype {
  String get title => switch (this) {
        // TODO: Handle this case.
        Hometype.aichat => "AI Chat",
        // TODO: Handle this case.
        Hometype.aiimage => "Text To Image",
        // TODO: Handle this case.
        Hometype.aiTranslator => 'Language Translator',

      };
  String get lottie => switch (this) {
        // TODO: Handle this case.
        Hometype.aichat => "ai wave",
        // TODO: Handle this case.
        Hometype.aiimage => "aiimage",
        // TODO: Handle this case.
  Hometype.aiTranslator=> "aitranslate"

      };
  bool get left => switch (this) {
        // TODO: Handle this case.
        Hometype.aichat => true,
        // TODO: Handle this case.
        Hometype.aiimage => false,
        // TODO: Handle this case.
  Hometype.aiTranslator=> true,

      };
  VoidCallback get OnTap => switch (this) {
        // TODO: Handle this case.
        Hometype.aichat => () => Get.to(() => const ChatBot()),
        // TODO: Handle this case.
        Hometype.aiimage => () => Get.to(() => const Image_generate()),
        // TODO: Handle this case.
  Hometype.aiTranslator =>()=>Get.to(() => const TranslatorFeature())

  };
}
