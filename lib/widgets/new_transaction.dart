import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addFn;
  final int transactionCount;

  NewTransaction(this.addFn, this.transactionCount);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(Transaction tx) {
    if (tx.amount.isNegative || tx.title.isEmpty) {
      return;
    }

    widget.addFn(tx);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Card(
            color: Theme.of(context).primaryColorLight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                      controller: titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount',
                      ),
                      controller: amountController,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        final newTx = Transaction.name(
                          widget.transactionCount + 1,
                          titleController.text,
                          double.parse(amountController.text),
                          DateTime.now(),
                        );
                        submitData(newTx);
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
