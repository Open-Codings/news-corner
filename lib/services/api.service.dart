import 'dart:convert';

import 'package:http/http.dart';

import '../models/article.model.dart';

class Api {
  final apiKey = "028e7fcb88eb457e98bf378649cd52e5";
  final topUrl = "https://newsapi.org/v2/top-headlines?country=id&apiKey=";
  final universalUrl = "https://newsapi.org/v2/everything?q=linux&apiKey=";

  Future<List<Article>> getTopArticle() async {
    String url = topUrl + apiKey;
    Response res = await get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("[failed]: can not fetch the data");
    }
  }

  Future<List<Article>> getUniversalArticle() async {
    String url = universalUrl + apiKey;
    Response res = await get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("[failed]: can not fetch the data");
    }
  }
}
