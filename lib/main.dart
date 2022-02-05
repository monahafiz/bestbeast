import 'package:flutter/material.dart';
// import 'package:splashscreen/splashscreen.dart';
import 'package:wigzawy/screens/layout.dart';
import 'package:wigzawy/screens/list_veiw.dart';
import 'package:wigzawy/screens/login.dart';
import 'package:wigzawy/screens/veiw.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() =>  _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: layout(),
routes: <String,WidgetBuilder>{

  '/layout':(BuildContext context)=>new layout(),
  '/list_veiw':(BuildContext context)=>new order(),
  // '/veiw':(BuildContext context)=>new veiw(),


},


    );
  }
}

