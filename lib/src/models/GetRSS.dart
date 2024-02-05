import 'package:http/http.dart' as http;

class GetRSS {
  List<String> targetURL = [
    'http://zenn.dev/feed',
    // 'https://qiita.com/popular-items/feed'
  ];
  Future<List<String>> fetch() async {
    List<String> articles = [];
    for (String url in targetURL) {
      final response = await http.get(Uri.parse(url));
      // DEBUG
      print('fetch: $url');
      if (response.statusCode == 200) {
        final rawFeed = response.body;
        articles.add(rawFeed);
      } else {
        throw Exception('Failed to load feed');
      }
    }
    return articles;
  }
}
