import 'package:flutter/material.dart';
import 'package:news_app/core/confige/constants.dart';
import 'package:news_app/core/confige/pages_route_name.dart';
import 'package:news_app/main.dart';

class CustomDrawerWidget extends StatelessWidget {
  final Function onDrawerCategoryClicked;

  const CustomDrawerWidget({
    super.key,
    required this.onDrawerCategoryClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.width * 0.8,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: Constants.mediaQuery.width * 0.8,
            height: 160,
            color: Constants.theme.primaryColor,
            child: Text(
              "News App!",
              style: Constants.theme.textTheme.titleLarge,
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerCategoryClicked();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 25.0,
                left: 15,
                right: 15,
                bottom: 5,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.list_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Categories",
                    style: Constants.theme.textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              navigatorKey.currentState!.pushReplacementNamed(
                PagesRouteName.settingsView,
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5,
                left: 15,
                right: 15,
                bottom: 5,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.settings_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Settings",
                    style: Constants.theme.textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
