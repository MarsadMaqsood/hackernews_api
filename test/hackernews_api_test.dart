import 'package:flutter_test/flutter_test.dart';
import 'package:hackernews_api/hackernews_api.dart';
import 'package:hackernews_api/model/comment.dart';
import 'package:hackernews_api/model/story.dart';

void main() {
  test('News Fetching Test', () async {
    HackerNews news = const HackerNews();
    List<Story> story = await news.getStories();

    List<Comment> comment = await news.getComments(story[0].kids);

    print(comment[0].text);
  });
}
