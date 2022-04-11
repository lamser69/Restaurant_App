import 'dart:ffi';
import './styles.dart';

import 'package:flutter/material.dart';
import 'package:restaurant_app/article.dart';
import 'package:restaurant_app/detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
  colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: primaryColor,
        onPrimary: Colors.black,
        secondary: secondaryColor,
      ),
),
      initialRoute: RestoListPage.routeName,
      routes: {
        RestoListPage.routeName: (context) => RestoListPage(),
        RestoDetailPage.routeName: ((context) => RestoDetailPage(
              article: ModalRoute.of(context)?.settings.arguments as Article,
            )
            )
      },
    );
  }
}

class RestoListPage extends StatelessWidget {
  const RestoListPage({Key? key}) : super(key: key);
  static const routeName = '/restaurant_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant", ),
      ),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/articles.json'),
        builder: (context, snapshot) {
          final List<Article> articles = parseArticles(snapshot.data);
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return _buildArticleItem(context, articles[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildArticleItem(BuildContext context, Article article) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(
        article.urlToImage,
        width: 100,
      ),
      title: Text(article.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 17,
              ),
              Text(
                article.location,
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          Divider(
            height: 7,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 15,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                size: 15,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                size: 15,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                size: 15,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                size: 15,
                color: Colors.amber,
              ),
            ],
          ),
          
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, RestoDetailPage.routeName,
            arguments: article);
      },
    );
  }
}
