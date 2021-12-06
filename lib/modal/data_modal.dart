import 'package:flutter/material.dart';

class DataModal {
  String? name;
  String? img;
  int? price;
  int? people;
  double? stars;
  String? description;
  String? location;

  DataModal({
    @required this.name,
    @required this.img,
    @required this.price,
    @required this.people,
    @required this.stars,
    @required this.description,
    @required this.location,
  });

  factory DataModal.fromJson(Map<String, dynamic> json) {
    return DataModal(
      name: json['name'],
      img: json['img'],
      price: json['price'],
      people: json['people'],
      stars: json['stars'],
      description: json['description'],
      location: json['location'],
    );
  }
}
