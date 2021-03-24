import 'package:flutter/material.dart';
import './Transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;
  TransactionsList(this.userTransactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (ctx, constraint) {
      return Container(
        height: constraint.maxHeight * 0.6,
        child: userTransactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text('No transaction added yet!'),
                  SizedBox(
                    height: constraint.maxHeight * 0.05,
                  ),
                  Container(
                      height: constraint.maxHeight * 0.35,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: FittedBox(
                              child:
                                  Text('\$${userTransactions[index].amount}')),
                        ),
                      ),
                      title: Text(
                        userTransactions[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        userTransactions[index].date.toString(),
                      ),
                      trailing: screenWidth>360?  FlatButton.icon(
                        label: Text('Delete'),
                        icon: Icon(Icons.delete),
                        textColor: Theme.of(context).errorColor,
                        onPressed: () => deleteTx(userTransactions[index].id),
                      ):
                       IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deleteTx(userTransactions[index].id),
                      )
                    ),
                  );
                },
                itemCount: userTransactions.length,
              ),
      );
    });
  }
}
