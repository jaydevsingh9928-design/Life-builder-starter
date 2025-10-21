import 'package:flutter/material.dart';

class PlannerScreen extends StatelessWidget {
  const PlannerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Planner')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            title: Text('9:00–9:30 Review plan'),
            subtitle: Text('Auto-reflow enabled • Priority 1'),
          ),
          ListTile(
            title: Text('19:30–20:30 Push Day'),
            subtitle: Text('Volume: reduced • Deload suggested'),
          ),
        ],
      ),
    );
  }
}
