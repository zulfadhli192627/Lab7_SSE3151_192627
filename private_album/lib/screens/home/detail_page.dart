import 'package:flutter/material.dart';
import 'package:private_album/model/image_detail.dart';
import 'package:private_album/service/updateImage.dart';
import 'package:private_album/service/descView.dart';
import 'package:private_album/service/pictureView.dart';
import 'package:provider/provider.dart';
import 'package:private_album/service/getPicture.dart';

class DetailsPage extends StatelessWidget {
  int index;
  DetailsPage({this.index});

  @override
  Widget build(BuildContext context) {
    void showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              //  child: SettingsForm(),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Image Description",
          style: TextStyle(color: Colors.white60),
        ),
        backgroundColor: Colors.black54,
        centerTitle: true,
      ),
      body: StreamProvider<List<ImageDetails>>.value(
          value: GetPicture().pic,
          child: Container(
            child: Column(
              children: <Widget>[
                PictureView(
                  position: index,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Column(
                          children: <Widget>[
                            DescView(position: index),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {},
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Icon(Icons.edit),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 15, 10),
                          ),
                          DeleteImage(
                            position: index,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
