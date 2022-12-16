import 'package:buga_customer/component/colors.dart';
import 'package:buga_customer/component/homewidget.dart';
import 'package:buga_customer/component/style.dart';
import 'package:buga_customer/homepage/quotepage.dart';
import 'package:buga_customer/homepage/searchdelegate.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime todaysDate = DateTime.now();
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(50),
                  image: const DecorationImage(
                    image: AssetImage('assets/second.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${months[todaysDate.month - 1]} ${todaysDate.day} , ${todaysDate.year}',
                    style: style.copyWith(
                      fontSize: 11,
                      color: AppColor.black.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Hi, Caramel!',
                    style: style.copyWith(
                      fontSize: 13,
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none,
                  color: AppColor.primaryColor,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () => showSearch(
              context: context,
              // delegate to customize the search bar
              delegate: CustomSearchDelegate(),
            ),
            child: Container(
              height: 42,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColor.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.search,
                    color: AppColor.grey,
                    size: 20,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    'Enter tracking number',
                    style: style.copyWith(
                      color: AppColor.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'How Can We Help You Today?',
            style: style.copyWith(
              color: AppColor.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                children: [
                  HomeWidget(
                    imageUrl: 'assets/quote.png',
                    text:
                        'Find out the estimted price for you to send a package just by inputing the approximate weight of package(s), locations, and so on.',
                    title: 'Get A Quote',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const QuotePage(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 13),
                  HomeWidget(
                    imageUrl: 'assets/package.png',
                    text:
                        'Find out the estimted price for you to send a package just by inputing the approximate weight of package(s), locations, and so on.',
                    title: 'Deliver A Package',
                    onTap: () {},
                  ),
                  const SizedBox(height: 13),
                  HomeWidget(
                    imageUrl: 'assets/location.png',
                    text:
                        'Find out the estimted price for you to send a package just by inputing the approximate weight of package(s), locations, and so on.',
                    title: 'Track An Order',
                    onTap: () {},
                  ),
                  const SizedBox(height: 13),
                  HomeWidget(
                    imageUrl: 'assets/truck.png',
                    text:
                        'Find out the estimted price for you to send a package just by inputing the approximate weight of package(s), locations, and so on.',
                    title: 'Book A Vehicle',
                    onTap: () {},
                  ),
                  const SizedBox(height: 13),
                  HomeWidget(
                    imageUrl: 'assets/wallet.png',
                    text:
                        'Find out the estimted price for you to send a package just by inputing the approximate weight of package(s), locations, and so on.',
                    title: 'Add A Wallet',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
