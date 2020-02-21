import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubimit;

  TransactionForm(this.onSubimit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  void _submitForm() {
    final title = this.titleController.text;
    final value = double.tryParse(this.valueController.text) ?? 0;

    if (title.isEmpty || value < 0) return;

    this.widget.onSubimit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: this.titleController,
              onSubmitted: (_) => this._submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: this.valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => this._submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () => this._submitForm(),
                  textColor: Colors.purple,
                  child: Text('Nova Transação'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
