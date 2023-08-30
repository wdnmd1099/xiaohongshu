import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Recommend extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class TopRoundedCornersClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double radius = 4.0;
    path.moveTo(0, size.height);
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TopRoundedCornersClipper oldClipper) => false;
}

class _SecondPageState extends State<Recommend>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isPageVisible = false;
  double _top = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _togglePageVisibility() {
    setState(() {
      _isPageVisible = !_isPageVisible;
      if (_isPageVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  List myList = [
    {'name': '推荐', 'path': '/'},
    {'name': '视频', 'path': '/xxx'},
    {'name': '直播', 'path': '/CCC'},
    {'name': '美食', 'path': '/VVV'},
    {'name': '旅行', 'path': '/BBB'},
    {'name': '机车', 'path': '/NNN'},
    {'name': '读书', 'path': '/MMM'},
    {'name': '情感', 'path': '/QQQ'},
    {'name': '舞蹈', 'path': '/WWW'},
    {'name': '搞笑', 'path': '/EEE'},
    {'name': '健身', 'path': '/RRR'},
    {'name': '影视', 'path': '/TTT'},
    {'name': '户外', 'path': '/YYY'},
    {'name': '动漫', 'path': '/UUU'},
    {'name': '职场', 'path': '/III'},
    {'name': '法学', 'path': '/OOO'},
    {'name': '轻松', 'path': '/PPP'},
    {'name': '心理', 'path': '/HHH'},
  ];
  List imgList = [
    {
      'path':
      'https://img0.baidu.com/it/u=3319841190,850172708&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=731'
    },
    {
      'path':
      'https://img1.baidu.com/it/u=2367088677,387627710&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750'
    },
    {
      'path':
      'https://img2.baidu.com/it/u=1446721905,1635020502&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500'
    },
    {
      'path':
      'https://img2.baidu.com/it/u=2369183681,2327094715&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750'
    },
    {
      'path':
      'https://img1.baidu.com/it/u=2756570657,2376436786&fm=253&fmt=auto&app=138&f=JPEG?w=600&h=400'
    },
    {
      'path':
      'https://img1.baidu.com/it/u=956544463,3458766498&fm=253&fmt=auto&app=138&f=JPEG?w=892&h=500'
    },
    {
      'path':
      'https://img0.baidu.com/it/u=207708951,1766336769&fm=253&fmt=auto&app=138&f=JPEG?w=644&h=500'
    },
    {
      'path':
      'https://img0.baidu.com/it/u=1723718844,2581000878&fm=253&fmt=auto&app=138&f=JPEG?w=382&h=500'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      initialIndex: 1,
      length: myList.length,
      child: Scaffold(
        body: Container(
          height: maxHeight,
          width: maxWidth,
          decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
          child: Stack(
            children: [
              Positioned(
                top: _top ,
                child: Container(
                  height: maxHeight,
                  width: maxWidth,
                  child: Stack(
                    children: [
                      Positioned(
                        // top: _top,
                        child: Container(
                          height: maxHeight * 0.83 * 0.07,
                          color: Colors.transparent,
                          child: TabBar(
                            labelColor:Colors.orange,
                            unselectedLabelColor: Colors.grey,
                            isScrollable: true,
                            tabs: [
                              for (int i = 0; i < myList.length; i++)
                                Tab(
                                  text: myList[i]['name'],
                                ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: maxHeight * 0.83 * 0.07 ,
                        bottom: 0,
                        child: Container(
                          child: Container(
                            height: maxHeight * 0.83 * 0.93,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 0,
                                )),
                            child: NotificationListener<ScrollNotification>(
                              onNotification: (notification) {
                                // print(_top);
                                if (notification is ScrollUpdateNotification) {//滚动条在移动中


                                  if (notification.dragDetails != null &&
                                      notification.dragDetails!.delta.dy > 0) {
                                    setState(() {
                                      //往下拉 导航出现
                                      _top += notification.dragDetails!.delta.dy;
                                      // print(_top);
                                      if(_top >= 0){
                                        _top = 0;
                                        // print(_top);
                                      }
                                    });
                                  } else if (notification.dragDetails != null && notification.dragDetails!.delta.dy < 0) {
                                    setState(() {
                                      //上拉，导航消失
                                      if (_top <= -MediaQuery.of(context).size.height * 0.97 * 0.06) {
                                        _top = -MediaQuery.of(context).size.height * 0.97 * 0.06;
                                      } else {
                                        _top += notification.dragDetails!.delta.dy;
                                      }
                                    });
                                  }
                                }
                                return true;
                              },
                              child: TabBarView(
                                children: [
                                  GridView.count(
                                    crossAxisCount: 2,
                                    children: [
                                      for (int i = 0; i < 100; i++)
                                        Container(
                                          color: Colors.purple,
                                          child: Text('测试测试测试测试测试测试测试'),
                                        ),
                                    ],
                                  ),
                                  MasonryGridView.count(
                                    // physics: BouncingScrollPhysics(),
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 4,
                                    itemBuilder: (context, index) {
                                      // print(index);
                                      String imagePath = imgList[index % 8]['path'];
                                      Image img = Image.network(imagePath);
                                      return Container(
                                        color: Colors.white,
                                        // height: (index % 5 + 1) * 100,

                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                // borderRadius: BorderRadius.circular(50),
                                                  border: Border.all(
                                                      color: Colors.transparent, width: 0)),
                                              height: img.height,
                                              child: ClipPath(
                                                clipper: TopRoundedCornersClipper(),
                                                child: Image.network(imagePath),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.transparent,
                                              padding:
                                              EdgeInsets.only(left: 8, right: 8),
                                              child: Text('回复是否iO欧冠和发红色合计佛山就哦i是'),
                                            ),
                                            Container(
                                              padding:
                                              EdgeInsets.only(left: 8, right: 8,top: 6,bottom: 6),
                                              // padding: EdgeInsets.zero,
                                              width: maxWidth,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      color: Colors.transparent,
                                                      child: const CircleAvatar(
                                                        radius: 8,
                                                        backgroundImage: NetworkImage(
                                                            'https://img0.baidu.com/it/u=949511033,1113765775&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1692723600&t=d0c88947d3b6ac729e51c3ef6ee5a8ad'),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(left: 12),
                                                      color: Colors.transparent,
                                                      width: 75,
                                                      child: Container(
                                                        child: const Text(
                                                          '请你来一杯阿帕茶吧',
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(fontSize: 8),
                                                        ),
                                                      ),

                                                    ),
                                                    Container(
                                                      child: Expanded(
                                                        child: Container(
                                                          color: Colors.transparent,
                                                          child: Align(
                                                            alignment:
                                                            Alignment.centerRight,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.end,
                                                              children: [
                                                                Container(
                                                                  color:Colors.transparent,
                                                                  // width: 32,
                                                                  padding:
                                                                  EdgeInsets.all(0),
                                                                  child: Container(
                                                                    padding:EdgeInsets.only(right: 4),
                                                                    child: GestureDetector(
                                                                      onTap: ()=>{print('点击了')},
                                                                      child: const Icon(
                                                                        Icons.add_card,
                                                                        size: 16,
                                                                      ),
                                                                    ),
                                                                  ),

                                                                ),
                                                                Container(
                                                                  color: Colors.yellow,
                                                                  // width: 70,
                                                                  child: const Text(
                                                                    '1787',

                                                                    style: TextStyle(
                                                                        fontSize: 12,overflow: TextOverflow.ellipsis),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  MasonryGridView.count(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 4,
                                    itemBuilder: (context, index) {
                                      // print(index);
                                      String imagePath = imgList[index % 8]['path'];
                                      Image img = Image.network(imagePath);
                                      return Container(
                                        color: Colors.white,
                                        // height: (index % 5 + 1) * 100,

                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                // borderRadius: BorderRadius.circular(50),
                                                  border: Border.all(
                                                      color: Colors.transparent, width: 0)),
                                              height: img.height,
                                              child: ClipPath(
                                                clipper: TopRoundedCornersClipper(),
                                                child: Image.network(imagePath),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.transparent,
                                              padding:
                                              EdgeInsets.only(left: 8, right: 8),
                                              child: Text('回复是否iO欧冠和发红色合计佛山就哦i是'),
                                            ),
                                            Container(
                                              padding:
                                              EdgeInsets.only(left: 8, right: 8,top: 6,bottom: 6),
                                              // padding: EdgeInsets.zero,
                                              width: maxWidth,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      color: Colors.transparent,
                                                      child: const CircleAvatar(
                                                        radius: 8,
                                                        backgroundImage: NetworkImage(
                                                            'https://img0.baidu.com/it/u=949511033,1113765775&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1692723600&t=d0c88947d3b6ac729e51c3ef6ee5a8ad'),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(left: 12),
                                                      color: Colors.transparent,
                                                      width: 75,
                                                      child: Container(
                                                        child: const Text(
                                                          '请你来一杯阿帕茶吧',
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(fontSize: 8),
                                                        ),
                                                      ),

                                                    ),
                                                    Container(
                                                      child: Expanded(
                                                        child: Container(
                                                          color: Colors.transparent,
                                                          child: Align(
                                                            alignment:
                                                            Alignment.centerRight,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.end,
                                                              children: [
                                                                Container(
                                                                  color:Colors.transparent,
                                                                  // width: 32,
                                                                  padding:
                                                                  EdgeInsets.all(0),
                                                                  child: Container(
                                                                    padding:EdgeInsets.only(right: 4),
                                                                    child: GestureDetector(
                                                                      onTap: ()=>{print('点击了')},
                                                                      child: const Icon(
                                                                        Icons.add_card,
                                                                        size: 16,
                                                                      ),
                                                                    ),
                                                                  ),

                                                                ),
                                                                Container(
                                                                  color: Colors.yellow,
                                                                  // width: 70,
                                                                  child: const Text(
                                                                    '1787',

                                                                    style: TextStyle(
                                                                        fontSize: 12,overflow: TextOverflow.ellipsis),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  Text('ABC'),
                                  Text('KFC'),
                                  Text('ABC'),
                                  Text('KFC'),
                                  Text('ABC'),
                                  Text('KFC'),
                                  Text('ABC'),
                                  Text('KFC'),
                                  Text('ABC'),
                                  Text('KFC'),
                                  Text('ABC'),
                                  Text('KFC'),
                                  Text('ABC'),
                                  Text('KFC'),
                                  Text('KFC'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),),
            ],
          ),


        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Recommend(),
  ));
}
