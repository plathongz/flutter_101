import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Flutter Form demo';
    const appBar = 'Flutter Form validation demo';
    return MaterialApp(
      title: appTitle,
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    final text = myController.text;
    print('Seconde text feild: $text ($text.characters.lenght)');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text input demo'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (text) {
                print('First text feild: $text ($text.characters.lenght)');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: myController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              focusNode: myFocusNode,
              onChanged: (text) {
                print('Third text feild: $text ($text.characters.lenght)');
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myFocusNode.requestFocus();
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       content: Text(myController.text),
          //     );
          //   },
          // );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}

// TextFormField
// class MyCustomForm extends StatefulWidget {
//   const MyCustomForm({super.key});

//   @override
//   State<MyCustomForm> createState() => _MyCustomFormState();
// }

// class _MyCustomFormState extends State<MyCustomForm> {
//   final _formKey = GlobalKey<FormState>();
//   final emailRegex = RegExp(
//       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//   final telNoRegex = RegExp(r"^[0-9]");

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextFormField(
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter your mobileNo.',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   } else if (value.length < 6) {
//                     return 'Please enter more than 6 characters';
//                   } else if (value.length > 10) {
//                     return 'Please enter less than 10 characters';
//                   } /* else if (!emailRegex.hasMatch(value)) {
//                 return 'Please enter well formed email';
//               } */
//                   else if (!telNoRegex.hasMatch(value)) {
//                     return 'Please enter valid mpobile number';
//                   }
//                   return null;
//                 }),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             child: ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Processing Data')),
//                   );
//                 }
//               },
//               child: const Text('Submit'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
