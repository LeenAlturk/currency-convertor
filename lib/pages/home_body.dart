// import 'package:currency_converter_app/componnent/dropdownlist.dart';
// import 'package:currency_converter_app/helpers/api.dart';
import 'dart:ffi';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:currency_converter_app/componnent/clip.dart';
import 'package:currency_converter_app/componnent/dropdownlist.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../provider/currency_provider.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   // ApiService client = ApiService();
//   // late List<String> currencies;
//   // String? from;
//   // String? To;

//   //newww
//   List<String> _currencies = [];
//   String? _from;
//   String? _to;
//   final _apiService = ApiService();

//   //for calculate currences
//   double? rate;
//   String? result = " ";
//   //function to get list of coins
//   // Future<List<String>> getExchangeList() async {
//   //   return await client.getExchangeRates();
//   // }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   (() async {
//   //     List<String> list = await client.getExchangeRates();
//   //     setState(() {
//   //       currencies = list;
//   //     });
//   //   })();
//   // }
//   @override
//   void initState() {
//     super.initState();
//     _fetchCurrencies();
//   }

//   Future<void> _fetchCurrencies() async {
//     final currencies = await _apiService.getExchangeRates();
//     setState(() => _currencies = currencies);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.indigo,
//       appBar: AppBar(
//         backgroundColor: Colors.grey,
//         title: Text("currency"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Expanded(
//                 child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 TextField(
//                   decoration: const InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       labelText: "input value to convert "),
//                   style: TextStyle(
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                   textAlign: TextAlign.center,
//                   keyboardType: TextInputType.number,
//                   onSubmitted: (value) {},
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Customdropdown(
//                       _currencies,
//                       _from,
//                       (value) => setState(() => _from = value),
//                     ),
//                     FloatingActionButton(
//                       onPressed: () {
//                         String? temp = _from;
//                         setState(() {
//                           _from = _to;
//                           _to = temp;
//                         });
//                       },
//                       child: Icon(Icons.swap_horiz_outlined),
//                       backgroundColor: Colors.amber,
//                     ),
//                     Customdropdown(
//                       _currencies,
//                       _to,
//                       (value) => setState(() => _to = value),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16.0),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         "Result",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }
class Curen extends StatefulWidget {
  Curen({super.key});

  @override
  State<Curen> createState() => _CurenState();
}

class _CurenState extends State<Curen> {
  // String dropdownValue = 'AED';
  final amountController = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Call the provider here
    Provider.of<ExchangeRateProvider>(context, listen: false)
        .fetchExchangeRates2();
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: Consumer<ExchangeRateProvider>(
              builder: (context, provider, child) {
            return Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Image.network("https://www.101computing.net/wp/wp-content/uploads/currencies.png"),
                Container(
                  height: 250,
                  child: Lottie.network(
                      "https://lottie.host/582d6de0-5665-4d4c-9d83-1576ac649258/aMonI6uQWJ.json"),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text("Choose currency"),
                    SizedBox(
                      width: 20.0,
                    ),
                    DropdownButton<String>(
                      value: provider.dropdownValue,
                      onChanged: (String? newValue) {
                        // setState(() {
                        //   dropdownValue = newValue!;
                        //   conversionRate = provider.exchangeRates[newValue]!;
                        // });
                        provider.updateDropdownValue(newValue!);
                      },
                      items: provider.exchangeRates.keys
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                TextFormField(
                  controller: amountController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide()),
                      labelText: "Amount in USD",
                      labelStyle: TextStyle(color: Colors.black26)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  onPressed: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return AlertDialog(
                    //       content: Text(
                    //         //'${amountController.text} USD is equal to ${double.parse(amountController.text) * conversionRate} $dropdownValue',
                    //         '${amountController.text} USD is equal to ${double.parse(amountController.text) * provider.conversionRate} ${provider.dropdownValue}',
                    //
                    //       ),
                    //     );
                    //   },
                    // );
                    //shooooooooooooooooooooooooooooooooooooo
                    // showModalBottomSheet(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return SizedBox(
                    //         height: 100,
                    //         child: Row(
                    //           children: [
                    //             Text(
                    //               '${amountController.text} USD is equal to ${double.parse(amountController.text) * provider.conversionRate} ${provider.dropdownValue}',
                    //             ),
                    //             SizedBox(
                    //               width: 10.0,
                    //             ),
                    //             ElevatedButton(
                    //                 style: ElevatedButton.styleFrom(
                    //                     backgroundColor: Colors
                    //                         .purple
                    //                     ),
                    //                 onPressed: () {
                    //                   Navigator.pop(context);
                    //                 },
                    //                 child: Text("close"))
                    //           ],
                    //         ),
                    //       );
                    //     });
                    //////////////shoooooo
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          icon: Icon(Icons.money_rounded),
                          elevation: 100,
                          title: Text(
                            'Result',
                          ),
                          titleTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple.shade800,
                              fontSize: 20),
                          actionsOverflowButtonSpacing: 20,
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Back")),
                          ],
                          content: Text(
                              '${amountController.text} USD is equal to ${double.parse(amountController.text) * provider.conversionRate} ${provider.dropdownValue}'),
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Convert',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 250.0,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        color: Colors.purple,
                        fontSize: 70.0,
                        fontFamily: 'Canterbury',
                      ),
                      child: AnimatedTextKit(
                        totalRepeatCount: 20,
                        animatedTexts: [
                          ScaleAnimatedText('With'),
                          ScaleAnimatedText('Latest'),
                          ScaleAnimatedText('Update'),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
