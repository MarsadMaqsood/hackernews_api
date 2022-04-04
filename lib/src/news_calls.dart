import 'dart:convert';
import 'package:hackernews_api/helper/enums.dart';
import 'package:http/http.dart' as http;

import '../helper/exception.dart';

class NewsCalls {
  Uri urlForStory(int storyId) {
    return Uri.parse(
        "https://hacker-news.firebaseio.com/v0/item/$storyId.json");
  }

  Uri storyUrl(NewsType newsType) {
    return Uri.parse(newsType == NewsType.topStories
        ? "https://hacker-news.firebaseio.com/v0/topstories.json"
        : "https://hacker-news.firebaseio.com/v0/newstories.json");
  }

  Uri urlForCommentById(int commentId) {
    return Uri.parse(
        "https://hacker-news.firebaseio.com/v0/item/$commentId.json");
  }

  Future<List<http.Response>> _getStories(newsType) async {
    final response = await http.get(storyUrl(newsType));

    if (response.statusCode == 200) {
      Iterable storyIds = jsonDecode(response.body);

      return Future.wait(storyIds.take(30).map((storyId) {
        return _getStory(storyId);
      }));
    } else {
      throw NewsException("Unable to fetch data!");
    }
  }

  Future<http.Response> _getStory(int storyId) {
    return http.get(urlForStory(storyId));
  }
}
