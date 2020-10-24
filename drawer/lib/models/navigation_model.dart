import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;
  IconData icon2;
  Tooltip tooltip;

  NavigationModel({this.title, this.icon, this.icon2 ,this.tooltip});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Record order", icon: Icons.mic_none),
  NavigationModel(title: "Picture", icon: Icons.camera),
  NavigationModel(title: "Write Order", icon: Icons.note),
  NavigationModel(title: "Companies List", icon: Icons.fastfood),
];
