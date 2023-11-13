import 'package:currency_converter_app/pages/home.dart';
import 'package:currency_converter_app/pages/home_screen.dart';
import 'package:currency_converter_app/pages/splash.dart';
import 'package:currency_converter_app/pages/test.dart';
import 'package:currency_converter_app/provider/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // i am remove const from MaterialApp
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors

    return ChangeNotifierProvider(
      create: (context) => ExchangeRateProvider(),
      child: MaterialApp(
        title: 'currency convertor',
        theme: ThemeData(primaryColor: Color.fromARGB(255, 2, 48, 3)),
        debugShowCheckedModeBanner: false,
        // ignore: prefer_const_constructors
        home: splash(),
      ),
    );
  }
}
