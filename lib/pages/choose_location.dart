import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url:'Asia/Kolkata' ,location:'India' ,flag:'india.png'),
    WorldTime(url:'Africa/Nairobi' ,location:'Kenya' ,flag:'kenya.png'),
    WorldTime(url:'America/Chicago' ,location:'Chicago' ,flag:'chicago.png'),
    WorldTime(url:'Asia/Hong_Kong' ,location:'Hong Kong' ,flag:'hong.png'),
    WorldTime(url:'Asia/Singapore' ,location:'Singapore' ,flag:'singapore.png'),
    WorldTime(url:'Asia/Tokyo' ,location:'Tokyo' ,flag:'tokyo.png'),
    WorldTime(url:'Europe/London' ,location:'London' ,flag:'london.png'),
    WorldTime(url:'Europe/Moscow' ,location:'Moscow' ,flag:'moscow.png'),
    WorldTime(url:'Europe/Paris' ,location:'Paris' ,flag:'paris.png'),
    WorldTime(url:'Indian/Maldives' ,location:'Maldives' ,flag:'maldives.png'),
    WorldTime(url:'Europe/Berlin' ,location:'Berlin' ,flag:'berlin.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'dn': instance.dn,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }),
    );
  }
}
