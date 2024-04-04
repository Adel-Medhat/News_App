import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

class Constants {
  static var mediaQuery =
      MediaQuery.of(navigatorKey.currentState!.context).size;

  static var theme = Theme.of(navigatorKey.currentState!.context);

  static const String apiKey = "41dc5a097efa4f5988a20b4fa51be2f3";
  static const String baseUrl = "newsapi.org";
}