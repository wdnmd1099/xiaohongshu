import 'package:flutter/material.dart';
import '../screen/follow.dart';

class RecommendBlock extends StatefulWidget {
  RecommendBlock({Key? key, this.path, this.img, this.msg}) : super(key: key);
  String? msg;
  String? path;
  Image? img;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RecommendBlock> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 0)),
            height: widget.img?.height,
            child: ClipPath(
              clipper: TopRoundedCornersClipper(),
              child: Image.network(widget.path!),
            ),
          ),
          Container(
            color: Colors.transparent,
            // height: 40,
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Container(
              // height: 20,
              // color: Colors.red,
              child: Text(
                widget.msg!,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
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
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                color: Colors.transparent,
                                // width: 32,
                                padding: EdgeInsets.all(0),
                                child: Container(
                                  padding: EdgeInsets.only(right: 4),
                                  child: GestureDetector(
                                    onTap: () => {print('点击了')},
                                    child: const Icon(
                                      Icons.add_card,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                // width: 70,
                                child: const Text(
                                  '1787',
                                  style: TextStyle(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis),
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
  }
}
