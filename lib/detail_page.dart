import 'package:flutter/material.dart';
import 'package:restaurant_app/article.dart';

class RestoDetailPage extends StatelessWidget {
  static const routeName = '/resto_detail';

  final Article article;
  const RestoDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          article.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(article.urlToImage),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),

                  Row(
                    children: [
                      Text("Rating : ${article.rating} "),
                      Icon(Icons.star, size: 18, color: Colors.amber,
                      ),
                    ],
                  ),

                  Divider(),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 20,),
                      Text(article.location),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(article.description),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "DAFTAR MENU",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MenuInfo(article.images1, article.menu1, article.harga1),
                  MenuInfo(article.images2, article.menu2,article.harga2,),
                  MenuInfo(article.images3, article.menu3, article.harga3),
                ],
              ),
              
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuInfo extends StatelessWidget {
  MenuInfo(this.Picture, this.text1, this.text2);
  final String Picture;
  final String text1;
  final String text2;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text1, style: TextStyle(fontSize: 20),),
        SizedBox(height: 5,),
        Container(
          margin: EdgeInsets.all(10),
          height: 200,
          width: 200,
          color: Colors.grey[300],
          child: Image(image: NetworkImage(Picture),
          fit: BoxFit.cover,
          )
        ),
        
        Text(text2),
        
      ],
    );
  }
}
