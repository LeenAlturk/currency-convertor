import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class curencies extends StatefulWidget {
  const curencies({super.key});

  @override
  State<curencies> createState() => _curenciesState();
}

class _curenciesState extends State<curencies> {
  late Map<String, double> exchangeRates ={};
  String dropdownValue = 'AED';
  double conversionRate = 3.673;
  final amountController = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchExchangeRates();
  }

   static const String baseUrl = 'https://openexchangerates.org/api/latest.json';
   static const String apiKey = 'ed1da21719dd4847b654dc9151c4a151';
  Future<void> fetchExchangeRates() async {
    final response = await http.get(Uri.parse('$baseUrl?app_id=$apiKey'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      setState(() {
        //exchangeRates = Map<String, double>.from(data['rates']);
        final rawExchangeRates = data['rates'] as Map<String, dynamic>;
        exchangeRates = rawExchangeRates.map<String, double>((key, value) {
          return MapEntry(key, value.toDouble());
        });

        //printAllCurrencyValues();
      });
    } else {
      throw Exception('Failed to load exchange rates');
    }
  }
  // void printAllCurrencyValues() {
  //   for (String currency in exchangeRates.keys) {
  //     print('Currency: $currency');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Converter')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  conversionRate = exchangeRates[newValue]!;
                });
              },
              items: exchangeRates.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount in USD'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                //print(exchangeRates.toString());
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                        '${amountController.text} USD is equal to ${double.parse(amountController.text) * conversionRate} $dropdownValue',
                      ),
                    );
                  },
                );
              },
              child: const Text('Convert'),
            ),

          ],
        ),
      ),
    );
  }
}
