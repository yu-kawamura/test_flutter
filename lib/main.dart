import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


import 'home.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const ProviderScope(child: Home()),
      builder: EasyLoading.init(),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../widgets/fetch_opt_form.dart';
// import '../widgets/data_detail.dart';
// import '../models/metadata_model.dart';


// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Search',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: 'Georgia',
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.blue,
//         ),
//         textTheme: Theme.of(context).textTheme.apply(
//           bodyColor: Colors.black,
//         ),
//       ),
//       home: const BookmarkView(),
//     );
//   }
// }

// class BookmarkView extends StatefulWidget {
//   const BookmarkView({super.key});

//   @override
//   State<BookmarkView> createState() => _BookmarkView();
// }

// class _BookmarkView extends State<BookmarkView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: ChangeNotifierProvider(
//             create: (context) => MetadataModel(),
//             child: const Column(
//               children: <Widget>[DataDetail(), FetchOgpForm()],
//             ),
//           ),
//       )
//     );
//   }
// }
