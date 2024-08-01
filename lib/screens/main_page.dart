import 'package:expenses/constant/colors.dart';
import 'package:expenses/screens/add_page.dart';
import 'package:expenses/screens/budget_page.dart';
import 'package:expenses/screens/home_page.dart';
import 'package:expenses/screens/profile_page.dart';
import 'package:expenses/screens/transaction_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const TransactionPage(),
    const AddPage(),
    const BudgetPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kMainColor,
        selectedIconTheme: IconThemeData(size: 30),
        unselectedItemColor: kGrey,
        backgroundColor: kWhite,
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 10,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding:
                  _currentIndex == 2 ? EdgeInsets.all(12) : EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kMainColor,
              ),
              child: const Icon(
                Icons.add,
                color: kWhite,
                size: 30,
              ),
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.rocket),
            label: "Budget",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}
