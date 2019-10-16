import 'package:flutter/material.dart';

import '../pages/full_photo_page.dart';

class PhotoItem extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String author;

  PhotoItem(
      {@required this.imageUrl,
      @required this.description,
      @required this.author});

  @override
  Widget build(BuildContext context) {

    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(FullPhotoPage.routeName, arguments: {'url': imageUrl, 'author': author}),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.network(
                imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 10,
                right: 5,
                child: description != null ? Container(
                  padding: const EdgeInsets.only(right: 5.0),
                  width: 250,
                  child: Text(
                    description,
                    style: TextStyle(color: Colors.white, fontFamily: 'Roboto', fontSize: 16 * curScaleFactor),
                    textAlign: TextAlign.end,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ) : Container() ,
              ),
            ],
          ),
          Container(
            height: 50,
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 0.0, right: 0.0, bottom: 0.0),
                child: Text(author, style: TextStyle(fontFamily: 'Raleway', fontSize: 20 * curScaleFactor),)),
          ),
        ],
      ),
    );
  }
}
