import 'package:expense/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

import 'package:expense/widgets/daily_expense_chart.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'My Personal Expenses',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DailyExpenseChart(),
              UserTransactions(),
            ],
          ),
        ),
      ),
    );
  }
}
