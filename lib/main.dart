import 'package:flutter/material.dart';
import './Transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Card(
                child: Text('Chart'),
              ),
            ),
            Container(
              child: Column(
                children: transactions.map((tx) {
                  return Container(
                   child: Row(
                     children:<Widget>[
                       Container(child: Text(tx.title),),
                       Container(child: Column(children: <Widget>[
                         Container(child: Text(tx.id),),
                         Container(child: Text( '\$${tx.amount}'),),
              
                       ],),),
                     ]
                   ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
