import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this._userTransactions, this._deleteTransaction);

  final Function _deleteTransaction;
  final List<Transaction> _userTransactions;

  @override
  Widget build(BuildContext context) {
    return _userTransactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No Transaction added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: constraints.maxHeight * 0.5,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: _userTransactions.length,
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  transaction: _userTransactions[index],
                  deleteTransaction: _deleteTransaction);
            },
          );
  }
}
