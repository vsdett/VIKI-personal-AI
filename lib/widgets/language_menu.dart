// import 'package:ai_asisst/apis/translatorapi.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:googleapis/slides/v1.dart';
//
// import '../helper/global_vars.dart';
//
// class Language_Menu extends StatelessWidget {
//   final _search=" ".obs;
//   final Translate_Api c;
//   final RxString s;
//    Language_Menu({super.key, required this.c, required this.s});
//
//   @override
//   Widget build(BuildContext context) {
//     final c=Translate_Api();
//     return Container(
//       height: mq.height * .5,
//       padding: EdgeInsets.only(
//           left: mq.width * .04, right: mq.width * .04, top: mq.height * .02),
//       decoration: BoxDecoration(
//           color: Theme.of(context).scaffoldBackgroundColor,
//           borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(15), topRight: Radius.circular(15))),
//       child: Column(
//         children: [
//           TextFormField(
//             // controller: _c.resultC,
//             onChanged: (s) => _search.value = s.toLowerCase(),
//
//             onTapOutside: (e) => FocusScope.of(context).unfocus(),
//             decoration: const InputDecoration(
//                 prefixIcon: Icon(Icons.translate_rounded, color: Colors.blue),
//                 hintText: 'Search Language...',
//
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10)))),
//           ),
//
//           //
//           Expanded(
//             child: Obx(() {
//               // Ensure that c.lang is of type List<String> or can be cast to List<String>
//               final List<String> list = c.lang.toList();  // Convert to List<String> if needed
//
//               // If search is not empty, filter the list based on the search value
//               final filteredList = _search.isEmpty
//                   ? list
//                   : list.where((e) => e.toLowerCase().contains(_search.value)).toList();
//
//               return ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: filteredList.length,
//                 padding: EdgeInsets.only(top: mq.height * .02, left: 6),
//                 itemBuilder: (ctx, i) {
//                   return InkWell(
//                     onTap: () {
//                       s.value = filteredList[i];  // Use filteredList[i]
//                       Get.back();
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.only(bottom: mq.height * .02),
//                       child: Text(filteredList[i]),
//                     ),
//                   );
//                 },
//               );
//             }),
//           )
//
//
//
//
//         ],
//       ),
//     );
//   }
// }
