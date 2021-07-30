import 'package:flutter/material.dart';

class UserTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
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
                      onPressed: () {},
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
