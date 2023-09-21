import 'package:expenses_track/models/expense.dart';
import 'package:expenses_track/widgets/expenses-list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});

  final void Function(Expense expense) removeExpense;

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.8),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          removeExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
