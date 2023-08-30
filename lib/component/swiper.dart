// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
// import 'test2.dart';

class SwiperPage extends StatefulWidget {
  const SwiperPage({super.key});

  @override
  State<SwiperPage> createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  List<Map> imgList = [
    {
      "url":
      "https://img0.baidu.com/it/u=2901201999,1369238196&fm=253&fmt=auto&app=120&f=JPEG?w=887&h=500"
    },
    {
      "url":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0fhWY4xPaJlHLM9DNCPXMxVqaIAZZPbYUuQ&usqp=CAU"
    },
    {
      "url":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf8kL2jksZ2vxSGv9Di7So3PkzenjQT7o6lw&usqp=CAU"
    },
    {
      "url":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsruW-GHY7iFF05ljnyy5XkvCPssmano5IdspFtT71evkYYGPItC9c8URfU7N1rm_XxvM&usqp=CAU"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var MySwiperWidget = Swiper(
      itemBuilder: (BuildContext context, int index) {
        //每次循环遍历时，将i赋值给index
        return new Image.network(
          imgList[index]['url'],
          fit: BoxFit.fill,
        );
      },
      itemCount: imgList.length,
      //指示器
      pagination: const SwiperPagination(),
    );
    return Container(
      height: 400,
      //每一个推荐推送显示的块
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 0.0,
        ),
      ),
      child: Column(
        children: [
          Container(
            // 每个块的顶部信息条
            child: Row(
              children: [
                Container(
                  // 小头像
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(
                          'https://img0.baidu.com/it/u=949511033,1113765775&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1692723600&t=d0c88947d3b6ac729e51c3ef6ee5a8ad'),
                    ),
                  ),
                ),
                Container(
                  // ID 和 消息发送时间
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Row(
                    children: [
                      Container(
                        //ID
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 0,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('这是八个字的ID'),
                        ),
                      ),
                      Container(
                        //消息发送时间
                        width: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 0,
                          ),
                        ),
                        padding: EdgeInsets.only(top: 2),
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '多少小时前',
                            style: TextStyle(fontSize: 8, letterSpacing: 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 8),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.more_horiz),
                  ),
                ),
              ],
            ),
          ), //顶部信息条
          Container(
            height: 250,
            width: double.infinity,
            child: MySwiperWidget,
          ), //轮播图
          Container(
            height: MediaQuery.of(context).size.width * 0.1,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  padding: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 0,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.share),
                  ),
                ), //分享键
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Icon(Icons.star),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Icon(Icons.pets),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Icon(Icons.apple),
                      ),
                    ],
                  ),
                ), //右方的红心收藏评论ICON
              ],
            ),
          ), //一键三联
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(255, 255, 255, 0)),
                    shadowColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(255, 255, 255, 0)),
                  ),
                  onPressed: () => {print('hello world')},
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR4eHnv4sCvp-sQV1NOS2FvejCksKsUzCkmg&usqp=CAU'),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.green,
                            width: 0.0,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '看了这么久，评论一下吧',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.22,
                        // height: 20,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.green,
                            width: 0.0,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.access_alarm_outlined,color: Colors.black,),
                            Icon(Icons.access_alarm_outlined,color: Colors.black,),
                            Icon(Icons.access_alarm_outlined,color: Colors.black,),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ), //评论口
        ],
      ),
    );
  }
}
