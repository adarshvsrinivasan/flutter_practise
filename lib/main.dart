import 'dart:io';

import 'package:expense/widgets/daily_expense_chart.dart';
import 'package:expense/widgets/new_transaction.dart';
import 'package:expense/widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/transaction.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: "Quicksand",
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 25,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontSize: 25,
                  fontFamily: 'OpenSans',
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> _userTransactions = [];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

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

  void _deleteTransaction(int id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  int _getTransactionCount() {
    final int transactionCount = _userTransactions.length;
    return transactionCount;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final dynamic appBar = Platform.isAndroid
        ? AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              'My Personal Expenses',
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
          )
        : CupertinoNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            middle: Text(
              "My Personal Expenses",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(
                    CupertinoIcons.add,
                    color: Colors.white,
                  ),
                  onTap: () {
                    _startNewTransaction(context);
                  },
                )
              ],
            ),
          );

    var txWidgetList = Container(
      height: (mediaQuery.size.height -
              mediaQuery.padding.top -
              appBar.preferredSize.height) *
          0.7,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );

    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (isLandscape)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: (mediaQuery.size.height -
                            mediaQuery.padding.top -
                            appBar.preferredSize.height) *
                        0.7,
                    width: mediaQuery.size.width * 0.5,
                    child: DailyExpenseChart(_recentTransactions),
                  ),
                  Container(
                    height: (mediaQuery.size.height -
                            mediaQuery.padding.top -
                            appBar.preferredSize.height) *
                        1,
                    width: mediaQuery.size.width * 0.5,
                    child:
                        TransactionList(_userTransactions, _deleteTransaction),
                  ),
                ],
              ),
            if (!isLandscape)
              Container(
                height: (mediaQuery.size.height -
                        mediaQuery.padding.top -
                        appBar.preferredSize.height) *
                    0.3,
                child: DailyExpenseChart(_recentTransactions),
              ),
            if (!isLandscape) txWidgetList,
          ],
        ),
      ),
    );

    return Platform.isAndroid
        ? Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButton: !Platform.isIOS
                ? Builder(
                    builder: (context) => FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () {
                        _startNewTransaction(context);
                      },
                    ),
                  )
                : null,
          )
        : CupertinoPageScaffold(
            navigationBar: appBar,
            child: pageBody,
          );
  }
}