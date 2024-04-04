import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/confige/constants.dart';
import 'package:news_app/models/ArticlesDataModel.dart';

class ArticleItemWidget extends StatelessWidget {
  final Articles articles;

  const ArticleItemWidget({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              imageUrl: articles.urlToImage ?? "",
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.grey,
                size: 35,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              textAlign: TextAlign.start,
              articles.source?.name ?? "",
              style: Constants.theme.textTheme.bodyMedium?.copyWith(
                color: const Color(0xff79828B),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              textAlign: TextAlign.start,
              articles.title ?? "",
              style: Constants.theme.textTheme.bodyLarge?.copyWith(
                color: Colors.black,
                height: 1.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: Text(
              textAlign: TextAlign.end,
              articles.publishedAt ?? "",
              style: Constants.theme.textTheme.bodyMedium?.copyWith(
                color: const Color(0xff79828B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
