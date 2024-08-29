
import 'package:flutter/material.dart';
import '../Models/newsListData.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Article> _favorites = [];

  List<Article> get favorites => _favorites;

  void addFavorite(Article article) {
    _favorites.add(article);
    notifyListeners();
  }

  void removeFavorite(Article article) {
    _favorites.remove(article);
    notifyListeners();
  }

  bool isFavorite(Article article) {
    return _favorites.contains(article);
  }
}
