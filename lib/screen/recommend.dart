import 'dart:math';
import 'package:flutter/material.dart';
import 'package:app/component/recommendBlock.dart';
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

  Function throttle(Function fn,Duration time) {
    bool cding = false;

    return (Function fn,Duration time) {
      print('jile');
      if (cding) return;
      fn();
      print('laile ');
      cding = true;
      Timer(time, () {
        cding = false;
      });
    };
  }







  void _togglePageVisibility() {
    setState(() {
      print('dianle');
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
  List msgList = [
    {'msg': '要实现文本超出两行省略的效果，只显示一行高度的文本，可以使用Text组件的maxLines和overflow属性。'},
    {'msg': '靠靠靠靠靠靠靠靠靠靠靠靠靠'},
    {'msg': '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊'},
    {'msg': '水水水水水是是是是'},
    {'msg': '嗡嗡嗡嗡嗡嗡'},
    {'msg': '哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇'},
    {'msg': '呃呃呃呃呃呃呃呃呃'},
    {'msg': '日日日日日日日日日日日日日日日日日日日'},
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
          decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 0)),
          child: Stack(
            children: [
              Positioned(
                top: _top,
                child: Container(
                  height: maxHeight,
                  width: maxWidth,
                  child: Stack(
                    children: [
                      Positioned(
                        // top: _top,
                        child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                height: maxHeight * 0.83 * 0.07,
                                width: maxWidth,
                                color: Colors.white,
                                child: TabBar(
                                  labelColor: Colors.orange,
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
                            ),//tabbar
                            Stack(
                              children: [
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    width: maxWidth * 0.07,
                                    height: maxHeight * 0.83 * 0.07,
                                    color: Colors.white ,
                                    child: GestureDetector(
                                      onTap: _togglePageVisibility,
                                      child: Icon(Icons.keyboard_arrow_down),
                                    ),
                                  ),
                                ),
                              ],
                            ), // 按钮触发下拉导航
                          ],
                        ),
                      ),
                      Positioned(
                        top: maxHeight * 0.83 * 0.07,
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
                            child:  NotificationListener<ScrollNotification>(
                              onNotification: (notification) {

                                if (notification is ScrollUpdateNotification) {
                                  //滚动条在移动中
                                  void test(notification){
                                    if(notification.dragDetails != null && notification.dragDetails!.delta.dy < 0 && _top  <= -maxHeight * 0.97 * 0.06){
                                    _top = -maxHeight * 0.97 * 0.06;
                                    print('上了');
                                  }else if(notification.dragDetails != null && notification.dragDetails!.delta.dy > 0 && _top >= 0) {
                                    _top = 0;
                                    print('下了');
                                  }
                                  else if (notification.dragDetails != null && notification.dragDetails!.delta.dy > 0) {
                                    setState(() {
                                      //往下拉 导航出现
                                      _top += notification.dragDetails!.delta.dy;
                                      // print(_top);
                                      if (_top >= 0) {
                                        _top = 0;
                                        // print(_top);
                                      }
                                    });
                                  } else if (notification.dragDetails != null && notification.dragDetails!.delta.dy < 0) {
                                    setState(() {
                                      //上拉，导航消失
                                      if (_top <= -maxHeight * 0.97 * 0.06) {
                                        _top = -maxHeight * 0.97 * 0.06;
                                      } else {
                                        _top += notification.dragDetails!.delta.dy;
                                      }
                                    });
                                  } }
                                  // throttle(test, Duration(milliseconds: 100));

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
                                      String imagePath =
                                          imgList[index % 8]['path'];
                                      String msgPath =
                                          msgList[index % 8]['msg'];
                                      Image img = Image.network(imagePath);
                                      return RecommendBlock(
                                          path: imagePath,
                                          img: img,
                                          msg: msgPath);
                                    },
                                  ),
                                  MasonryGridView.count(
                                    // physics: BouncingScrollPhysics(),
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 4,
                                    itemBuilder: (context, index) {
                                      // print(index);
                                      String imagePath =
                                          imgList[index % 8]['path'];
                                      Image img = Image.network(imagePath);
                                      String msgPath =
                                          msgList[index % 8]['msg'];
                                      return RecommendBlock(
                                          path: imagePath,
                                          img: img,
                                          msg: msgPath);
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
                      ), //tabbarview

                      _isPageVisible
                          ? GestureDetector(
                        onTap: () {
                          _togglePageVisibility();
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height ,
                          color: Colors.black54,
                        ), //手势组件嵌套遮罩层
                      )
                          : Text(''), //手势组件

                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (BuildContext context, Widget? child) {
                          return Positioned(
                            height: _animationController.value *
                                MediaQuery.of(context).size.height * 0.7,
                            child: Container(
                              height: 0,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.red,
                              child: Center(
                                child: Text(
                                  'Hello World',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
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
