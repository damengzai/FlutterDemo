import 'package:demo/http/http_data.dart';
import 'package:demo/stock_row.dart';
import 'package:flutter/material.dart';

//void main() => runApp(Detail());
class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Detail",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DetailPage(title: 'Detail',),
    );
  }

}

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {

  StockData stockData;

  @override
  void initState() {
    super.initState();
    stockData = new StockData();
  }

  static Iterable<Stock> _getStockList(StockData stocks, Iterable<String> symbols) {
    return symbols.map<Stock>((String symbol) => stocks[symbol]).where((Stock stock) => stock != null);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
//        child: Text(
//          "Detail"
//        ),
          child: ListView.builder(
              key: const ValueKey<String>("stock-list"),
              itemExtent: StockRow.kHeight,
              itemCount: _getStockList(stockData, stockData.allSymbols).toList().length,
              itemBuilder: (BuildContext context, int index) {
                return StockRow(stock:_getStockList(stockData, stockData.allSymbols).toList()[index]);
              })
      ),
    );
  }

}