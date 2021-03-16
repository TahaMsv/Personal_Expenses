import 'package:flutter/material.dart';
import './Transaction.dart';

class  TransactionsList extends StatelessWidget {
  final List<Transaction> userTransactions;
  TransactionsList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child:userTransactions.isEmpty? Column(
        children: <Widget>[
          Text('No transaction added yet!'),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,)),
        ],
      ): ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.purple,
                  ),
                ),
                child: Text(
                  '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userTransactions[index].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          );
        },
        itemCount: userTransactions.length,
      ),
    );
  }
}
