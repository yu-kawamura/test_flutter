// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:metadata_fetch/metadata_fetch.dart';
// import 'package:http/http.dart' as http;

// // 初期表示
// Map<String, dynamic> mockJson = {
//   "title": "Flutter - Beautiful native apps in record time3",
//   "image": 'https://nogikoi.jp/images/assets/anniversary/7th/top_kv.jpg',
//   "description":
//       "Flutter is Google's UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.  Flutter works with existing code, is used by developers and organizations around the world, and is free and open source"
// };
// class MetadataModel extends ChangeNotifier {
//   Metadata ogp = Metadata.fromJson(mockJson);


//   Future<bool> fetchOgpFrom(String url) async {
//     try {
//       final response = await http.get(Uri.parse(url));
//       final document = MetadataFetch.responseToDocument(response);
//       ogp = MetadataParser.openGraph(document);

//       // notifyListeners();
//       return true;
//     } catch (e) {
//       // ignore: avoid_print
//       print('error');
//       return false;
//     }
//   }
  
//   // void fetchOgpFrom(String url) async {
//   //   final response = await http.get(Uri.parse(url));
//   //   final document = MetadataFetch.responseToDocument(response);
//   //   ogp = MetadataParser.openGraph(document);
//   //   notifyListeners();
//   // }
// }