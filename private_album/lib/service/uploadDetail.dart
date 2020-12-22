import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadDetail extends StatelessWidget {
  UploadDetail({this.desc, this.fileName});
  String fileName, desc;

  final CollectionReference photoStore =
      Firestore.instance.collection('images');

  void _uploadDetail() async {
    dynamic url = await FirebaseStorage.instance
        .ref()
        .child('images')
        .child(fileName)
        .getDownloadURL();
    print(url);
    // upload detail
    photoStore.document(fileName).setData({
      'name': fileName,
      'desc': desc,
      'url': url,
      'createdAt': DateTime.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    _uploadDetail();
    return Text('Success');
  }
}
