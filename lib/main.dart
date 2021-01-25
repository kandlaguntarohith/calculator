import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Widgets/DisplayScreen.dart';
import './Widgets/Pad.dart';
import 'package:provider/provider.dart';
import './Provider/CalculationLogic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider(
      create: (context) => CalculationLogic(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            backgroundColor: Colors.black),
        home: Scaffold(
          // resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,

          appBar: AppBar(
            title: Text('Calculator'),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.black,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DisplayScreen(),
              Expanded(
                child: Pad(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
