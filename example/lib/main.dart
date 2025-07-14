import 'package:flutter/material.dart';
import 'package:flutter_quick_nav/flutter_quick_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_quick_nav Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
          headlineSmall: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🏠 Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            FlutterQuickNav.push(context, const SecondPage());
          },
          icon: const Icon(Icons.arrow_forward_rounded),
          label: const Text('Go to Second Page'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🧭 Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                FlutterQuickNav.replace(context, const FinalPage());
              },
              icon: const Icon(Icons.auto_awesome),
              label: const Text('Replace with Final Page'),
              style: _buttonStyle(),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                FlutterQuickNav.pushAndRemoveUntil(
                  context,
                  const HomePage(),
                  untilRoute: '/home',
                );
              },
              icon: const Icon(Icons.home_rounded),
              label: const Text('Reset to Home'),
              style: _buttonStyle(background: Colors.green),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle({Color background = Colors.deepPurple}) {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      backgroundColor: background,
      foregroundColor: Colors.white,
    );
  }
}

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎯 Final Page'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          '🎉 You made it to the final page!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
