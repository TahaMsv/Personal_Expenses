import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

  NewTransaction(this.addNewTransaction);

  void submitData() {
    final enteredTitle=titleInput.text;
    final enteredamount=double.parse(amountInput.text);
    if(enteredamount<0 || enteredTitle.isEmpty)
      return ;
    addNewTransaction(titleInput.text, double.parse(amountInput.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: titleInput,
            decoration: InputDecoration(labelText: 'Title'),
            onSubmitted: (_) => submitData,
          ),
          TextField(
            controller: amountInput,
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData,
          ),
          FlatButton(
            textColor: Colors.purple,
            onPressed: submitData,
            child: Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}
