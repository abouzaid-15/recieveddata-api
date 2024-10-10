import 'package:flutter/material.dart';

import 'countryscreen.dart';
import 'homescreen.dart';
import 'loadingscreen.dart';

void main(){
  runApp(const MyApp());
}
 class MyApp extends StatefulWidget {
   const MyApp({super.key});
   @override
   State<MyApp> createState() => _MyAppState(); }
 class _MyAppState extends State<MyApp> {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       initialRoute:  '/',
       routes: {
         // When navigating to the "/" route, build the FirstScreen widget.
         '/': (context) =>  const Loadingscreen(),
         // When navigating to the "/second" route, build the SecondScreen widget.
         '/Homescreen': (context) =>  const Homescreen(),
         '/Countryscreen': (context) =>  const Countryscreen(),
       },

     );}}


