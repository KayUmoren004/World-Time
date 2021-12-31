// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    if (route == null) return SizedBox.shrink();
    final routeArgs = route.settings.arguments;

    data = data.isNotEmpty ? data : routeArgs as Map;

    //set background
    String bgImage = 'night.jpg';

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: Column(
                children: <Widget>[
                  TextButton.icon(
                      onPressed: () async {
                        print('Err here');
                        dynamic result =
                            await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDayTime': result['isDayTime'],
                            'flag': result['flag'],
                          };
                        });
                      },
                      icon: Icon(Icons.edit_location,
                          color: bgImage == 'day.jpg'
                              ? Colors.blue[100]
                              : Colors.red[200]),
                      label: Text('Edit Location',
                          style: TextStyle(
                              color: bgImage == 'day.jpg'
                                  ? Colors.blue[100]
                                  : Colors.red[200],
                              fontWeight: FontWeight.bold))),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                            fontSize: 28,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w300,
                            color: bgImage == 'day.jpg'
                                ? Colors.white
                                : Colors.white),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: TextStyle(
                        fontSize: 66,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w100,
                        color:
                            bgImage == 'day.jpg' ? Colors.white : Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
