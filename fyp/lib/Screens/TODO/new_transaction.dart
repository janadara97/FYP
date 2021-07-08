import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  final Function newTx;

  NewTransactions(this.newTx);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titleController =TextEditingController();
  final amountController =TextEditingController();

  void onSubmitted (){
    final enteredTitle=titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount<0){

      return;
    }

    widget.newTx(
      enteredTitle,
      enteredAmount,);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => onSubmitted(),
              decoration: InputDecoration(
                  labelText:"Title"),
            //  onChanged:(val){

             // },
            ),
            TextField(
              controller: amountController,
              onSubmitted: (_) => onSubmitted(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:"Amount"),
              //onChanged: (val) => amountText=val ,
            ),
            RaisedButton(
              child: Text("Add"),
              textColor: Colors.purple,
              onPressed: () {
              onSubmitted();
            },
            )
          ],
        ),
      ),
    );
  }
}
