import 'package:flutter/material.dart';

import '../pages/full_photo_page.dart';

class PhotoItem extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String author;

  PhotoItem(
      {this.imageUrl,
      this.description,
      this.author});

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl),),
      title: Text(author, style: Theme.of(context).textTheme.title,),
      subtitle: Text(description != null ? description : ''),
      onTap: () => Navigator.of(context).pushNamed(FullPhotoPage.routeName, arguments: {'url': imageUrl, 'author': author}));

  }
}
