import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTransactions = [
    Transaction.name('001', 'New Laptops', 999.99, DateTime.now()),
    Transaction.name('002', 'New App', 2999.99, DateTime.now()),
    Transaction.name('003', 'New Chips', 99.99, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransactions.map(
        (tx) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Container(
              height: 60,
              width: double.infinity,
              child: Card(
                color: Colors.cyanAccent[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      child: Center(
                        child: Text(
                          tx.id,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            tx.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            DateFormat().add_yMMMd().format(tx.date),
                            style: TextStyle(
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 120,
                      height: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                        child: Text(
                          'Rs. ${tx.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
