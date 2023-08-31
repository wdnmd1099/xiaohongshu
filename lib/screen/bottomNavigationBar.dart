// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:app/screen/follow.dart';
import 'package:app/screen/recommend.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({super.key});

  @override
  State<bottomNavigationBar> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<bottomNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> bottonViews(BuildContext context, ETCcontroller) {
    List<Widget> widgetOptions = <Widget>[
      DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
            child: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_alert),
              ),
              title: const TabBar(
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                indicatorWeight: 0.80,
                indicatorPadding:
                    EdgeInsets.only(right: 20, left: 20, bottom: 8),
                labelPadding: EdgeInsets.only(
                  top: 4,
                ),
                tabs: <Widget>[
                  Tab(
                    text: ('关注'),
                  ),
                  Tab(
                    text: ('推荐'),
                  ),
                  Tab(
                    text: ('江门'),
                  ),
                ],
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  tooltip: 'Open shopping cart',
                  onPressed: () {
                    // handle the press
                  },
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FollowPage(),
              //推荐页body
              Recommend(),
              Text('顶部页面3'),

              // StackNavigation(),
            ],
          ),
        ),
      ),
      const Text(
        'Index 1: Business',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
    ];
    return widgetOptions;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final ExpansionTileController ETCcontroller =
      ExpansionTileController(); //折叠组件的controller

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.greenAccent,
          highlightColor: Color.fromRGBO(0, 0, 0, 0),
          splashColor: Color.fromRGBO(0, 0, 0, 0)),
      home: Scaffold(
        body: Center(
          child: bottonViews(context, ETCcontroller).elementAt(_selectedIndex),
        ),
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: GestureDetector(
            onLongPress: () => {},
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedLabelStyle: TextStyle(fontSize: 16),
              unselectedLabelStyle: TextStyle(fontSize: 16),
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              currentIndex: _selectedIndex,
              selectedFontSize:0,
              // selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(),
                  label: '首页',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(),
                  label: '购物',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_card),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(),
                  label: '消息',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(),
                  label: '我',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
