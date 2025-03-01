import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('xxx')
          // const _buildGridTileList(1)
          ),
    );
  }

  List<Widget> _buildGridTileList(int count) =>
      List.generate(count, (i) => Image.asset('images/pic$i.jpg'));
}
