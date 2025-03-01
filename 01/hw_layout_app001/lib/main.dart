import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'สถานที่ชอบ';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const SingleChildScrollView(
            child: Column(
          children: [
            ImageSection(
              image: 'images/KoKut1.jpg',
            ),
            TitleSection(
              name: 'เกาะกูด',
              location: 'จังหวัดตราด, ประเทศไทย',
            ),
            ButtonSection(),
            TextSection(
              description:
                  'เกาะกูด เป็นเกาะที่มีขนาดใหญ่เป็นอันดับ 6 ของประเทศไทย รองจากเกาะภูเก็ต เกาะสมุย เกาะช้าง เกาะตะรุเตา และเกาะพะงัน ตั้งอยู่ในอ่าวไทย เป็นเกาะสุดท้ายแห่งน่านน้ำตะวันออกไทย อยู่ในการบริหารขององค์การบริหารส่วนตำบลเกาะกูด ส่วนหนึ่งของอำเภอเกาะกูดในจังหวัดตราด'
                  'เกาะกูดมีเนื้อที่ 105 ตารางกิโลเมตรหรือประมาณ 65,625 ไร่ ความยาวของเกาะ 25 กิโลเมตร ความกว้าง 12 กิโลเมตร เกาะยังมีสภาพความเป็นธรรมชาติอย่างสมบูรณ์ โดยมีภูเขาและที่ราบสันเขาซึ่งเป็นต้นกำเนิดลำธาร ทำให้เกาะกูดมีน้ำตกที่ขึ้นชื่อคือ น้ำตกคลองเจ้า ที่มีน้ำไหลตลอดทั้งปี ทางฝั่งตะวันตกของเกาะ นับตั้งแต่อ่าวยายกี๋ หาดคลองเจ้า หาดอ่าวพร้าว อ่าวง่ามโข่ หาดอ่าวเบ้า หาดคลองหิน อ่าวพร้าวจนสุดปลายแหลมเทียน นอกจากนี้บนเกาะกูดยังมีป่าชายเลนที่สมบูรณ์และแนวปะการังหลากชนิด ภูมิประเทศเป็นภูเขาแทบทั้งเกาะ มียอดสูง 315 เมตร',
            ),
          ],
        )),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
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
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text(
            '41',
          ),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(color: color, icon: Icons.call, label: 'CALL'),
          ButtonWithText(color: color, icon: Icons.near_me, label: 'ROUTE'),
          ButtonWithText(color: color, icon: Icons.share, label: 'SHARE'),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
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
