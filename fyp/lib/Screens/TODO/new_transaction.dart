import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class NewTransactions extends StatefulWidget {
  final Function newTx;

  NewTransactions(this.newTx);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {

  String addressLocation="";
  String country="";
  String postalCode="";
  final addressLocationController = TextEditingController();
  final countryController = TextEditingController();
  final postalCodeController = TextEditingController();

  final titleController =TextEditingController();
  final typeController =TextEditingController();
  final amountController =TextEditingController();
  final locationController =TextEditingController();
  final priorityController =TextEditingController();
  final dateController =TextEditingController();

  void getMapResult (){

  }


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
              controller: typeController,
              onSubmitted: (_) => onSubmitted(),
              decoration: InputDecoration(
                  labelText:"Type"),
              //  onChanged:(val){

              // },
            ),
            TextField(
              onTap: () async {
                var response =await PlacesAutocomplete.show(
                    context: context,
                    apiKey: "AIzaSyB1JPbPenBeC4Mti8CBA2NPix3-tZd0iAY",
                types: [],
                language: "en",

                );
              },
              controller: locationController,
              onSubmitted: (_) => onSubmitted(),
              decoration: InputDecoration(
                  labelText:"Location"),
              //  onChanged:(val){

              // },
            ),
            TextField(
              controller: priorityController,
              onSubmitted: (_) => onSubmitted(),
              decoration: InputDecoration(
                  labelText:"Priority"),
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
