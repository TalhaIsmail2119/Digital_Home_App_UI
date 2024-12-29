import 'package:flutter/material.dart';

class HomeDevices {
  final String title, image, subTitel;

  HomeDevices({
    required this.image,
    required this.title,
    required this.subTitel,
  });
}

List demoHomeDevices = [
  HomeDevices(
    image: "assets/images/humidifier.jpg",
    title: "Top Line 3",
    subTitel: "Humidifier",
  ),
  HomeDevices(
    image: "assets/images/vacuamCleaner.jpg",
    title: "Xiaomi",
    subTitel: "Robot vacuum cleaner",
  ),
  HomeDevices(
    image: "assets/images/light.png",
    title: "Lightstar",
    subTitel: "Desk lamp",
  ),
  HomeDevices(
    image: "assets/images/Audio Players.jpg",
    title: "Alice",
    subTitel: "Speaker column",
  ),
  HomeDevices(
    image: "assets/images/bork.png",
    title: "Brok V530",
    subTitel: "Robot vacuum cleaner",
  ),
  HomeDevices(
    image: "assets/images/StarLightbulb.jpg",
    title: "Smart Bulb-2",
    subTitel: "Smart light bulb",
  ),
  HomeDevices(
    image: "assets/images/smartkettle.jpg",
    title: "Goldair kettle",
    subTitel: "Wifi kettle",
  ),
];
