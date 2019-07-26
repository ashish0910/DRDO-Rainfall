import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';



class Waterlevel extends StatefulWidget {
  @override
  _WaterlevelState createState() => _WaterlevelState();
}
bool done = false ;
var one = "Failed to Get data" ;
class _WaterlevelState extends State<Waterlevel> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  Future<dynamic> getData() async {
    var response =  await http.get(
      Uri.encodeFull("https://api.thingspeak.com/channels/811430/fields/2.json?api_key=AJ05PFKIXVX3VA0I"),
      headers: {
        "Accept" : "application/json",
      }
    );
    // debugPrint(response.body);
    Map<String, dynamic> map = jsonDecode(response.body) as Map<String, dynamic>;
    one = map["feeds"][1]["field2"];
    debugPrint(one);
    done=true;
    if(one!="Failed to Get data"){ var x = double.parse(one); if(x>=0.00) _showNotificationWithDefaultSound();  }
    setState(() {});
  }

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      var initializationSettingsAndroid = new AndroidInitializationSettings('@mipmap/ic_launcher');
      var initializationSettingsIOS = new IOSInitializationSettings();
      var initializationSettings = new InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
      flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin(); 
      flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);
      getData();
    }
    Future onSelectNotification(String payload) async {
        showDialog(
          context: context,
          builder: (_) {
            return new AlertDialog(
              title: Text("PayLoad"),
              content: Text("Payload : $payload"),
            );
          },
        );
      }

    Future _showNotificationWithDefaultSound() async {
      var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
          'your channel id', 'your channel name', 'your channel description',
          importance: Importance.Max, priority: Priority.High);
      var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
      var platformChannelSpecifics = new NotificationDetails(
          androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
        0,
        'Alert',
        'Value above Limit',
        platformChannelSpecifics,
        payload: 'Default_Sound',
      );
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Waterlevel"),
      ),
      body: Center(
        child: !done ? CircularProgressIndicator() : new Center(
          child: Column(
            children: <Widget>[
              Padding( padding: EdgeInsets.only(top: 50), child: Text("Waterlevel",style: TextStyle(fontSize: 50),),),
              Icon(FontAwesomeIcons.tachometerAlt,color: Colors.blue,size: 200,),
              Padding( padding: EdgeInsets.only(top: 20), child: Text(one,style: TextStyle(fontSize: 50),),),
            ],
          ),
        ),
      ),
    );
  }
}