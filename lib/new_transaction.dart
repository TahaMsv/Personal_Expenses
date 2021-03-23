import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInput = TextEditingController();

  final _amountInput = TextEditingController();
  DateTime picked_date;

  void submitData() {
    final enteredTitle = _titleInput.text;
    final enteredamount = double.parse(_amountInput.text);
    if (enteredamount < 0 || enteredTitle.isEmpty || picked_date == null)
      return;
    widget.addNewTransaction(
        _titleInput.text, double.parse(_amountInput.text), picked_date);
    Navigator.of(context).pop();
  }

  void _selectingDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) return;
      setState(() {
        picked_date = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: _titleInput,
            decoration: InputDecoration(labelText: 'Title'),
            onSubmitted: (_) => submitData,
          ),
          TextField(
            controller: _amountInput,
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData,
          ),
          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                picked_date == null
                    ? Text(
                        'No date chosen!',
                      )
                    : Text(''),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: _selectingDate,
                  child: Text('Choose date',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).buttonColor,
            onPressed: submitData,
            child: Text(
              'Add Transaction',
            ),
          ),
        ],
      ),
    );
  }
}
