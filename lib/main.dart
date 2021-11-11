
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:widgetter/app/app.locator.dart';
import 'package:widgetter/app/app.router.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSI Demo',
      theme: ThemeData(
        // primarySwatch: Color(Colors.green400),
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


