import 'package:buga_customer/component/colors.dart';
import 'package:buga_customer/component/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  // appbar color
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: const AppBarTheme(elevation: 0),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColor.black,
        selectionColor: AppColor.primaryColor,
      ),
      hintColor: AppColor.darkGrey,
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: style.copyWith(
          color: AppColor.grey,
          fontSize: 12,
        ),
      ),
      textTheme: TextTheme(headline6: style),
    );
  }

  // first overwrite to clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(
          Icons.clear_rounded,
          color: AppColor.primaryColor,
        ),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back,
        color: AppColor.primaryColor,
      ),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    //var provider = Provider.of<UserData>(context);

    return Container(
      color: AppColor.lightGrey,
      child: Builder(
        builder: (context) {
          return MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 5),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  color: AppColor.white,
                );

                // FeedCard(
                //   context: context,
                //   index: index,
                //   post: post,
                // );
              },
            ),
          );
        },
      ),
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: AppColor.lightGrey,
      child: Builder(
        builder: (context) {
          return MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 5),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  color: AppColor.white,
                );

                // FeedCard(
                //   context: context,
                //   index: index,
                //   post: post,
                // );
              },
            ),
          );
        },
      ),
    );
  }
}
