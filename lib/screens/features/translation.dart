import 'package:flutter/material.dart';
import 'package:googleapis/transcoder/v1.dart';
import 'package:translator/translator.dart';


class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  final OutputController = TextEditingController(text:"Translated text.....");
  final translator=GoogleTranslator();
  String input="";
  String inputlang='en';
  String outputlang='fr';
  Future<void> translatetext() async {
    final translated=await translator.translate(input, from:inputlang, to:outputlang);
    setState(() {
      OutputController.text=translated.text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter text to translate',
                  ),
                  onChanged: (value){
                    setState(() {
                      input=value;
                    });
                  },
                ),
                SizedBox( height:10),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<String>(value: inputlang,
                  onChanged: (newValue){
                    setState(() {
                      inputlang=newValue!;
                    }
                    );
                  },
                  items: <String>[
                    'en','fr','de'].map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(value:value,child: Text(value));
                  }).toList(),
                  ),
                  Icon(Icons.arrow_forward_rounded),


                  DropdownButton<String>(value: outputlang,
                    onChanged: (newValue){
                      setState(() {
                        outputlang=newValue!;
                      }
                      );
                    },
                    items: <String>[
                      'en','fr','de'].map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(value:value,child: Text(value));
                    }).toList(),
                  ),

                ],),
                SizedBox(height: 16,),
                ElevatedButton(style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: Size.fromHeight(55)
                ),onPressed: translatetext, child: Text("Translate",style: TextStyle(fontSize: 10, color: Colors.white))),
                TextField(
                  maxLines: 5,
                  controller: OutputController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter text to translate',
                  ),
                  onChanged: (value){
                    setState(() {
                      input=value;
                    });
                  },
                )

              ],
            ),
          ),
        ),
      ),


    );
  }
}























// import 'package:ai_asisst/apis/translatorapi.dart';
// import 'package:ai_asisst/image_controller.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:googleapis/translate/v3.dart';
//
// import '../../apis/image_api.dart';
//
// import '../../helper/global_vars.dart';
// import '../../widgets/custom_btn.dart';
// import '../../widgets/custom_loading.dart';
// import '../../widgets/language_menu.dart';
// enum Status { none, loading, complete }
//
// class TranslatorFeature extends StatefulWidget {
//   const TranslatorFeature({super.key});
//
//   @override
//   State<TranslatorFeature> createState() => _TranslatorFeatureState();
// }
//
// class _TranslatorFeatureState extends State<TranslatorFeature> {
//   final _c = Translate_Api();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //app bar
//       appBar: AppBar(
//         title: const Text('Multi Language Translator'),
//       ),
//
//       //body
//       body: ListView(
//         physics: const BouncingScrollPhysics(),
//         padding: EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .1),
//         children: [
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             //from language
//             InkWell(
//               onTap: () => Get.bottomSheet(Language_Menu(c: _c, s: _c.from)),
//               borderRadius: const BorderRadius.all(Radius.circular(15)),
//               child: Container(
//                 height: 50,
//                 width: mq.width * .4,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.blue),
//                     borderRadius: const BorderRadius.all(Radius.circular(15))),
//                 child:
//                 Obx(() => Text(_c.from.isEmpty ? 'Auto' : _c.from.value)),
//               ),
//             ),
//
//             //swipe language btn
//             IconButton(
//
//               icon: Obx(
//                     () =>
//                     Icon(
//                       CupertinoIcons.repeat,
//                       color: _c.to.isNotEmpty && _c.from.isNotEmpty
//                           ? Colors.blue
//                           : Colors.grey,
//                     ),
//               ), onPressed: () {},),
//
//             //to language
//             InkWell(
//               onTap: () => Get.bottomSheet(Language_Menu(c: _c, s: _c.to)),
//               borderRadius: const BorderRadius.all(Radius.circular(15)),
//               child: Container(
//                 height: 50,
//                 width: mq.width * .4,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.blue),
//                     borderRadius: const BorderRadius.all(Radius.circular(15))),
//                 child: Obx(() => Text(_c.to.isEmpty ? 'To' : _c.to.value)),
//               ),
//             ),
//           ]),
//
//           //text field
//           Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: mq.width * .04, vertical: mq.height * .035),
//             child: TextFormField(
//               controller: _c.fromtext,
//               minLines: 5,
//               maxLines: null,
//               onTapOutside: (e) => FocusScope.of(context).unfocus(),
//               decoration: const InputDecoration(
//                   hintText: 'Translate anything you want...',
//                   hintStyle: TextStyle(fontSize: 13.5),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)))),
//             ),
//           ),
//
//           //result field
//
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
//                 child: TextFormField(
//                   controller: _c.totext,
//                   maxLines: null,
//                   onTapOutside: (e) => FocusScope.of(context).unfocus(),
//                   decoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10)))),
//                 ),
//               ),
//
//           //for adding some space
//           SizedBox(height: mq.height * .04),
//
//           //translate btn
//           CustomBtn(
//             onTap: _c.translate,
//             // onTap: _c.translate,
//             text: 'Translate',
//           )
//         ],
//       ),
//     );
//   }
//
// //   Widget _translateResult() => switch (_c.status.value) {
// //     Status.none => const SizedBox(),
// //     Status.complete => Padding(
// //       padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
// //       child: TextFormField(
// //         controller: _c.totext,
// //         maxLines: null,
// //         onTapOutside: (e) => FocusScope.of(context).unfocus(),
// //         decoration: const InputDecoration(
// //             border: OutlineInputBorder(
// //                 borderRadius: BorderRadius.all(Radius.circular(10)))),
// //       ),
// //     ),
// //     Status.loading => const Align(child: SizedBox(height: 15,width: 15, child: CircularProgressIndicator(color: Colors.blue,)))
// //     // TODO: Handle this case.
// //   };
// //
// }




