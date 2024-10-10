import 'package:api_project/class_country.dart';
import 'package:flutter/material.dart';
class Countryscreen extends StatefulWidget {
  const Countryscreen({super.key});

  @override
  State<Countryscreen> createState() => _CountryscreenState();
}
List allCountries = [
  Allcountries(link: 'Africa/Cairo', countryName: 'Egypt - Cairo', flag: 'egypt.png'),
  Allcountries(link: 'Africa/Tunis', countryName: 'Tunisia - Tunis', flag: 'tunisia.png'),
  Allcountries(link: 'Africa/Casablanca',countryName: 'Morocco - Morocco', flag: 'morocco.png'),
  Allcountries(link: 'Australia/Sydney', countryName: 'Australia - Sydney', flag: 'australia.png'),
  Allcountries(link: 'America/Toronto', countryName: 'Canada - Toronto',flag: 'canada.png'),
  Allcountries(link: 'Asia/Riyadh', countryName: '	Saudi Arabia - Riyadh', flag: 'sa.png'),
];
class _CountryscreenState extends State<Countryscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      appBar: AppBar(backgroundColor: Colors.black26,title:  Text('Choose country',
        style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SizedBox(
        child: ListView.builder(
                  itemCount: allCountries.length,
                    itemBuilder: (BuildContext context,int index){
                    return    Padding(
                      padding:  EdgeInsets.all(6.0),
                      child: Card(
        child: ListTile(
          onTap: ()async{
            Allcountries clickedCountry = allCountries[index];
           await clickedCountry.getData();
            Navigator.pop(context,{
              'time':clickedCountry.timeNow,
              'location':clickedCountry.timeZone,
              'isDaytime':clickedCountry.isDaytime
            });
          },
          title:  Text(
            allCountries[index].countryName,
            style: TextStyle(fontSize: 25),),
          leading:   CircleAvatar(backgroundImage: AssetImage(
              'assets/assetss/imgs/${allCountries[index].flag}'),radius: 17,),
        ),
                      ),
                    );
                    }
        ),
      )



    );
  }
}