import 'package:expense/models/transaction.dart';
import 'package:expense/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addFn;
  final int transactionCount;

  NewTransaction(this.addFn, this.transactionCount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          child: Card(
            color: Colors.cyanAccent,
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
                    ),
                    TextButton(
                      onPressed: () {
                        final newTx = Transaction.name(
                          transactionCount+1,
                          titleController.text,
                          double.parse(amountController.text),
                          DateTime.now(),
                        );
                        addFn(newTx);
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
