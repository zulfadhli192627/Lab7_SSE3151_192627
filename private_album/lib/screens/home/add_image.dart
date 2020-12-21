import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:private_album/service/database.dart';
import 'package:private_album/shared/constants.dart';

class AddImage extends StatefulWidget {
  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File imageFile;
  final picker = ImagePicker();
  String _description;

  Future _chooseSource(ImageSource source) async {
    final selected = await picker.getImage(source: source);
    setState(() {
      if (selected != null) {
        imageFile = File(selected.path);
      } else {
        imageFile = null;
      }
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select Source'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Gallery'),
                    onTap: () {
                      _chooseSource(ImageSource.gallery);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      _chooseSource(ImageSource.camera);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  void _clear() {
    setState(() {
      imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              imageFile != null
                  ? Image.file(
                      imageFile,
                      width: 200,
                      height: 200,
                    )
                  : Text('No Image Selected'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      _showChoiceDialog(context);
                    },
                    child: Text('Select Image'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _clear();
                    },
                    child: Text('Clear Image'),
                  ),
                ],
              ),
              imageFile != null
                  ? Form(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Fill in Image Detail',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                  labelText: 'Caption'),
                              validator: (val) =>
                                  val.isEmpty ? 'Enter Description' : null,
                              onChanged: (val) =>
                                  setState(() => _description = val),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Uploader(
                              file: imageFile,
                              desc: _description,
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
