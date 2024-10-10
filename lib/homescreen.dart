import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  @override
  State<Homescreen> createState() => _HomescreenState();
}
class _HomescreenState extends State<Homescreen> {

    late String bgimgs;
  Map recievedData = {};

  @override
  Widget build(BuildContext context) {
    recievedData=recievedData.isEmpty?ModalRoute.of(context)!.settings.arguments as Map:recievedData;

    bgimgs = recievedData['isDaytime'] ?  'matin.jpg':'soir.jpg';


    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/photos/$bgimgs'),
            fit:BoxFit.cover  ),),
        child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: ()async{
                 dynamic result = await Navigator.pushNamed(context, '/Countryscreen');
                 setState(() {
                   recievedData={
                     'time':result['time'],'location':result['location'],'isDaytime':result['isDaytime']
                   };
                 });
                },
                icon: const Icon(Icons.edit_location, color: Color.fromARGB(255, 255, 129, 129), size: 24.0, ),
                label: const Text("Edit location", style: TextStyle(fontSize: 19,color: Colors.white),),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(const Color.fromARGB(146, 90, 104, 223)),
                  padding: WidgetStateProperty.all(const EdgeInsets.all(22)),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                ),),
              const SizedBox(height: 300,),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
               padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 37),
                color: Colors.black26,
                child: Column(
                  children: [
                    Text(recievedData['time'],style: const TextStyle(fontSize: 37,fontWeight: FontWeight.bold,color: Colors.white),),
                    const SizedBox(height: 15,),
                    Text(recievedData['location'],style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)
                  ],
                ),

              ),

          ],
          ),
        ),
      ),
    );
  }
}
