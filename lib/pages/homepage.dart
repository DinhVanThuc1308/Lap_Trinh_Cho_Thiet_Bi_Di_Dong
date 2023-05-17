import 'package:flutter/material.dart';

import '../_mock_data/mock_data.dart';
import '../widgets/home_side_bar.dart';
import '../widgets/video_detail.dart';
import '../widgets/video_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  get index => null;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final int newPageIndex = _controller.page?.floor() ?? 0;
      if (_currentPageIndex != newPageIndex) {
        setState(() {
          _currentPageIndex = newPageIndex;
        });
      }
    });
  }

  // void _goToNextPage() {
  //   if (_currentPageIndex == 9) {
  //     _controller.jumpToPage(0);
  //     setState(() {
  //       _currentPageIndex = 0;
  //     });
  //   } else {
  //     _controller.nextPage(
  //         duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  //     setState(() {
  //       _currentPageIndex++;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    int _snappedPageIndex = 0;

    return Scaffold(
      extendBodyBehindAppBar: true, // đặt màu nền cho appbar là trong suốt
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Following",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 18, color: Colors.grey),
            ),
            Text(
              "  |  ",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 14, color: Colors.grey),
            ),
            Text(
              "For You",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
      // body: Stack(
      //   children: [
      //     PageView.builder(
      //       controller: _controller,
      //       onPageChanged: (int page) => setState(() {
      //         _currentPageIndex = page;
      //       }),
      //       scrollDirection: Axis.vertical,
      //       itemCount: 10,
      //       itemBuilder: (context, index) {
      //         return Container(
      //           color: Colors.blue,
      //           child: Center(
      //             child: Text("Page $index"),
      //           ),
      //         );
      //       },
      //     ),
      //     Positioned(
      //       bottom: 50.0,
      //       left: 0.0,
      //       right: 0.0,
      //       child: Center(
      //         child: ElevatedButton(
      //           onPressed: _goToNextPage,
      //           child: CircleAvatar(
      //             backgroundColor: Colors.blue, // đặt màu nền
      //             radius: 30.0, // đặt bán kính
      //             child: Icon(
      //               _currentPageIndex == 9
      //                   ? Icons.arrow_upward
      //                   : Icons.arrow_downward,
      //               color: Colors.white,
      //               size: 30.0,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: PageView.builder(
        onPageChanged: (int page) => {
          setState(() {
            _snappedPageIndex = page;
          }),
        }, // xử lý sự kiện cuộn chuột đổi page
        scrollDirection: Axis.vertical, // cuộn dọc
        itemCount: videos.length, // số lượng page
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoTitle(
                video: videos[index],
                currentIndex: index,
                snappedPageIndex: _snappedPageIndex,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      // color: Colors.amber,
                      child: VideoDetail(
                        video: videos[index],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.75,
                      // color: Colors.pink,
                      child: HomeSideBar(video: videos[index]),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
