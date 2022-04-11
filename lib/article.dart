import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Article {
  
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String location;
  late String images1;
  late String images2;
  late String images3;
  late double rating ;
  //Menu
  late String menu1 ;
  late String menu2 ;
  late String menu3 ;
  late String harga1 ;
  late String harga2 ;
  late String harga3 ;
  
  
 
  Article({
    
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.location,
    required this.images1,
    required this.images2,
    required this.images3,
    required this.rating,
    required this.menu1,
    required this.menu2,
    required this.menu3,
    required this.harga1,
    required this.harga2,
    required this.harga3,
    
    
    
  });

  Article.fromJson(Map<String?, dynamic?> article) {
    
    title = article['title'];
    description = article['description'];
    url = article['url'];
    urlToImage = article['urlToImage'];
    location = article['location'];
    images1 = article['images1'] ;
    images2 = article['images2'] ;
    images3 = article['images3'] ;
    rating = article['rating'];
    menu1 = article['menu1'];
    menu2 = article['menu2'];
    menu3 = article['menu3'];
    harga1 = article['harga1'];
    harga2 = article['harga2'];
    harga3 = article['harga3'];

}
}

List<Article> parseArticles(String? json) {
  if (json == null) {
    return [];
  }
 
 
  final List parsed = jsonDecode(json);
  return parsed.map((json) => Article.fromJson(json)).toList();
}