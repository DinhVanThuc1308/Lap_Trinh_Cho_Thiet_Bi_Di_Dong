import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {Key? key, required this.selectedIndex, required this.onIcontap})
      : super(key: key);
  final int selectedIndex;
  final Function onIcontap;

  @override
  Widget build(BuildContext context) {
    final barHeight = MediaQuery.of(context).size.height * 0.06;
    final style = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontSize: 11, fontWeight: FontWeight.w500);
    return BottomAppBar(
      color: selectedIndex == 0 ? Colors.black : Colors.white,
      child: Container(
        height: barHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            __bottomBarNavItem(0, 'Home', style, 'home'),
            __bottomBarNavItem(1, 'Discovery', style, 'search'),
            __addVideoNavItem(barHeight),
            __bottomBarNavItem(3, 'Inbox', style, 'message'),
            __bottomBarNavItem(4, 'Profile', style, 'account'),
          ],
        ),
      ),
    );
  }

  __bottomBarNavItem(
      int index, String lable, TextStyle textStyle, String iconName) {
    bool isSelected = selectedIndex == index;
    Color iconAndTextColor = isSelected ? Colors.black : Colors.grey;

    if (isSelected && selectedIndex == 0) {
      iconAndTextColor = Colors.white;
    }
    return GestureDetector(
      onTap: () => {onIcontap(index)},
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        SvgPicture.asset(
          'assets/${isSelected ? iconName + '_lable' : iconName}.svg',
          height: 24,
          width: 24,
          color: iconAndTextColor,
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          lable,
          style: textStyle.copyWith(color: iconAndTextColor),
        )
      ]),
    );
  }

  __addVideoNavItem(double height) {
    return Container(
      height: height,
      width: 48,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.redAccent],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Container(
          width: 41,
          height: height - 15,
          decoration: BoxDecoration(
            color: selectedIndex == 0 ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.add,
            color: selectedIndex == 0 ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
