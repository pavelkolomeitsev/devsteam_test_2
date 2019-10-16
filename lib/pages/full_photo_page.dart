import 'package:flutter/material.dart';

class FullPhotoPage extends StatelessWidget {

  static const routeName = '/full-photo-page';

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final imageUrl = routeArgs['url'];
    final author = routeArgs['author'];

    return Scaffold(
      appBar: AppBar(title: Text(author),),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.network(imageUrl, fit: BoxFit.cover,)),
    );
  }
}
