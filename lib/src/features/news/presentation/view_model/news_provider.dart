import 'dart:convert';

import 'package:assignment/src/core/network/endpoints.dart';
import 'package:assignment/src/features/news/data/models/news_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NewsAdp extends ChangeNotifier {
  NewsModel? news;
  String newshttpCode = "";

  resetNews() {
    news = null;
    newshttpCode = "";
  }

  refreshNotifications(String token) {
    resetNews();
    notifyListeners();
    getNews(
    );
  }

  getNews(
  ) async {
    try {
      final url = Endpoints.newsUrl();
      final client = http.Client();
      final response = await client.get(Uri.parse(url), headers: {
        "content-type": "application/json",
        // "Authorization": "Bearer $token",
      });

      newshttpCode = response.statusCode.toString();
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        news = NewsModel.fromJson(parsed);
        notifyListeners();
      } else {
        throw Exception("Unable to load data");
      }
    } catch (e) {
      notifyListeners();
      throw Exception(e);
    }
  }
}