import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Travel';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(image: 'images/img1.jpg'),
              const TitleSection(
                name: 'น้ำตกห้วยแม่ขมิ้น',
                location: 'ศรีสวัสดิ์ ,กาญจนบุรี ,ประเทศไทย',
              ),
              const ButtonSection(),
              const TextSection(
                  description:
                      'น้ำตกห้วยแม่ขมิ้นตั้งอยู่ในอุทยานแห่งชาติเขื่อนศรีนครินทร์ อำเภอศรีสวัสดิ์ จังหวัดกาญจนบุรี แต่ช่วงที่ดีที่สุด คือ เดือนตุลาคม ถึง เดือนเมษายน ตั้งแต่เวลา เวลา 08.00-17.00 น. '
                      'น้ำตกห้วยแม่ขมิ้น มีความโดดเด่นด้วยแพทเทิร์นน้ำตกที่ไหลเรียงกันเป็นชั้นๆ อย่างสวยงาม ในวันที่อากาศดี น้ำตกจะมีสีเขียวมรกตที่สวยงามและเป็นเอกลักษณ์ น้ำตกนี้มีทั้งหมด 7 ชั้น แต่ละชั้นมีชื่อและลักษณะเฉพาะตัว โดยตั้งแต่ชั้นแรกถึงชั้นที่ 4 มีระยะทาง 300-750 เมตร ส่วนชั้นที่ 5 ขึ้นไปถึงชั้นบนสุดมีระยะทางมากกว่า 1 กิโลเมตร แต่ละชั้นมีความงามและความสูงที่ไม่ซ้ำกัน'),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('50'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
            onTap: () => _launchURL('tel:+66922131159'),
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
            onTap: () =>
                _launchURL('https://maps.app.goo.gl/irbLe4PZFXru83YM7'),
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
            onTap: () => _launchURL(
                'https://www.facebook.com/pages/%E0%B8%AD%E0%B8%B8%E0%B8%97%E0%B8%A2%E0%B8%B2%E0%B8%99%E0%B9%81%E0%B8%AB%E0%B9%88%E0%B8%87%E0%B8%8A%E0%B8%B2%E0%B8%95%E0%B8%B4%20%E0%B9%80%E0%B8%82%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B8%99%E0%B8%A8%E0%B8%A3%E0%B8%B5%E0%B8%99%E0%B8%84%E0%B8%A3%E0%B8%B4%E0%B8%99%E0%B8%97%E0%B8%A3%E0%B9%8C%20(%20%E0%B8%99%E0%B9%89%E0%B8%B3%E0%B8%95%E0%B8%81%E0%B8%AB%E0%B9%89%E0%B8%A7%E0%B8%A2%E0%B9%81%E0%B8%A1%E0%B9%88%E0%B8%82%E0%B8%A1%E0%B8%B4%E0%B9%89%E0%B8%99%20)/141987009246486/'),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ],
        ));
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}
