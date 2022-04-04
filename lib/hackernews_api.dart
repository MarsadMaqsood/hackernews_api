library hackernews_api;

import 'dart:convert';

import 'package:hackernews_api/helper/enums.dart';
import 'package:hackernews_api/model/comment.dart';
import 'package:http/http.dart' as http;

import 'helper/constants.dart';
import 'helper/exception.dart';
import 'model/story.dart';

class HackerNews {
  const HackerNews({
    this.newsType = NewsType.topStories,
  });

  final NewsType newsType;

  Future<List<Story>> getStories() async {
    final List<http.Response> responses = await _getStories();

    final List<Story> stories = responses.map((response) {
      final json = jsonDecode(response.body);

      return Story.fromJson(json);
    }).toList();

    return stories;
  }

  Future<List<Comment>> getComments(List<dynamic> kidIds) async {
    final List<http.Response> responses = await _getComments(kidIds);

    final List<Comment> stories = responses.map((response) {
      final json = jsonDecode(response.body);

      return Comment.fromJson(json);
    }).toList();

    return stories;
  }

  Future<List<http.Response>> _getStories() async {
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

  Future<List<http.Response>> _getComments(kidIds) async {
    return Future.wait(kidIds.take(30).map((kidId) {
      return http.get(urlForStory(kidId));
    }));
  }
}
