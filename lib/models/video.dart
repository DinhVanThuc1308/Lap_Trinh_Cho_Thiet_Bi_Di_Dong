import 'package:flutter_application_1/models/user.dart';

class Video {
  final String videoUrl;
  final User postedBy;
  final String caption;
  final String audioName;
  final String like;
  final String comment;

  Video({
    required this.videoUrl,
    required this.postedBy,
    required this.caption,
    required this.audioName,
    required this.like,
    required this.comment,
  });
}
