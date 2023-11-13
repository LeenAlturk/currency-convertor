import 'package:currency_converter_app/componnent/clip.dart';
import 'package:currency_converter_app/pages/home.dart';
import 'package:currency_converter_app/pages/home_body.dart';
import 'package:currency_converter_app/provider/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 130,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: MessageClipper(),
            child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                color: Colors.purple,
                child: Center(
                    child: Text(
                  "Currency Converter",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))),
          ),
        ),
        body: Curen(),
      ),
    );
  }
}
