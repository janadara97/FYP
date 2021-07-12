import 'package:flutter/material.dart';
import 'package:fyp/Screens/TODO/transaction_list.dart';

import 'Model/transactions.dart';
import 'chart.dart';
import 'new_transaction.dart';

class MainTODO extends StatefulWidget {

  @override
  _MainTODOState createState() => _MainTODOState();
}

class _MainTODOState extends State<MainTODO> {

  int _selectedIndex=0;
  final List <Transactions> _transactionsList = [
    /*Transactions(
        id: "ID1",
        title: "Wedding",
        amount: 10,
        date: DateTime.now()),

    Transactions(
        id: "ID2",
        title: "foof",
        amount: 37,
        date: DateTime.now())*/
  ];
  List <Transactions> get _recentTransactions {

    return _transactionsList.where((tx) {
      return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),));
    }).toList();
  }

  void _addNewTransactions(String txTitle,double txAmount){
    final newTx = Transactions(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _transactionsList.add(newTx);
    });
  }

  void _startNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
          onTap: (){},
          behavior: HitTestBehavior.opaque,
          child: NewTransactions(_addNewTransactions));
    },);
  }

  @override
  Widget build(BuildContext context) {
    String titleText;
    String amountText;
    return Scaffold(


      body: SingleChildScrollView(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransactions),
            TransactionList(_transactionsList),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>_startNewTransaction(context),),
    );
  }
  Widget buildNavBarItem(IconData icon,int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex=index;
        });
      },
      child: Container(
        child:Icon(icon,color: index==_selectedIndex?Colors.green:Colors.grey,),
        height:MediaQuery.of(context).size.height*0.075,
        width: MediaQuery.of(context).size.width/5,
        decoration: index==_selectedIndex?
        BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 4,color: Colors.green),
          ),
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.green.withOpacity(0.3),
          //     Colors.green.withOpacity(0.015)
          //   ],
          //   begin: Alignment.bottomCenter,
          //   end: Alignment.topCenter,
          // ),
          //color:index==_selectedIndex? Colors.green:Colors.white,
        ):BoxDecoration()
      ),
    );
  }
}