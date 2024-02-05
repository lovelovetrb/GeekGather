import 'package:flutter/material.dart';
import 'package:geek_gather/src/ui/top/view_model/ExtractRSS.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: FutureBuilder(
          future: ExtractRSS().extract(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return _ArticleCard(rssFeed: snapshot.data[index]);
              },
            );
          },
        ),
      );
    });
  }
}

class _ArticleCard extends StatelessWidget {
  final RssItem rssFeed;
  const _ArticleCard({Key? key, required this.rssFeed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(rssFeed.link ?? '');
    final auther = rssFeed.dc?.creator ?? rssFeed.author ?? '';
    return GestureDetector(
      onTap: () {
        launchUrl(uri);
      },
      child: Card(
        // 角丸
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rssFeed.title ?? ''),
                      Text('by ${auther}'),
                      // TODO: URLごとにfaviconを表示したい
                      Text(uri.host, style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                ),
              ),
              Image(
                image: NetworkImage(rssFeed.enclosure?.url ?? ''),
                fit: BoxFit.cover,
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
