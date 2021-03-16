import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transactions_list.dart';
import './Transaction.dart';
class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
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

  void _addTransaction(String titleTx, double amountTx) {
    final newTx=new Transaction(
        title: titleTx,
        amount: amountTx,
        date: DateTime.now(),
        id: DateTime.now().toString());
    
    setState((){
      _userTransactions.add(newTx);
    });
  } 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addTransaction),
          Card(
            elevation: 5,
            child: Container(
              child: TransactionsList(_userTransactions),
            ),
          )
      ],
    );
  }
}