import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'KRW',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

final String coinApiUrl = dotenv.env['BASE_URL'].toString();
final String apiKey = dotenv.env['API_KEY'].toString();

class CoinData {
  Future getCoinData(String currency) async {
    String url = '$coinApiUrl/BTC/$currency?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      var price = decodedData['rate'];
      return price;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
