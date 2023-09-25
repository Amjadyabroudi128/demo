import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( Demo());
}

class Demo extends StatefulWidget {

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      if (_counter == 11) {
      } else {
        _counter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter == 0) {
      } else {
        _counter--;
      }
    });
  }
  bool isSwitched = false;
  DateTime dateTime = DateTime(3000, 2, 1, 10, 20);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('first section', style: TextStyle(color: Colors.grey),),
              Card(
                child: Card(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                          Text('on off you choose', style: TextStyle(fontWeight: FontWeight.bold)),
                            Spacer(),
                            CupertinoSwitch(
                              value: isSwitched,
                              onChanged: (bool value){
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Text('Awesomness:' + '$_counter', style: TextStyle(fontWeight: FontWeight.bold),),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.add),
                              color: Colors.grey,
                              onPressed: _incrementCounter,
                            ),
                            IconButton(
                              icon: Icon(Icons.remove),
                              color: Colors.grey,
                              onPressed: _decrementCounter,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('DATE', style: TextStyle(fontWeight: FontWeight.bold),),
                            
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text('this section contains some useful settings', style: TextStyle(color: Colors.grey),),
              SizedBox(height: 10,),
              Text('second section', style: TextStyle(color: Colors.grey),),
              SizedBox(height: 10,),
              Card(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('hello World', style: TextStyle(fontWeight: FontWeight.bold),),
                      Divider(color: Colors.black, thickness: 1,),
                      Text('hello World', style: TextStyle(fontWeight: FontWeight.bold),),
                      Divider(color: Colors.black, thickness: 1,),
                      Text('hello World', style: TextStyle(fontWeight: FontWeight.bold),),
                      Divider(color: Colors.black, thickness: 1,),
                      Text('hello World', style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ) ,

    );
  }
}

