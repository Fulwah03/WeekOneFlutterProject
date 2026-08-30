 import 'package:flutter/foundation.dart';

class AroundSaudiModel{
String? name;
String? location;
String? category;
String? image;
String? description;
String? bestTime;
String? experience;
AroundSaudiModel({this.name,this.location,this.category,this.image,this.description,this.bestTime,this.experience});

factory AroundSaudiModel.fromJson(Map <String,dynamic> json){
  return AroundSaudiModel(
      name: json["name"],
      location: json["location"],
      category: json["category"],
      image: json["image"],
      description: json["description"],
      bestTime: json["bestTime"],
      experience: json["experience"],
    );
}

}