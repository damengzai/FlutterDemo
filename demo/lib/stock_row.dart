import 'package:demo/http/http_data.dart';
import 'package:flutter/material.dart';

class StockRow extends StatelessWidget {
  StockRow({this.stock}) : super(key: ObjectKey(stock));
  final Stock stock;
  static const double kHeight = 79.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 20.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(context).dividerColor)
          )
        ),
        child: Row(
          children: <Widget>[
            Text(stock.symbol)
          ],
        ),
      ),
    );
  }
}
