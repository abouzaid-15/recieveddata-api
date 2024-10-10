
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';



class Allcountries{
 String flag ;
 String countryName;
 String link  ;
 Allcountries({required this.flag,required this.countryName,required this.link});

   String timeNow='';
  late String timeZone;
   bool isDaytime=false;

  getData() async {

    Response receivedatafrom = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$link"));
    Map receivedData = jsonDecode(receivedatafrom.body);

    DateTime datetime =DateTime.parse (receivedData["utc_datetime"]);
    // var realtime = DateTime.parse(datetime);

    int offset = int.parse(receivedData['utc_offset'].substring(0,3));
    // var intofsset = int.parse(offset);
    DateTime realtime = datetime.add(Duration(hours: offset));

    if(realtime.hour > 5 && realtime.hour < 18){
      isDaytime = true;
    }else{
      isDaytime = false;
    }
     timeNow = DateFormat.Hm().format(realtime);
     timeZone = receivedData['timezone'];



  }
}