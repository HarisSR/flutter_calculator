import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(
      title: 'Belajar Flutter View',
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String title;
  MyApp({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new WebView(
        initialUrl: "https://my.cic.ac.id/portal/mahasiswa/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}