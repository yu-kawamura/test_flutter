// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:test_flutter/models/metadata_model.dart';

// class FetchOgpForm extends StatefulWidget {
//   const FetchOgpForm({super.key});

//   @override
//   State<FetchOgpForm> createState() => _FetchOgpForm();
// }

// class _FetchOgpForm extends State<FetchOgpForm> {
//   String url = "";
//   final TextEditingController _controller = TextEditingController();
  
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       // height: 200,
//       child: Column(
//         children: <Widget>[
//           TextField(
//             obscureText: false,
//             style: const TextStyle(fontSize: 20),
//             controller: _controller,
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: 'https://www.example.com',
//             ),
//             onChanged: (text) {
//               setState(() {
//                 url = text;
//               });
//             },
//           ),
//           ElevatedButton(
//             onPressed: (url == "") ? null : () async {
//               // ignore: avoid_print
//               print("Current url is $url");
//               final success = await context.read<MetadataModel>().fetchOgpFrom(url);
//               if (!context.mounted) return; 
//               if (!success) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('URLを入力してください'),
//                       backgroundColor: Colors.red,
//                     )
//                   );
//               }
//               context.read<MetadataModel>().fetchOgpFrom(url);
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(6),
//               ),
//               elevation: 16,
//               padding: const EdgeInsets.symmetric(
//                 vertical: 15.0,
//                 horizontal: 100,
//               ),
//             ),
//             child: const Text('検索',style: TextStyle(fontSize: 20, color: Colors.black),),
//           )
//         ],
//       )
//     );
//   }
// }
