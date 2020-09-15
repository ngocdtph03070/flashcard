import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';
import 'package:template/ui/card_page/card_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CardPage(),
    );
  }
}

// List<String> images = [
//   'https://gank.io/images/5ba77f3415b44f6c843af5e149443f94',
//   'https://gank.io/images/02eb8ca3297f4931ab64b7ebd7b5b89c',
//   'https://gank.io/images/31f92f7845f34f05bc10779a468c3c13',
//   'https://gank.io/images/b0f73f9527694f44b523ff059d8a8841',
//   'https://gank.io/images/1af9d69bc60242d7aa2e53125a4586ad',
// ];

// List<Widget> cards = List.generate(
//   images.length,
//   (int index) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16.0),
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, 17),
//             blurRadius: 23.0,
//             spreadRadius: -13.0,
//             color: Colors.black54,
//           )
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16.0),
//         child: Image.network(
//           images[index],
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   },
// );

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   TCardController _controller = TCardController();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TCard(
//               cards: cards,
//               size: Size(360, 480),
//               controller: _controller,
//               onForward: (index, info) {
//                 print(index);
//               },
//               onBack: (index) {
//                 print(index);
//               },
//               onEnd: () {
//                 print('end');
//               },
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 OutlineButton(
//                   onPressed: () {
//                     print(_controller);
//                     _controller.back();
//                   },
//                   child: Text('Back'),
//                 ),
//                 OutlineButton(
//                   onPressed: () {
//                     _controller.reset();
//                   },
//                   child: Text('Reset'),
//                 ),
//                 OutlineButton(
//                   onPressed: () {
//                     _controller.forward();
//                   },
//                   child: Text('Forward'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
