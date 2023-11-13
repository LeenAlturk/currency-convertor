// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// import '../models/currencymodel.dart';

//////////////////////////////////////////////////22
import 'dart:convert';
import 'package:currency_converter_app/helpers/api.dart';
import 'package:currency_converter_app/models/response_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class ExchangeRateProvider with ChangeNotifier {
//   late Map<String, double> exchangeRates = {};
//
//    static const String baseUrl = 'https://openexchangerates.org/api/latest.json';
//    static const String apiKey = 'ed1da21719dd4847b654dc9151c4a151';
//   //$baseUrl?app_id=$apiKey
//
//   Future<void> fetchExchangeRates() async {
//     final response = await http.get(Uri.parse('$baseUrl?app_id=$apiKey'));
//
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body) as Map<String, dynamic>;
//       final rawExchangeRates = data['rates'] as Map<String, dynamic>;
//       exchangeRates = rawExchangeRates.map<String, double>((key, value) {
//         return MapEntry(key, value.toDouble());
//       });
//       notifyListeners();
//     } else {
//       throw Exception('Failed to load exchange rates');
//     }
//   }
// }
/////////////////////////////////////////////////////////////22
import 'package:flutter/material.dart';

class ExchangeRateProvider with ChangeNotifier {
  late Map<String, double> exchangeRates = {};
  String dropdownValue = 'AED';
  double conversionRate = 3.673;
  final ApiService apiService = ApiService();
  String s = "";
  // Future<void> fetchExchangeRates() async {
  //   try {
  //     exchangeRates = await apiService.fetchExchangeRates();
  //     notifyListeners();
  //   } catch (e) {
  //     throw Exception('Failed to load exchange rates');
  //   }
  // }

  Future<void> fetchExchangeRates2() async {
    ApiService apiService = ApiService();
    ResponseModel response = await apiService.fetchExchangeRates2();
    if (response.hasError) {
      s = response.message;
      notifyListeners();
    } else {
      exchangeRates = response.data;
      notifyListeners();
    }
  }

  void updateDropdownValue(String newValue) {
    dropdownValue = newValue;
    conversionRate = exchangeRates[newValue]!;
    notifyListeners();
  }
}
