import 'package:flutter/material.dart';

// void main() {
//   runApp(const MainApp());
// }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle1 = 'Flutter layout demo 1';
    const String appTitle2 = 'Flutter layout demo 2';
    return MaterialApp(
      title: appTitle1,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle2),
        ),
        body: const SingleChildScrollView(
            child: Column(
          children: [
            ImageSection(
              image: 'images/lake.jpg',
            ),
            TitleSection(
              name: 'Lake',
              location: 'Switzerland',
            ),
            // ButtonSection(),
            // TextSection(
            //     description: '111111111111111111111111 1av1s1vs1v1s11AV11V',
            //     '111111111111111111111111 1av1s1vs1v1s11AV11V',
            //     '111111111111111111111111 1av1s1vs1v1s11AV11V'),
          ],
        )),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500]))
              ],
            ),
          ),
          // Icon(
          //   Icons.star,
          //   color: Colors.red[500],
          // ),
          // const Text('41'),
          const FavoriteWidget(),
        ],
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
