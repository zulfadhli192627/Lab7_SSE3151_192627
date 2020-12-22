import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:private_album/model/image_detail.dart';

class DeleteImage extends StatelessWidget {
  int position;
  DeleteImage({this.position});

  @override
  Widget build(BuildContext context) {
    final pic = Provider.of<List<ImageDetails>>(context) ?? [];

    deleteImage() async {
      if (pic[position].url != null) {
        StorageReference storageReference = await FirebaseStorage.instance
            .getReferenceFromUrl(pic[position].url);
        await storageReference.delete();
      }
      await Firestore.instance
          .collection('images')
          .document(pic[position].fileName)
          .delete();
    }

    return FlatButton(
      child: Icon(Icons.delete),
      padding: EdgeInsets.symmetric(vertical: 15),
      onPressed: () {
        deleteImage();
        Navigator.pop(context);
      },
    );
  }
}
