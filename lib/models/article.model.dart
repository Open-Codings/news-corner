// ignore_for_file: unnecessary_null_in_if_null_operators

import 'source.model.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] ?? null,
      title: json['title'] ?? null,
      description: json['description'] ?? null,
      url: json['url'] ?? null,
      urlToImage: json['urlToImage'] ?? null,
      publishedAt: json['publishedAt'] ?? null,
      content: json['content'] ?? null,
    );
  }
}
