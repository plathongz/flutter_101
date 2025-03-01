import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = "Flutter form demo";
    return MaterialApp(title: appTitle, home: const MyCustomForm());
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
    myFocusNode = FocusNode();
    myController.addListener(_printLastestValue);
  }

  @override
  void dispose() {
    myController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  void _printLastestValue() {
    final text = myController.text;
    print('Second text field: $text (${text.characters.length})');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrieve Text Input demo"),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (text) {
                  print('First text field: $text (${text.characters.length})');
                },
              )),
          Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: myController,
              )),
          Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                focusNode: myFocusNode,
                onChanged: (text) {
                  print('Third text field: $text (${text.characters.length})');
                },
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myFocusNode.requestFocus();
        },
        tooltip: "On text",
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}

// class MyCustomForm extends StatefulWidget {
//   const MyCustomForm({super.key});

//   @override
//   State<MyCustomForm> createState() => _MyCustomFormState();
// }

// class _MyCustomFormState extends State<MyCustomForm> {
//   final _formKey = GlobalKey<FormState>();
//   final emailRegex = RegExp(
//       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextFormField(
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter you mobile phone number",
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return "Please enter some text";
//                 } else if (!emailRegex.hasMatch(value)) {
//                   return "Please enter well-formed email address";
//                 } else if (value.length != 10) {
//                   return "Please enter valie mobile number";
//                 }
//                 return null;
//               }),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             child: ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Processing Data")),
//                     );
//                   }
//                 },
//                 child: const Text("Submit")),
//           ),
//         ],
//       ),
//     );
//   }
// }
