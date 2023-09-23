import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: SwiftConfig(),
        ),
      ),
    );
  }
}

class SwiftConfig extends StatelessWidget {
  const SwiftConfig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('SwiftUI Config Demo',),
            ),
            CupertinoListSection.insetGrouped(
              header: Text('FIRST SECTION',),
              footer: Text('This section contains some useful settings'),
              children: [
                SwitchListTile.adaptive(title: const Text('On or off: you choose'), value: true, onChanged: (value) => print(value)),
                const StepperTile(),
                const DatePickerTile(),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: Text('SECOND SECTION'),
              children: Iterable<Widget>.generate(4, (index) => const ListTile(title: Text('Hello, world!'))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class StepperTile extends StatelessWidget {
  const StepperTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Awesomeness: '),
      trailing: ToggleButtons(
        borderRadius: BorderRadius.circular(8),
        constraints: const BoxConstraints(minWidth: 40, minHeight: 20),
        isSelected: const [true, false],
        children: const [Text('-'), Text('+')],
      ),
    );
  }
}

class DatePickerTile extends StatelessWidget {
  const DatePickerTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Date'),
      trailing: SizedBox(
        height: 30,
        width: 200,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Sep 22, 2023'),
                ),
              ),
              const SizedBox(width: 4),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('12:28 PM'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



