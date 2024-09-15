import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile App Development - CW-1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Arial',
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Increment & Toggle Button Actions'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final summer = 'summer', winter = 'winter';
  final summerImg = 'assets/img1.png', winterImg = 'assets/img2.png';
  bool isSummerSeason = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeSeason() {
    setState(() {
      isSummerSeason = !isSummerSeason;
    });
  }

  void _resetState() {
    setState(() {
      _counter = 0;
      isSummerSeason = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        title: Text(widget.title),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200], 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text(
              'Push the button to increment the count:',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.brown, 
                  ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
              ),
              onPressed: _incrementCounter,
              child: Text(
                'Increment',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Column(children: <Widget>[
                    Image.asset(
                      isSummerSeason ? summerImg : winterImg,
                      fit: BoxFit.contain,
                      width: 300,
                    )
                  ]),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
              ),
              onPressed: _changeSeason,
              child: Text(
                'Toggle Image',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
              ),
              onPressed: _resetState,
              child: Text(
                'Reset',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
