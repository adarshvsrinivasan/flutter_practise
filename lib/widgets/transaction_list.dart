import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Container(
              height: 60,
              width: double.infinity,
              child: Card(
                color: Theme.of(context).primaryColorLight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      child: Center(
                        child: Text(
                          transactions[index].id.toString(),
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
                            transactions[index].title,
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
                            DateFormat()
                                .add_yMMMd()
                                .format(transactions[index].date),
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
                          'Rs. ${transactions[index].amount.toStringAsFixed(2)}',
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
        itemCount: transactions.length,
      ),
    );
  }
}
