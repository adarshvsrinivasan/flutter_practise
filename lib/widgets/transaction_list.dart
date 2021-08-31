import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delFn;

  TransactionList(this.transactions, this.delFn);

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: !isLandscape
          ? const EdgeInsets.only(top: 0, bottom: 6)
          : const EdgeInsets.only(top: 12, bottom: 6),
      child: Container(
        child: transactions.isNotEmpty
            ? ListView.builder(
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: !isLandscape
                        ? const EdgeInsets.fromLTRB(12, 0, 12, 0)
                        : const EdgeInsets.fromLTRB(6, 0, 12, 0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Theme.of(context).primaryColorLight,
                      elevation: 2,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: FittedBox(
                              child: Text(
                                "Rs. ${transactions[index].amount.toString()}",
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            //fontFamily: "OpenSans",
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          iconSize: 25,
                          onPressed: () {
                            delFn(transactions[index].id);
                          },
                        ),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      Text(
                        'No Transactions Yet!',
                        style: TextStyle(
                          fontSize: 22,
                          //fontFamily: "OpenSans",
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: constraints.maxHeight * 0.7,
                          child: Image.asset(
                            'assets/images/waiting.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
