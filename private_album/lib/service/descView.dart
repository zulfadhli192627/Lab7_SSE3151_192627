import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:private_album/model/image_detail.dart';

class DescView extends StatelessWidget {
  int position;
  DescView({this.position});

  @override
  Widget build(BuildContext context) {
    final pic = Provider.of<List<ImageDetails>>(context) ?? [];

    return Column(
      children: <Widget>[
        Text(
          pic[position].location,
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          pic[position].desc,
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
