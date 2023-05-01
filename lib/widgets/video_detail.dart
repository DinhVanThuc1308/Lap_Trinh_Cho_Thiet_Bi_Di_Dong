import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:marquee/marquee.dart';

import '../models/video.dart';

class VideoDetail extends StatelessWidget {
  const VideoDetail({super.key, required this.video});
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '@${video.postedBy.username}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 5,
          ),
          ExpandableText(
            video.caption,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 13,
                  color: Colors.white,
                ),
            expandText: 'more',
            collapseText: 'less',
            expandOnTextTap: true,
            collapseOnTextTap: true,
            maxLines: 2,
            linkColor: Colors.grey,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                CupertinoIcons.music_note_2,
                size: 15,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 20,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Marquee(
                  text: "${video.audioName} * ",
                  velocity: 8,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
