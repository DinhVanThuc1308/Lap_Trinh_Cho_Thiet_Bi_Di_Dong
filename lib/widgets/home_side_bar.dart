import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/video.dart';
import '../models/user.dart';

class HomeSideBar extends StatefulWidget {
  const HomeSideBar({super.key, required this.video});
  final Video video;

  @override
  State<HomeSideBar> createState() => _HomeSideBarState();
}

class _HomeSideBarState extends State<HomeSideBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initStated() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontSize: 13, color: Colors.white);
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _profileImageButton(widget.video.postedBy.profileImageUrl),
          _sideBarItem('heart', widget.video.like, style),
          _sideBarItem('comment', widget.video.comment, style),
          _sideBarItem('share', 'share', style),
          // AnimatedBuilder(
          //     animation: _animationController,
          //     child: Stack(
          //       children: [
          //         Container(
          //           height: 50,
          //           width: 50,
          //           child: Image.asset('assets/dics.jpg'),
          //         )
          //       ],
          //     ),
          //     builder: (context, child) {
          //       return Transform.rotate(
          //         angle: 2 * 3.14 * _animationController.value,
          //         child: child,
          //       );
          //     }),
        ],
      ),
    );
  }

  _sideBarItem(String iconName, String label, TextStyle style) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/${iconName}.svg',
          height: 24,
          width: 24,
          color: Colors.black,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  _profileImageButton(String imageUrl) {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl),
                )),
          ),
          Positioned(
            bottom: -5,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(7.5),
                  border: Border.all(color: Colors.white, width: 2)),
            ),
          )
        ]);
  }
}
