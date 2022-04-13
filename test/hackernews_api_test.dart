import 'package:flutter_test/flutter_test.dart';
import 'package:hackernews_api/hackernews_api.dart';

void main() {
  test('News Fetching Test', () async {
    HackerNews news = HackerNews(
      newsType: NewsType.newStories,
    );
    List<Story> story = await news.getStories();

    List<Comment> comment = await news.getComments(story[0].kids);

    print(comment.length);
  });

  test('News Ids Fetching Test', () async {
    HackerNews news = HackerNews(
      newsType: NewsType.newStories,
    );

    final result = await news.getStoryIds();

    print(result[0]);
  });

  test('News Story Fetching using ID Test', () async {
    HackerNews news = HackerNews(
      newsType: NewsType.newStories,
    );

    final storyIds = await news.getStoryIds();

    final newsData = await news.getStory(storyIds[0]);

    print(newsData.title);
  });
}
