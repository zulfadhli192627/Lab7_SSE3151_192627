import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:private_album/model/image_detail.dart';

class PictureView extends StatelessWidget {
  int position;
  PictureView({this.position});

  @override
  Widget build(BuildContext context) {
    final pic = Provider.of<List<ImageDetails>>(context) ?? [];

    return Container(
      padding: EdgeInsets.all(50.0),
      child: Image.network(
        pic[position].url,
        fit: BoxFit.cover,
      ),
    );
  }
}
