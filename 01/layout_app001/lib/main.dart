import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter layout demo01',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'flutter layout demo02',
          ),
        ),
        // body: Center(child: AppText()),
        body: Center(child: _buildList()),
      ),
    );
  }
}

Widget _buildList() {
  return ListView(
    children: [
      _tile('111111', '222222222', Icons.theaters),
      _tile('222222', '222222222', Icons.restaurant),
      _tile('33333333', '222222222', Icons.theaters),
      _tile('111111', '222222222', Icons.theaters),
      _tile('222222', '222222222', Icons.restaurant),
    ],
  );
}

ListTile _tile(String title, String subtitle, IconData icon) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    ),
    subtitle: Text(
      subtitle,
      style: TextStyle(fontSize: 14),
    ),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );
}

Widget _buildStack() {
  return ListView(
    children: [
      _tile('111111', '222222222', Icons.theaters),
      _tile('222222', '222222222', Icons.restaurant),
      _tile('33333333', '222222222', Icons.theaters),
      _tile('111111', '222222222', Icons.theaters),
      _tile('222222', '222222222', Icons.restaurant),
      _tile('33333333', '222222222', Icons.theaters),
      _tile('111111', '222222222', Icons.theaters),
      _tile('222222', '222222222', Icons.restaurant),
      _tile('33333333', '222222222', Icons.theaters),
      _tile('111111', '222222222', Icons.theaters),
      _tile('222222', '222222222', Icons.restaurant),
      _tile('33333333', '222222222', Icons.theaters),
      _tile('111111', '222222222', Icons.theaters),
      _tile('222222', '222222222', Icons.restaurant),
      _tile('33333333', '222222222', Icons.theaters),
      _tile('111111', '222222222', Icons.theaters),
      _tile('222222', '222222222', Icons.restaurant),
      _tile('33333333', '222222222', Icons.theaters),
      _tile('111111', '222222222', Icons.theaters),
      _tile('222222', '222222222', Icons.restaurant),
      _tile('33333333', '222222222', Icons.theaters),
      _tile('111111', '222222222', Icons.theaters),
      _tile('222222', '222222222', Icons.restaurant),
      _tile('33333333', '222222222', Icons.theaters),
      _tile('111111', '222222222', Icons.theaters),
      _tile('222222', '222222222', Icons.restaurant),
      _tile('33333333', '222222222', Icons.theaters),
    ],
  );
}

Widget _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(30),
    );

List<Widget> _buildGridTileList(int count) =>
    List.generate(count, (i) => Image.asset('images/pic$i.jpg'));

Widget buildRow() => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: const Color.fromARGB(255, 255, 200, 0),
        ),
        Icon(
          Icons.star,
          color: const Color.fromARGB(255, 255, 140, 0),
        ),
        Icon(
          Icons.star,
          color: const Color.fromARGB(255, 0, 201, 47),
        ),
      ],
    );

Widget AppText() => Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildRow(),
          Container(
            width: 20,
          ),
          const Text('170 Reviews'),
        ],
      ),
    );

Widget _buildImageColumn() {
  return Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(
        children: [
          _buildImageRow(1),
          _buildImageRow(3),
        ],
      ));
}

Widget _buildImageRow(int count) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    _buildDecoratedImage(count),
    _buildDecoratedImage(count + 1),
  ]);
}

Widget _buildDecoratedImage(int count) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(width: 10, color: Colors.black38),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    margin: const EdgeInsets.all(4),
    child: Expanded(child: Image.asset('images/pic$count.jpg')),
  );
}
