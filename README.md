[![Version](https://img.shields.io/pub/v/hackernews_api?color=%2354C92F&logo=dart)](https://pub.dev/packages/hackernews_api/install)

A Flutter package for accessing Hacker News API

## ⭐ Installing
```
dependencies:
    updater: ^0.0.1
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
```

## 📙 How To Use

```dart
HackerNews news = HackerNews(
    newsType: NewsType.newStories,
);
    
List<Story> story = await news.getStories();
```
