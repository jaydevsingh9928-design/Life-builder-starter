import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'src/app_shell.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: LifeBuilderApp()));
}

class LifeBuilderApp extends StatelessWidget {
  const LifeBuilderApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Builder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const AppShell(),
    );
  }
}
