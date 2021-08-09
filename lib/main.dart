import 'package:expense/widgets/daily_expense_chart.dart';
import 'package:expense/widgets/new_transaction.dart';
import 'package:expense/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> _userTransactions = [];

  void _startNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewTransaction(_addNewTransaction, _getTransactionCount());
      },
    );
  }

  void _addNewTransaction(Transaction newTx) {
    final newTransaction = newTx;

    setState(
      () {
        _userTransactions.add(
          newTransaction,
        );
      },
    );
  }

  int _getTransactionCount() {
    final int transactionCount = _userTransactions.length;
    return transactionCount;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Personal Expenses',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  _startNewTransaction(context);
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.grey[200],
                ),
              ),
            ),
          ],
          backgroundColor: Colors.indigo[700],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DailyExpenseChart(),
              TransactionList(_userTransactions),
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _startNewTransaction(context);
            },
          ),
        ),
      ),
    );
  }
}
