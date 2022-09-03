import 'package:flutter/cupertino.dart';
import 'package:shopping_app/screens/account_tab_ios.dart';
import 'package:shopping_app/screens/cart_tab.dart';
import 'package:shopping_app/screens/home_tab.dart';

class ProductOverviewIOS extends StatefulWidget {
  const ProductOverviewIOS({super.key});

  @override
  State<ProductOverviewIOS> createState() => _ProductOverviewIOSState();
}

class _ProductOverviewIOSState extends State<ProductOverviewIOS> {
  final List<Widget> _tabs = [
    ProductsOverviewScreenIos(),
    AccountTabIos(),
    CartTabIos()
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('My shop'),
      ),
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor: CupertinoColors.white,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person), label: 'Account'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart), label: 'Cart')
            ],
          ),
          tabBuilder: (BuildContext context, index) {
            return _tabs[index];
          }),
    );
  }
}
