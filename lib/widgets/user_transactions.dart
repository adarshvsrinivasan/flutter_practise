import 'package:expense/models/transaction.dart';
import 'package:expense/widgets/new_transaction.dart';
import 'package:expense/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  List<Transaction> _userTransactions = [
  ];

  void _addNewTransaction(Transaction newTx) {
    final newTransaction = newTx;

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  int _getTransactionCount() {
    final int transactionCount = _userTransactions.length;
    return transactionCount;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction, _getTransactionCount()),
        TransactionList(_userTransactions),
      ],
    );
  }
}
