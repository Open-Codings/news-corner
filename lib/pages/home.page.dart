// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pens_s3_pbo_theory/components/hot_news.components.dart';
import 'package:flutter_pens_s3_pbo_theory/components/news_tile.components.dart';
import 'package:flutter_pens_s3_pbo_theory/models/article.model.dart';
import 'package:flutter_pens_s3_pbo_theory/models/news.model.dart';
import 'package:flutter_pens_s3_pbo_theory/services/api.service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Api client = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          "assets/images/logo.png",
          width: 45,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 255, 82, 3),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Color.fromARGB(255, 255, 82, 3),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hot News",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 82, 3),
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: client.getTopArticle(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Article>> snapshot) {
                  if (snapshot.hasData) {
                    List<Article>? articles = snapshot.data;
                    return CarouselSlider.builder(
                      itemCount: NewsData.breakingNewsData.length,
                      itemBuilder: (context, index, id) =>
                          HotNews(articles![index]),
                      options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          enableInfiniteScroll: false,
                          height: 300),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 255, 82, 3),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "News Update",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 82, 3),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              FutureBuilder(
                future: client.getUniversalArticle(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Article>> snapshot) {
                  if (snapshot.hasData) {
                    List<Article>? articles = snapshot.data;
                    return Column(
                      children: articles!.map((e) => NewsTile(e)).toList(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 255, 82, 3),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
