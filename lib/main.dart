import 'dart:math';
import 'package:flutter/material.dart';

// The main entry point of the app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> quotes = [
    "Stay hungry. Stay foolish.",
    "Code. Test. Improve. Repeat.",
    "Small steps every day.",
    "Discipline beats motivation.",
    "Build first. Perfect later.",
  ];

  final Random _rng = Random();
  String currentQuote = "";

  @override
  void initState() {
    super.initState();
    currentQuote = quotes.isNotEmpty ? quotes[0] : "";
  }

  void pickRandomQuote() {
    if (quotes.isEmpty) return;

    setState(() {
      if (quotes.length == 1) {
        currentQuote = quotes[0];
        return;
      }

      String next;
      do {
        next = quotes[_rng.nextInt(quotes.length)];
      } while (next == currentQuote);

      currentQuote = next;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Class'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'This is my first modification.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Motivational Quotes (below main text)
            Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  currentQuote.isEmpty ? "No quotes yet." : currentQuote,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Styled button + rotates quotes
            ElevatedButton(
              onPressed: pickRandomQuote,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text('New Quote'),
            ),

            // Icon Gallery (Row of 4–5 icons)
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.sports_soccer, size: 32),
                Icon(Icons.music_note, size: 32),
                Icon(Icons.code, size: 32),
                Icon(Icons.flight, size: 32),
                Icon(Icons.fitness_center, size: 32),
              ],
            ),

            const SizedBox(height: 12),

            // Signature line
            const Text(
              'Created by: Ayan Lakhani',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
