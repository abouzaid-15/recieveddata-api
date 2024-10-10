import 'dart:convert';
import 'package:api_project/class_country.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';


class Loadingscreen extends StatefulWidget {
  const Loadingscreen({super.key});
  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}
class _LoadingscreenState extends State<Loadingscreen> {


  getData() async {
    Allcountries oneCountry = Allcountries(flag: 'morocco.png',countryName: 'Morocco',link: "Africa/Casablanca");
    await oneCountry.getData();

      Navigator.pushReplacementNamed(context,  '/Homescreen',arguments: {
        'time':oneCountry.timeNow,
        'location':oneCountry.timeZone,
        'isDaytime':oneCountry.isDaytime
      });
  }
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueAccent,title: const Text('Loadingscreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   onPressed: (){
            //     Navigator.pop(context,{'Country': 'Meknes',
            //         'Currenttime':'13:00'});
            //   },
            //   style: ButtonStyle(
            //     backgroundColor: WidgetStateProperty.all(Colors.deepOrangeAccent),
            //     padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 53,vertical: 15)),
            //     shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
            //   ),
            //   child: Text("return data", style: TextStyle(fontSize: 19),),
            // ),
            SpinKitCircle(color: Colors.black87,  size: 100.0,duration:Duration(seconds: 5) ,),
          ],
        ),
      ),
    );
  }
}