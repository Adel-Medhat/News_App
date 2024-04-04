import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/pages/home/widgets/articles_list_widget.dart';
import 'package:news_app/pages/home/widgets/tab_item_widget.dart';

class NewsListWidget extends StatefulWidget {
  final List<SourceModel> sourcesList;

  const NewsListWidget({
    super.key,
    required this.sourcesList,
  });

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          initialIndex: selectedIndex,
          length: widget.sourcesList.length,
          child: TabBar(
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            labelPadding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            dividerColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            indicator: BoxDecoration(),
            isScrollable: true,
            tabs: widget.sourcesList
                .map(
                  (e) => TabItemWidget(
                    sourceModel: e,
                    isSelected: selectedIndex == widget.sourcesList.indexOf(e),
                  ),
                )
                .toList(),
          ),
        ),
        ArticlesListWidget(
          sourceId: widget.sourcesList[selectedIndex].id,
        ),
      ],
    );
  }
}
