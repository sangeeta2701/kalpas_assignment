// To parse this JSON data, do
//
//     final newsListData = newsListDataFromJson(jsonString);

import 'dart:convert';

NewsListData newsListDataFromJson(String str) => NewsListData.fromJson(json.decode(str));

String newsListDataToJson(NewsListData data) => json.encode(data.toJson());

class NewsListData {
    String status;
    int totalResults;
    List<Article> articles;

    NewsListData({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory NewsListData.fromJson(Map<String, dynamic> json) => NewsListData(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

// class Article {
//     Source source;
//     String? author;
//     String title;
//     String description;
//     String url;
//     String? urlToImage;
//     DateTime publishedAt;
//     String content;

//     Article({
//         required this.source,
//         required this.author,
//         required this.title,
//         required this.description,
//         required this.url,
//         required this.urlToImage,
//         required this.publishedAt,
//         required this.content,
//     });

//     factory Article.fromJson(Map<String, dynamic> json) => Article(
//         source: Source.fromJson(json["source"]),
//         author: json["author"],
//         title: json["title"],
//         description: json["description"],
//         url: json["url"],
//         urlToImage: json["urlToImage"],
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         content: json["content"],
//     );

//     Map<String, dynamic> toJson() => {
//         "source": source.toJson(),
//         "author": author,
//         "title": title,
//         "description": description,
//         "url": url,
//         "urlToImage": urlToImage,
//         "publishedAt": publishedAt.toIso8601String(),
//         "content": content,
//     };
// }

class Article {
  Source source;
  String? author;
  String? title; // Made nullable
  String? description; // Made nullable
  String? url; // Made nullable
  String? urlToImage; // Made nullable
  DateTime? publishedAt; // Made nullable
  String? content; // Made nullable

  Article({
    required this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] as String?,
        title: json["title"] ?? "No Title", 
        description: json["description"] ?? "No Description", 
        url: json["url"] ?? "", 
        urlToImage: json["urlToImage"] as String?, 
        publishedAt: json["publishedAt"] != null ? DateTime.parse(json["publishedAt"]) : null, 
        content: json["content"] ?? "No Content", 
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };
}


class Source {
    String? id;
    String name;

    Source({
        required this.id,
        required this.name,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
