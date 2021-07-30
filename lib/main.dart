import 'package:flutter/material.dart';

import 'package:expense/widgets/daily_expense_chart.dart';
import 'package:expense/widgets/new_transaction.dart';
import 'package:expense/widgets/transaction_list.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DailyExpenseChart(),
            TransactionList(),
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}
