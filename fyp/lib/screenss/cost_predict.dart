import 'package:flutter/material.dart';

class CostPredict extends StatelessWidget {
  const CostPredict({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cost Prediction"),
      ),
      body: Center(
        child: Text("Predicting cost for next task...."),
      ),
    );
  }
}