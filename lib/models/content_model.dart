class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Use the app together',
      image: 'images/pic6.jpg',
      discription: "Invite friends,family,or colleagues"
          "and manage your joint expenses"),
  UnbordingContent(
      title: 'Record expenses',
      image: 'images/pic7.jpg',
      discription: "The application will calculate"
          "your current balance,debts and debtors"),
  UnbordingContent(
      title: 'Track statistics',
      image: 'images/pic1.jpg',
      discription: "Try to reduce the group balance"
          "to zero,it will help to avoid unnecessary "
          "money transfers"),
];
