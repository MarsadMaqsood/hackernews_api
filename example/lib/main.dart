import 'package:flutter/material.dart';
import 'package:hackernews_api/hackernews_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HackerNews news = HackerNews(
    newsType: NewsType.newStories,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hacker News Example'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          FutureBuilder(
              future: news.getStories(),
              builder: (context, AsyncSnapshot<List<Story>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) return Text(snapshot.error.toString());
                if (!snapshot.hasData) return const Text('No Data');

                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data![index];
                      var title = data.title;

                      return Container(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title),
                            const Divider(),
                          ],
                        ),
                      );
                    },
                  ),
                );
              })
        ],
      )),
    );
  }
}
