// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class ApiService {
//   static const String baseUrl = 'https://openexchangerates.org/api/latest';
//   static const String apiKey = 'ed1da21719dd4847b654dc9151c4a151';
//
//   Future<List<String>> getExchangeRates() async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl?app_id=$apiKey'));
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         // return data['rates'];
//         var list = data['rates'];
//         late List<String> currencies = (list.keys).tolist();
//         return currencies;
//       } else {
//         throw Exception('Failed to fetch exchange rates');
//       }
//     } catch (e) {
//       throw Exception('Failed to fetch exchange rates: $e');
//     }
//   }
// }

// import 'dart:convert';
//
// import '../models/currencymodel.dart';
//
// ////olddd
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class ApiService {
//   static const String baseUrl = 'https://openexchangerates.org/api/latest.json';
//   static const String apiKey = 'ed1da21719dd4847b654dc9151c4a151';
//
//   Future<List<String>> getExchangeRates() async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl?app_id=$apiKey'));
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final currencyList = data['rates'].keys.toList().cast<String>();
//         return currencyList;
//       } else {
//         throw Exception('Failed to fetch exchange rates');
//       }
//     } catch (e) {
//       throw Exception('Failed to fetch exchange rates: $e');
//     }
//   }
// }
//olddd
// class Apiservice {
//   static const String baseUrl = 'https://openexchangerates.org/api/latest.json';
//   static const String apiKey = 'ed1da21719dd4847b654dc9151c4a151';

//   Future<List<Currency>> getExchangeRates() async {

//   try {
//     final response = await http.get(Uri.parse('$baseUrl?app_id=$apiKey'));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final currencyList = data['rates']
//           .entries
//           .map((entry) => Currency(entry.key, entry.value))
//           .toList();
//       return currencyList;
//     } else {
//       throw Exception('Failed to fetch exchange rates');
//     }
//   } catch (e) {
//     throw Exception('Failed to fetch exchange rates: $e');
//   }
// }
// }
import 'dart:convert';
import 'package:currency_converter_app/models/response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://openexchangerates.org/api/latest.json';
  static const String apiKey = 'ed1da21719dd4847b654dc9151c4a151';

  Future<Map<String, double>> fetchExchangeRates() async {
    final response = await http.get(Uri.parse('$baseUrl?app_id=$apiKey'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      final rawExchangeRates = data['rates'] as Map<String, dynamic>;
      return rawExchangeRates.map<String, double>((key, value) {
        return MapEntry(key, value.toDouble());
      });
    } else {
      throw Exception('Failed to load exchange rates');
    }
  }

  Future<ResponseModel<Map<String, double>>> fetchExchangeRates2() async {
    final response = await http.get(Uri.parse('$baseUrl?app_id=$apiKey'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      final rawExchangeRates = data['rates'] as Map<String, dynamic>;
      return ResponseModel.complete(
          data: rawExchangeRates.map<String, double>((key, value) {
            return MapEntry(key, value.toDouble());
          }));
    } else {
      return ResponseModel.withError(message: "Failed to load exchange rates");
    }
  }


}
