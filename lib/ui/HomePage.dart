import 'package:drdo/ui/sensors/distance.dart';
import 'package:drdo/ui/sensors/humidity.dart';
import 'package:drdo/ui/sensors/temprature.dart';
import 'package:drdo/ui/sensors/volume.dart';
import 'package:drdo/ui/sensors/waterflow.dart';
import 'package:drdo/ui/sensors/waterlevel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Exit App?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text("Yes"),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            ));
  }
  
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Choose Sensor"),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/back.jpg"),fit: BoxFit.cover),
              ),
            ),
            Center(
              child: ListView(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute( builder: (BuildContext context) =>  Distance() ));
                      },
                      padding: EdgeInsets.all(20.0),
                      color: Colors.blue,
                      child: Text("Distance",style: TextStyle(color: Colors.white,fontSize: 25.0 ),),
                      shape: Border.all( style:BorderStyle.solid),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute( builder: (BuildContext context) =>  Waterlevel() ));
                      },
                      padding: EdgeInsets.all(20.0),
                      color: Colors.blue,
                      child: Text("Water Level",style: TextStyle(color: Colors.white,fontSize: 25.0 ),),
                      shape: Border.all( style:BorderStyle.solid),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute( builder: (BuildContext context) =>  Temperature() ));
                      },
                      padding: EdgeInsets.all(20.0),
                      color: Colors.blue,
                      child: Text("Temprature",style: TextStyle(color: Colors.white,fontSize: 25.0 ),),
                      shape: Border.all( style:BorderStyle.solid),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute( builder: (BuildContext context) =>  Humidity() ));
                      },
                      padding: EdgeInsets.all(20.0),
                      color: Colors.blue,
                      child: Text("Humidity",style: TextStyle(color: Colors.white,fontSize: 25.0 ),),
                      shape: Border.all( style:BorderStyle.solid),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute( builder: (BuildContext context) =>  Waterflow() ));
                      },
                      padding: EdgeInsets.all(20.0),
                      color: Colors.blue,
                      child: Text("Water Flow",style: TextStyle(color: Colors.white,fontSize: 25.0 ),),
                      shape: Border.all( style:BorderStyle.solid),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute( builder: (BuildContext context) =>  Volume() ));
                      },
                      padding: EdgeInsets.all(20.0),
                      color: Colors.blue,
                      child: Text("Volume",style: TextStyle(color: Colors.white,fontSize: 25.0 ),),
                      shape: Border.all( style:BorderStyle.solid),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}