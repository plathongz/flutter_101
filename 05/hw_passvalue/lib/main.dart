import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       title: 'Named Routes Demo',
//       // Start the app with the "/" named route. In this case, the app starts
//       // on the FirstScreen widget.
//       initialRoute: '/',
//       routes: {
//         // When navigating to the "/" route, build the FirstScreen widget.
//         '/': (context) => const FirstScreen(),
//         // When navigating to the "/second" route, build the SecondScreen widget.
//         '/second': (context) => const SecondScreen(),
//       },
//     ),
//   );
// }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondScreen(),
      },
      // Provide a function to handle named routes.
      // Use this function to identify the named
      // route being pushed, and create the correct
      // Screen.
      title: 'Navigation with Arguments',
      // home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop.
  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.pushNamed(context, '/second');
    // final result = await Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const SecondScreen()),
    // );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!context.mounted) return;

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Three word App'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          // Within the `FirstScreen` widget
          onPressed: () {
            // Navigate to the second screen using a named route.
            // Navigator.pushNamed(context, '/second');
            _navigateAndDisplaySelection(context);
          },
          child: const Text('Give me there words!'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose(); // ล้างหน่วยความจำเมื่อไม่ใช้
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Text'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // key: _formKey,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: TextFormField(
                  controller: myController,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Enter your text',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ElevatedButton(
                  // Within the SecondScreen widget
                  onPressed: () {
                    // Navigate back to the first screen by popping the current route
                    // off the stack.

                    // print($inputText)
                    Navigator.pop(context, myController.text);
                  },
                  child: const Text('Submit!'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
