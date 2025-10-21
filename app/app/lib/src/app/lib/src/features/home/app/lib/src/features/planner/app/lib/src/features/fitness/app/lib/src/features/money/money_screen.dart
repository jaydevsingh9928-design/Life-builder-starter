import 'package:flutter/material.dart';

class MoneyScreen extends StatelessWidget {
  const MoneyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Money')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text('Monthly Target'), subtitle: Text('₹15,000 • 42% achieved')),
          ListTile(title: Text('Pipeline Sprint'), subtitle: Text('3 leads to contact • 20 min')),
        ],
      ),
    );
  }
}
