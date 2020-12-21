import 'package:flutter/material.dart';
import 'package:private_album/model/image_detail.dart';
import 'package:private_album/screens/home/add_image.dart';
import 'package:provider/provider.dart';
import 'detail_page.dart';
import 'package:private_album/service/pictureView.dart';
import 'package:private_album/service/getPicture.dart';

class DashboardScreen extends StatelessWidget {
  var position = [0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: StreamProvider<List<ImageDetails>>.value(
        value: GetPicture().pic,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Text(
                'Gallery',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      return RawMaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                index: index,
                              ),
                            ),
                          );
                        },
                        child: PictureView(
                          position: position[index],
                        ),
                      );
                    },
                    itemCount: position.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddImage()));
          ;
        },
        label: Text('Add Photo'),
        icon: Icon(Icons.upload_file),
      ),
    );
  }
}
