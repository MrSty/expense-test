import 'package:expenses_track/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense(this.addExpense, {super.key});

  final Function(Expense expense) addExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  String? _date;
  DateTime? _dateSecure;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _dateSecure = pickedDate;
      _date = formatter.format(pickedDate!);
    });
  }

  void _submitData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amuountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amuountIsInvalid ||
        _date == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content:
              const Text('Please make sure you don\'t let any blank space'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Ok'),
            )
          ],
        ),
      );
      return;
    }

    widget.addExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _dateSecure!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      child: Column(
        children: [
          TextField(
            style: Theme.of(context).textTheme.bodyMedium,
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 17,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_date == null ? 'No selected date' : _date!),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: const Row(
                  children: [
                    Text('Save Expense'),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(Icons.save_alt_rounded)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
