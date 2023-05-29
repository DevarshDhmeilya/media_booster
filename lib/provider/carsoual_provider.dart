import 'package:flutter/material.dart';

class carsoal_slidder extends ChangeNotifier {
  List<String> ImageList = [
    "https://i.imgur.com/OB0y6MR.jpg",
    "https://www.pakainfo.com/wp-content/uploads/2021/09/image-url-for-testing.jpg",
    "https://farm4.staticflickr.com/3852/14447103450_2d0ff8802b_z_d.jpg"
  ];
  int currentIndex = 0;

  changeCurrentPageIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
