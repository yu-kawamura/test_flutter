// import 'package:test_flutter/models/metadata_model.dart';
// import 'package:flutter/material.dart';
// import 'package:metadata_fetch/metadata_fetch.dart';
// import 'package:provider/provider.dart';

// class DataDetail extends StatefulWidget {
//   const DataDetail({super.key});

//   @override
//   State<DataDetail> createState() => _DataDetail();
// }

// class _DataDetail extends State<DataDetail> {
//   @override
//   Widget build(BuildContext context) {
//     final Metadata ogp = context.select((MetadataModel model) => model.ogp);
//     String? title =  ogp.title;
//     String? image =  ogp.image;
//     String? description =  ogp.description;

//     if (ogp.title != null) {
//       title = 'no title';
//     }
//     if (ogp.description != null) {
//       description = 'no description';
//     }

//     return Expanded(
//       child: ListView(
//         children: <Widget>[
//           Text(
//             title!,
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           Image.network(
//             image!,
//             errorBuilder: (c, o, s) {
//               return const Icon(
//                 Icons.error,
//                 color: Colors.red,
//                 );
//               },
//           ) ,
//           Text(description!,
//           style: const TextStyle(fontSize: 16),
//           )
//         ],
//       )
//     );
//   }
// }
