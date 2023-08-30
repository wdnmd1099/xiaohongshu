import 'dart:math';

import 'package:flutter/material.dart';
import 'package:app/component/swiper.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FollowPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class TopRoundedCornersClipper extends CustomClipper<Path> {
  //把图片切圆角用的
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

class _SecondPageState extends State<FollowPage>
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

    return  Container(
      child: ListView(
        children: [
          Container(
            height: 90,
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 8, top: 8),
                child: Column(
                  children: [
                    // Icon(Icons.add_card),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://img0.baidu.com/it/u=949511033,1113765775&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1692723600&t=d0c88947d3b6ac729e51c3ef6ee5a8ad'),
                    ),
                    Text('分享瞬间'),
                  ],
                ),
              ),
            ),
          ), // 分享瞬间
          const Divider(
            color: Colors.grey, // 设置分割线的颜色
            thickness: 1, // 设置分割线的厚度
          ), //分割线
          SwiperPage(),
          SwiperPage(),
          SwiperPage(),
          SwiperPage(),
          SwiperPage(),
          SwiperPage(),
        ],
      ),
    ); //关注页Body;
  }
}

void main() {
  runApp(MaterialApp(
    home: FollowPage(),
  ));
}
