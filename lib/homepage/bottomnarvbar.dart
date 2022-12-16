import 'package:buga_customer/component/colors.dart';
import 'package:buga_customer/component/style.dart';
import 'package:buga_customer/homepage/homepage.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Center(
      child: Text(
        'Index 1: Orders',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Index 2: Wallet',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Index 3: Tracker',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Index 4: Settings',
        style: optionStyle,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // used to determined the screen size for responsive design
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home.png',
              width: 26,
              height: 26,
              color: AppColor.grey,
            ),
            activeIcon: Image.asset(
              'assets/home.png',
              width: 26,
              height: 26,
              color: AppColor.red,
            ),
            label: 'Home',
            backgroundColor: AppColor.white,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/package.png',
              width: 26,
              height: 26,
              color: AppColor.grey,
            ),
            activeIcon: Image.asset(
              'assets/package.png',
              width: 26,
              height: 26,
              color: AppColor.red,
            ),
            label: 'Orders',
            backgroundColor: AppColor.white,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/wallet.png',
              width: 26,
              height: 26,
              color: AppColor.grey,
            ),
            activeIcon: Image.asset(
              'assets/wallet.png',
              width: 26,
              height: 26,
              color: AppColor.red,
            ),
            label: 'Wallet',
            backgroundColor: AppColor.white,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/location.png',
              width: 26,
              height: 26,
              color: AppColor.grey,
            ),
            label: 'Tracker',
            activeIcon: Image.asset(
              'assets/location.png',
              width: 26,
              height: 26,
              color: AppColor.red,
            ),
            backgroundColor: AppColor.white,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.settings_outlined,
              size: 26,
            ),
            label: 'Settings',
            backgroundColor: AppColor.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.red,
        unselectedItemColor: AppColor.grey,
        unselectedLabelStyle: style.copyWith(
          color: AppColor.grey,
          fontSize: 12,
        ),
        selectedLabelStyle: style.copyWith(
          fontSize: 12,
        ),
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
