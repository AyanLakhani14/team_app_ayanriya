import 'dart:math';
import 'package:flutter/material.dart';

// Entry point
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
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
  // -------- Round 1: Motivational Quotes --------
  final List<String> quotes = [
    "Stay hungry. Stay foolish.",
    "Code. Test. Improve. Repeat.",
    "Small steps every day.",
    "Discipline beats motivation.",
    "Build first. Perfect later.",
  ];

  final Random _rng = Random();
  String currentQuote = "";

  // -------- Round 2: Text Input --------
  final TextEditingController _textController = TextEditingController();
  String _enteredText = "";

  @override
  void initState() {
    super.initState();
    currentQuote = quotes.isNotEmpty ? quotes[0] : "";
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void pickRandomQuote() {
    if (quotes.isEmpty) return;

    setState(() {
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),

              // Header
              const Text(
                'Hello, Flutter!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const Text(
                'This is my first modification.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 20),

              // -------- Motivational Quotes --------
              Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    currentQuote,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: pickRandomQuote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text('New Quote'),
              ),

              const SizedBox(height: 20),

              // -------- Icon Gallery --------
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

              const SizedBox(height: 30),

              // -------- Text Input Field --------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'Enter text',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _enteredText = value;
                    });
                  },
                ),
              ),

              const SizedBox(height: 10),

              Text(
                _enteredText.isEmpty
                    ? "You haven't typed anything yet."
                    : "You typed: $_enteredText",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              // Footer
              const Text(
                'Created by: Ayan Lakhani',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

