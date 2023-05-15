import '../models/user.dart';
import '../models/video.dart';

User CurrentUser = User(
    username: 'CurrentUser',
    profileImageUrl: 'https://picsum.photos/250?image=9');
User user1 = User(username: 'user1', profileImageUrl: '../assets/user1.jpg');
User user2 = User(username: 'user2', profileImageUrl: '../assets/user2.jpg');
User user3 = User(username: 'user3', profileImageUrl: '../assets/user3.jpg');
User user4 = User(username: 'user4', profileImageUrl: '../assets/user4.jpg');

final List<Video> videos = [
  Video(
      videoUrl: '../assets/demo_vid1.mp4',
      postedBy: user1,
      caption: 'This is a demo video',
      audioName: 'audio1',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid2.mp4',
      postedBy: user2,
      caption: 'This is a demo video',
      audioName: 'audio2',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid3.mp4',
      postedBy: user3,
      caption: 'This is a demo video',
      audioName: 'audio3',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid4.mp4',
      postedBy: user4,
      caption: 'This is a demo video',
      audioName: 'audio4',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid5.mp4',
      postedBy: user1,
      caption: 'This is a demo video',
      audioName: 'audio5',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid6.mp4',
      postedBy: user2,
      caption: 'This is a demo video',
      audioName: 'audio6',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid7.mp4',
      postedBy: user3,
      caption: 'This is a demo video',
      audioName: 'audio7',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid8.mp4',
      postedBy: user4,
      caption: 'This is a demo video',
      audioName: 'audio8',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid9.mp4',
      postedBy: user1,
      caption: 'This is a demo video',
      audioName: 'audio9',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid10.mp4',
      postedBy: user2,
      caption: 'This is a demo video',
      audioName: 'audio10',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid11.mp4',
      postedBy: user3,
      caption: 'This is a demo video',
      audioName: 'audio11',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid12.mp4',
      postedBy: user4,
      caption: 'This is a demo video',
      audioName: 'audio12',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid13.mp4',
      postedBy: user1,
      caption: 'This is a demo video',
      audioName: 'audio13',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid14.mp4',
      postedBy: user2,
      caption: 'This is a demo video',
      audioName: 'audio14',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid15.mp4',
      postedBy: user3,
      caption: 'This is a demo video',
      audioName: 'audio15',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid16.mp4',
      postedBy: user4,
      caption: 'This is a demo video',
      audioName: 'audio16',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid17.mp4',
      postedBy: user1,
      caption: 'This is a demo video',
      audioName: 'audio17',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid18.mp4',
      postedBy: user2,
      caption: 'This is a demo video',
      audioName: 'audio18',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid19.mp4',
      postedBy: user3,
      caption: 'This is a demo video',
      audioName: 'audio19',
      like: '1.2M',
      comment: '10k'),
  Video(
      videoUrl: '../assets/demo_vid20.mp4',
      postedBy: user4,
      caption: 'This is a demo video',
      audioName: 'audio20',
      like: '1.2M',
      comment: '10k'),
];
