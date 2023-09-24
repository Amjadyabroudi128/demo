import 'package:flutter/material.dart';

void main() {
  runApp(const Demo());
}

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('second section',),
              SizedBox(height: 10,),
              Card(
                child: Container(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('hello World'),
                      Divider(color: Colors.black, thickness: 1,),
                      Text('hello World'),
                      Divider(color: Colors.black, thickness: 1,),
                      Text('hello World'),
                      Divider(color: Colors.black, thickness: 1,),
                      Text('hello World'),
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

