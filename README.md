[![Version](https://img.shields.io/pub/v/hackernews_api?color=%2354C92F&logo=dart)](https://pub.dev/packages/hackernews_api/install)

A Flutter package of Hacker News API for accessing top and new stories.

## ⭐ Installing
```
dependencies:
    updater: ^0.0.4
```

## ⚡ Import 
```
import 'package:hackernews_api/hackernews_api.dart';
```

## Properties

```dart
newsType → NewsType
```

## NewsType
```dart
NewsType.topStories
NewsType.newStories
NewsType.askStories
NewsType.showStories
NewsType.jobStories
```

## 📙 How To Use

```dart
HackerNews news = HackerNews(
    newsType: NewsType.newStories,
);

//get stories
List<Story> story = await news.getStories();

//get List of story ids
final storyIds = await news.getStoryIds();


final newsData = await news.getStory(storyIds[0]);

```
