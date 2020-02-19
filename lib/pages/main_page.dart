import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/photo.dart';
import '../widgets/photo_item.dart';
import '../widgets/loading_widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<List<Photo>> _getPhotos() async {
    var data = await http.get(
        'https://api.unsplash.com/photos/?client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9');

    var jsonData = json.decode(data.body);

    List<Photo> photos = [];

    jsonData.forEach((item) {
      Photo onePhoto = Photo(
          imageUrl: item['urls']['regular'],
          author: item['user']['name'],
          description: item['description']);
      photos.add(onePhoto);
    });

    print('photos in the list ${photos.length}');

    return photos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Devsteam test task'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getPhotos(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);

              return LoadingWidget();
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return PhotoItem(
                    imageUrl: snapshot.data[index].imageUrl,
                    description: snapshot.data[index].description,
                    author: snapshot.data[index].author,
                  );
                },
              );
            } else if (!snapshot.hasData) {
              print('Snapshot has no data');
              return LoadingWidget();
            }

            print('Any conditions work');
            return LoadingWidget();
          },
        ),
      ),
    );
  }
}
