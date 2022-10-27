[![Version](https://img.shields.io/pub/v/hackernews_api?color=%2354C92F&logo=dart)](https://pub.dev/packages/hackernews_api/install) [![Tag](https://img.shields.io/badge/Flutter-Hacker%20News-%23212C39)](https://github.com/MarsadMaqsood/hackernews_api)

A Flutter package of Hacker News API for accessing top and new stories.

## ⭐ Installing
```
dependencies:
    updater: ^0.0.6
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

## Properties

| | Type | Story |  Poll | Comment |
| --- | --- | --- | --- | --- |
|id | `int` | ✅ | ✅ | ✅ |
|text | `String` | ❌ | ✅ | ✅ |
|title | `String` | ✅ | ✅ | ❌ |
|parent | `int` | ❌ | ✅ | ✅ |
|deleted | `bool` | ✅| ✅ | ✅ |
|type | `String` | ✅| ✅ | ✅ |
|by | `String` | ✅ | ✅ | ✅ |
|time | `int` | ✅ | ✅ | ✅ |
|kids | `List<int>` | ✅| ✅ | ❌ |
|dead | `bool` | ✅ | ✅ | ✅ |
|descendants | `int` | ✅ | ✅ | ❌ |
|score | `int` | ✅ | ✅ | ✅ |
|url | `String` | ✅ | ❌ | ❌ |
|parts | `int` | ❌ | ✅ | ❌ |


## 📙 How To Use

```dart
HackerNews news = HackerNews(
    newsType: NewsType.newStories,
);

//get stories
List<Story> story = await news.getStories();

//get List of story ids
final storyIds = await news.getStoryIds();

//get story data
final story = await news.getStory(storyIds[0]);
```
