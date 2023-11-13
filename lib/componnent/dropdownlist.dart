import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Customdropdown(
  List<String> item,
  String? value,
  void onchange(val),
) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(9.0)),
    child: DropdownButton<String>(
      value: value,
      onChanged: (String? val) {
        onchange(val); // This line should call the provided onchange function
      },
      items: item.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem<String>(
          value: val,
          child: Text(val), // Display the text of the item
        );
      }).toList(),
    ),
  );
}
