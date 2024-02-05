import 'package:webfeed/webfeed.dart';
import 'package:geek_gather/src/models/GetRSS.dart';

class ExtractRSS {
  Future<List<RssItem>> extract() async {
    List<String> rawFeeds = await GetRSS().fetch();
    List<RssItem> items = [];
    for (String rawFeed in rawFeeds) {
      final RssFeed feed = RssFeed.parse(rawFeed);
      Iterator<RssItem> iterator = feed.items!.iterator;
      while (iterator.moveNext()) {
        items.add(iterator.current);
      }
    }
    // DEBUG
    print(items.length);
    return items;
  }
}
