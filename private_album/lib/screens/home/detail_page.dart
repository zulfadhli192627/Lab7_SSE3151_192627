import 'package:flutter/material.dart';
import 'package:private_album/model/image_detail.dart';
import 'package:private_album/service/descView.dart';
import 'package:private_album/service/pictureView.dart';
import 'package:provider/provider.dart';
import 'package:private_album/service/getPicture.dart';

class DetailsPage extends StatelessWidget {
  int index;
  var position = [0, 1, 2, 3];
  DetailsPage({this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamProvider<List<ImageDetails>>.value(
          value: GetPicture().pic,
          child: Container(
            child: Column(
              children: <Widget>[
                Hero(
                  tag: index,
                  child: Expanded(
                    child: PictureView(
                      position: position[index],
                    ),
                  ),
                ),
                Container(
                  height: 260,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            DescView(position: position[index]),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              padding: EdgeInsets.symmetric(vertical: 15),
                              color: Colors.lightBlueAccent,
                              child: Text(
                                'Back',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
