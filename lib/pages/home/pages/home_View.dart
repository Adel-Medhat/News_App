import 'package:flutter/material.dart';
import 'package:news_app/core/confige/constants.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/main.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/home/pages/category_view.dart';
import 'package:news_app/pages/home/widgets/custom_drawer_widget.dart';
import 'package:news_app/pages/home/widgets/custom_item_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CategoryModel> categoriesList = [
    CategoryModel(
      id: "sports",
      title: "Sports",
      image: "assets/images/sports_icn.png",
      backgroundColor: const Color(0xffC91C22),
    ),
    CategoryModel(
      id: "general",
      title: "Politics",
      image: "assets/images/Politics_icn.png",
      backgroundColor: const Color(0xff003E90),
    ),
    CategoryModel(
      id: "health",
      title: "Health",
      image: "assets/images/health_icn.png",
      backgroundColor: const Color(0xffED1E79),
    ),
    CategoryModel(
      id: "bussines",
      title: "Bussines",
      image: "assets/images/bussines_icn.png",
      backgroundColor: const Color(0xffCF7E48),
    ),
    CategoryModel(
      id: "environment",
      title: "Environment",
      image: "assets/images/environment_icn.png",
      backgroundColor: const Color(0xff4882CF),
    ),
    CategoryModel(
      id: "science",
      title: "Science",
      image: "assets/images/science_icn.png",
      backgroundColor: const Color(0xffF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          title: Text(
            selectedCategory == null ? "News App" : selectedCategory!.title,
            style: Constants.theme.textTheme.titleLarge,
          ),
        ),
        drawer: CustomDrawerWidget(
          onDrawerCategoryClicked: onDrawerCategoryClicked,
        ),
        body: selectedCategory == null
            ? Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Pick your category \nof interest",
                      style: Constants.theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff4F5A69),
                        height: 1.2,
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 4 / 5,
                        ),
                        itemBuilder: (context, index) => CustomItemWidget(
                          index: index,
                          categoryModel: categoriesList[index],
                          onCategoryClicked: onCategoryClicked,
                        ),
                        itemCount: 6,
                      ),
                    )
                  ],
                ),
              )
            : CategoryView(categoryModel: selectedCategory!),
      ),
    );
  }

  CategoryModel? selectedCategory;

  void onCategoryClicked(CategoryModel categoryModel) {
    selectedCategory = categoryModel;
    setState(() {});
  }

  void onDrawerCategoryClicked() {
    selectedCategory = null;
    setState(() {});
    navigatorKey.currentState!.pop();
  }
}
