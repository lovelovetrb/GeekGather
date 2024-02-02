import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              for (var i = 0; i < 10; i++) ArticleCard(),
            ],
          ),
        ),
      );
    });
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImageProvider imageProvider = NetworkImage(
        'https://res.cloudinary.com/zenn/image/upload/s--9JZz78dr--/c_fit%2Cg_north_west%2Cl_text:notosansjp-medium.otf_55:%25E3%2580%2590DeepL%2520API%25E3%2580%2591DeepL%2520API%25E3%2582%2592%25E5%258F%2596%25E5%25BE%2597%25E3%2581%2599%25E3%2582%258B%25E6%2589%258B%25E9%25A0%2586%2Cw_1010%2Cx_90%2Cy_100/g_south_west%2Cl_text:notosansjp-medium.otf_37:%25E3%2582%25A8%25E3%2582%25A4%25E3%2583%2588%2Cx_203%2Cy_121/g_south_west%2Ch_90%2Cl_fetch:aHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29tL3plbm4tdXNlci11cGxvYWQvYXZhdGFyL2E1ZTg3MmJkZDUuanBlZw==%2Cr_max%2Cw_90%2Cx_87%2Cy_95/v1627283836/default/og-base-w1200-v2.png');
    String title = 'タイトル';
    String auther = '著者';
    String url = 'https://zenn.dev/';

    return Card(
      // 角丸
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(auther),
                  // TODO: URLごとにfaviconを表示したい
                  Text(url, style: TextStyle(color: Colors.grey[700]))
                ],
              ),
            ),
          ),
          Image(
            image: imageProvider,
            fit: BoxFit.cover,
            height: 80,
          ),
        ],
      ),
    );
  }
}
