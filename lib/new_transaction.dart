import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './adaptiveFlatButton.dart';

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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: _titleInput,
              decoration:const InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => submitData,
            ),
            TextField(
              controller: _amountInput,
              decoration:const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child:
                          Text(picked_date == null ? 'No date chosen!' : '')),
                  AdaptiveFlatButton('Choose date', _selectingDate),
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).buttonColor,
              onPressed: submitData,
              child:const Text(
                'Add Transaction',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
