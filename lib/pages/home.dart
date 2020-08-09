import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String background = data['dn'] ? 'day.jpg' : 'night.jpg';
    Color bg = data['dn'] ? Colors.blue : Colors.indigo[600];

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$background'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async{
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'dn': result['dn'],
                            'flag': result['flag'],
                          };
                        });
                      },
                      icon: Icon(Icons.edit_location),
                      label: Text(
                          'Edit Location',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      )
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 400),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 60,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
