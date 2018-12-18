import 'dart:convert';

import 'package:demo/utils/AES.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

///调用接口返回数据


class Stock {
  Stock(this.symbol, this.name, this.lastSale, this.marketCap,
      this.percentChange);

  Stock.fromFields(List<String> fields) {
    lastSale = 0.0;
    try {
      lastSale = double.parse(fields[2]);
    } catch (_) {}
    symbol = fields[0];
    name = fields[1];
    marketCap = fields[4];
    percentChange = 0.0;
  }

  String symbol;
  String name;
  double lastSale;
  String marketCap;
  double percentChange;
}

class StockData extends ChangeNotifier {
  static bool actuallyFetchData = true;

  http.Client _httpClient;
  final List<String> _symbols = <String>[];
  final Map<String, Stock> _stocks = <String, Stock>{};

  Iterable<String> get allSymbols => _symbols;
  Stock operator [](String symbol) => _stocks[symbol];
  bool get loading => _httpClient != null;


  StockData() {
    if(actuallyFetchData){
        _httpClient = http.Client();
        _fetchNextChunk();
        _fetchData("prd.query.banner.list");
    }
  }

  void add(List<dynamic> data) {
    for(List<dynamic> fields in data) {
      final Stock stock = Stock.fromFields(fields.cast<String>());
      _symbols.add(stock.symbol);
      _stocks[stock.symbol] = stock;
    }
    _symbols.sort();
    notifyListeners();
  }
  static const int _chunkCount = 30;
  int _nextChunk = 0;
  String UrlHeader= "http://kbx.chuyunspace.com/router";
  
  String _urlToFetch(int chunk) {
    return 'https://domokit.github.io/examples/stocks/data/stock_data_$chunk.json';
  }
  void _fetchData(String method) {

//    Future<String> str = AES.encrype(sSrc);
//
//    pairs.add(new NameValuePair("params", str));


    _httpClient.post(UrlHeader,body: {"method": method, "appKey": "00001", "v": "1.0", "sessionId":'', "paramsKey": "0-00001"}).then<void>((http.Response response) {
      String result = response.body;
      print(response.body);
    });
  }

  void _fetchNextChunk() {
    _httpClient.get(_urlToFetch(_nextChunk++)).then<void>((http.Response response) {
      final String json = response.body;
      if (json == null) {
        _end();
        return;
      }
      const JsonDecoder decoder = JsonDecoder();
      add(decoder.convert(json));
      if(_nextChunk < _chunkCount) {
        _fetchNextChunk();
      } else {
        _end();
      }
    });
  }

  void _end() {
    _httpClient?.close();
    _httpClient = null;
  }
}
