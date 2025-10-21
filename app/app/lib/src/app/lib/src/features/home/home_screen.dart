import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  String _status = 'Tap to fetch AI plan';
  Future<void> _fetchPlan() async {
    setState(() => _status = 'Loading...');
    try {
      // For Android emulator use 10.0.2.2; for real device use your PC LAN IP.
      final uri = Uri.parse('http://10.0.2.2:3000/ai/plan/generate');
      final res = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'goalType': 'fitness'}),
      );
      if (res.statusCode == 200) {
        setState(() => _status = 'Plan loaded!');
      } else {
        setState(() => _status = 'Error ${res.statusCode}');
      }
    } catch (e) {
      setState(() => _status = 'Network error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Today's Win")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(child: ListTile(title: const Text('AI Plan'), subtitle: Text(_status))),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: _fetchPlan, child: const Text('Get Plan')),
          const SizedBox(height: 12),
          const _Card(title: "Next Block", subtitle: "9:30–10:00 Plan review + reflow"),
          const SizedBox(height: 12),
          const _Card(title: "Streaks", subtitle: "Habits: 6 days • Workouts: 3 • Money: 4"),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final String subtitle;
  const _Card({required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(title), subtitle: Text(subtitle)),
    );
  }
}
