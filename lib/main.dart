import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light,
      textTheme: CupertinoTextThemeData()),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: const Text('SwiftUI Config Demo'),
            backgroundColor: CupertinoColors.systemGroupedBackground.resolveFrom(context),
            border: null,
          ),
          SliverMainAxisGroup(
            slivers: [
              SliverToBoxAdapter(
                child: CupertinoListSection.insetGrouped(
                  dividerMargin: 0,
                  hasLeading: false,
                  backgroundColor: CupertinoColors.systemGroupedBackground,
                  header: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('FIRST SECTION', style: context.tabLabelTextStyle.copyWith(fontSize: 13)),
                  ),
                  footer: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('This section contains some useful settings', style: context.tabLabelTextStyle.copyWith(fontSize: 12)),
                  ),
                  children: const [
                    SwitchTile(),
                    StepperTile(min: 0, max: 11),
                    DatePickerTile(),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: CupertinoListSection.insetGrouped(
                    dividerMargin: 0,
                    hasLeading: false,
                    header: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('SECOND SECTION', style: context.tabLabelTextStyle.copyWith(fontSize: 13)),
                    ),
                    children: Iterable<Widget>.generate(4, (index) => const CupertinoListTile(title: Text('Hello, world!'))).toList()),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SwitchTile extends StatefulWidget {
  const SwitchTile({Key? key}) : super(key: key);

  @override
  State<SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<SwitchTile> {
  bool on = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: const Text('On or off: you choose'),
      trailing: CupertinoSwitch(
        value: on,
        onChanged: (value) {
          setState(() {
            on = value;
          });
        },
      ),
    );
  }
}

class StepperTile extends StatefulWidget {
  const StepperTile({Key? key, required this.min, required this.max}) : super(key: key);

  final int min;

  final int max;

  @override
  State<StepperTile> createState() => _StepperTileState();
}

class _StepperTileState extends State<StepperTile> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text('Awesomeness: $value'),
      trailing: SizedBox(
          height: 32,
          width: 90,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey5.resolveFrom(context),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Material(
                    borderRadius: const BorderRadius.horizontal(left: Radius.circular(8)),
                    color: Colors.transparent,
                    child: InkWell(
                        borderRadius: const BorderRadius.horizontal(left: Radius.circular(8)),
                        onTap: () {
                          setState(() {
                            if (value > widget.min) value--;
                          });
                        },
                        child: Icon(CupertinoIcons.minus, size: 20, color: CupertinoColors.systemGrey.resolveFrom(context))),
                  ),
                ),
                const VerticalDivider(indent: 4, endIndent: 4, width: 2, color: CupertinoColors.systemGrey2),
                Expanded(
                  child: Material(
                    borderRadius: const BorderRadius.horizontal(right: Radius.circular(8)),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.horizontal(right: Radius.circular(8)),
                      onTap: () {
                        setState(() {
                          if (value < widget.max) value++;
                        });
                      },
                      child: Center(child: Icon(CupertinoIcons.add, size: 20, color: CupertinoColors.systemGrey.resolveFrom(context))),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class DatePickerTile extends StatefulWidget {
  const DatePickerTile({Key? key}) : super(key: key);

  @override
  State<DatePickerTile> createState() => _DatePickerTileState();
}

class _DatePickerTileState extends State<DatePickerTile> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {

    DateFormat timeFormatter = DateFormat.jm();
    return CupertinoListTile(
      title: const Text('Date'),
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: .5,
              child: DecoratedBox(
                decoration: BoxDecoration(color: CupertinoColors.systemBackground.resolveFrom(context)),
                child: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: CupertinoDatePicker(
                          onDateTimeChanged: (value) {
                            setState(() {
                              date = value;
                            });
                          },
                          initialDateTime: date ?? DateTime.now(),
                          mode: CupertinoDatePickerMode.dateAndTime,
                        ),
                      ),
                      CupertinoButton(
                        child: const Text('Done'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      trailing: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CupertinoChoiceBox(child: Text(CupertinoLocalizations.of(context).datePickerMediumDate(date), style: context.textStyle.label)),
          const SizedBox(width: 4),
          CupertinoChoiceBox(child: Text(timeFormatter.format(date), style: context.textStyle.label)),
        ],
      ),
    );
  }
}

class CupertinoChoiceBox extends StatelessWidget {
  const CupertinoChoiceBox({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: CupertinoColors.systemGrey5.resolveFrom(context), borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Padding(padding: const EdgeInsets.all(8.0), child: child),
    );
  }
}


extension FastCupertinoColors on TextStyle {
  BuildContext get context => navigatorKey.currentContext!;

  TextStyle get systemBlue => copyWith(color: CupertinoColors.systemBlue.resolveFrom(context));

  TextStyle get systemGreen => copyWith(color: CupertinoColors.systemGreen.resolveFrom(context));

  TextStyle get systemIndigo => copyWith(color: CupertinoColors.systemIndigo.resolveFrom(context));

  TextStyle get systemOrange => copyWith(color: CupertinoColors.systemOrange.resolveFrom(context));

  TextStyle get systemPink => copyWith(color: CupertinoColors.systemPink.resolveFrom(context));

  TextStyle get systemPurple => copyWith(color: CupertinoColors.systemPurple.resolveFrom(context));

  TextStyle get systemRed => copyWith(color: CupertinoColors.systemRed.resolveFrom(context));

  TextStyle get systemTeal => copyWith(color: CupertinoColors.systemTeal.resolveFrom(context));

  TextStyle get systemYellow => copyWith(color: CupertinoColors.systemYellow.resolveFrom(context));

  TextStyle get activeBlue => copyWith(color: CupertinoColors.activeBlue.resolveFrom(context));

  TextStyle get activeGreen => copyWith(color: CupertinoColors.activeGreen.resolveFrom(context));

  TextStyle get activeOrange => copyWith(color: CupertinoColors.activeOrange.resolveFrom(context));

  TextStyle get black => copyWith(color: CupertinoColors.black);

  TextStyle get destructiveRed => copyWith(color: CupertinoColors.destructiveRed);

  TextStyle get extraLightBackgroundGray => copyWith(color: CupertinoColors.extraLightBackgroundGray);

  TextStyle get inactiveGray => copyWith(color: CupertinoColors.inactiveGray.resolveFrom(context));

  TextStyle get lightBackgroundGray => copyWith(color: CupertinoColors.lightBackgroundGray);

  TextStyle get systemGrey => copyWith(color: CupertinoColors.systemGrey.resolveFrom(context));

  TextStyle get systemGrey2 => copyWith(color: CupertinoColors.systemGrey2.resolveFrom(context));

  TextStyle get systemGrey3 => copyWith(color: CupertinoColors.systemGrey3.resolveFrom(context));

  TextStyle get systemGrey4 => copyWith(color: CupertinoColors.systemGrey4.resolveFrom(context));

  TextStyle get systemGrey5 => copyWith(color: CupertinoColors.systemGrey5.resolveFrom(context));

  TextStyle get systemGrey6 => copyWith(color: CupertinoColors.systemGrey6.resolveFrom(context));

  TextStyle get white => copyWith(color: CupertinoColors.white);

  TextStyle get opaqueSeparator => copyWith(color: CupertinoColors.opaqueSeparator.resolveFrom(context));

  TextStyle get separator => copyWith(color: CupertinoColors.separator.resolveFrom(context));

  TextStyle get systemGroupedBackground => copyWith(color: CupertinoColors.systemGroupedBackground.resolveFrom(context));

  TextStyle get label => copyWith(color: CupertinoColors.label.resolveFrom(context));

  TextStyle get secondaryLabel => copyWith(color: CupertinoColors.secondaryLabel.resolveFrom(context));

  TextStyle get tertiaryLabel => copyWith(color: CupertinoColors.tertiaryLabel.resolveFrom(context));

  TextStyle get quaternaryLabel => copyWith(color: CupertinoColors.quaternaryLabel.resolveFrom(context));

  TextStyle get systemFill => copyWith(color: CupertinoColors.systemFill.resolveFrom(context));

  TextStyle get secondarySystemFill => copyWith(color: CupertinoColors.secondarySystemFill.resolveFrom(context));

  TextStyle get tertiarySystemFill => copyWith(color: CupertinoColors.tertiarySystemFill.resolveFrom(context));

  TextStyle get quaternarySystemFill => copyWith(color: CupertinoColors.quaternarySystemFill.resolveFrom(context));

  TextStyle get placeholderText => copyWith(color: CupertinoColors.placeholderText.resolveFrom(context));

  TextStyle get systemBackground => copyWith(color: CupertinoColors.systemBackground.resolveFrom(context));

  TextStyle get secondarySystemBackground => copyWith(color: CupertinoColors.secondarySystemBackground.resolveFrom(context));

  TextStyle get tertiarySystemBackground => copyWith(color: CupertinoColors.tertiarySystemBackground.resolveFrom(context));

  TextStyle get link => copyWith(color: CupertinoColors.link.resolveFrom(context));
}

extension FastCupertinoTextStyle on BuildContext {
  CupertinoTextThemeData get textTheme => CupertinoTheme.of(this).textTheme;

  TextStyle get navTitleTextStyle => textTheme.navTitleTextStyle;

  TextStyle get navLargeTitleTextStyle => textTheme.navLargeTitleTextStyle;

  TextStyle get navActionTextStyle => textTheme.navActionTextStyle;

  TextStyle get textStyle => textTheme.textStyle;

  TextStyle get tabLabelTextStyle => textTheme.tabLabelTextStyle;

  TextStyle get pickerTextStyle => textTheme.pickerTextStyle;

  TextStyle get dateTimePickerTextStyle => textTheme.dateTimePickerTextStyle;

  TextStyle get actionTextStyle => textTheme.actionTextStyle;
}
