import 'package:flutter/material.dart';
import 'package:ngoppish_mobile/models/product.dart';

class DetailScreen extends StatelessWidget {
  final Product item;

  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.fields.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "${item.fields.amount}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              item.fields.description,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
