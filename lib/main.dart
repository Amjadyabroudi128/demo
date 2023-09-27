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
                            Text('Date'),
                           Spacer(),
                           DatePickerExample(),
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

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({Key? key}) : super(key: key);

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateTime date = DateTime(2016, 10, 26);
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      // Display a CupertinoDatePicker in date picker mode.
      onPressed: () => _showDialog(
        CupertinoDatePicker(
          initialDateTime: date,
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          // This shows day of week alongside day of month
          showDayOfWeek: true,
          // This is called when the user changes the date.
          onDateTimeChanged: (DateTime newDate) {
            setState(() => date = newDate);
          },
        ),
      ),
      // In this example, the date is formatted manually. You can
      // use the intl package to format the value based on the
      // user's locale settings.
      child: Text(
        '${date.month}-${date.day}-${date.year}',
        style: const TextStyle(
          fontSize: 22.0,
        ),
      ),
    );

  }
}
