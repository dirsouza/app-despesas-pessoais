import 'dart:math';

import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:despesas_pessoais/components/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  final String _locale = 'pt_BR';

  @override
  Widget build(BuildContext context) {
    // Set default language to Portuguese from Brazil
    Intl.defaultLocale = this._locale;
    initializeDateFormatting(this._locale, null);

    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'Test #01',
      value: 100.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Test #02',
      value: 200.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Test #03',
      value: 300.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Test #04',
      value: 400.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Test #06',
      value: 600.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't7',
      title: 'Test #07',
      value: 700.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't8',
      title: 'Test #08',
      value: 800.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't9',
      title: 'Test #09',
      value: 900.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't10',
      title: 'Test #010',
      value: 1000.0,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String title, double value) {
    final Transaction newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    this._closeTransactionFormModal(context);
  }

  void _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(this._addTransaction);
      },
    );
  }

  void _closeTransactionFormModal(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => this._openTransactionFormModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            TransactionList(this._transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => this._openTransactionFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
