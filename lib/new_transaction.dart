import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  NewTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: titleInput,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: amountInput,
            decoration: InputDecoration(labelText: 'Amount'),
          ),
          FlatButton(
            textColor: Colors.purple,
            onPressed: () {
              addNewTransaction(
                  titleInput.text, double.parse(amountInput.text));
            },
            child: Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}
