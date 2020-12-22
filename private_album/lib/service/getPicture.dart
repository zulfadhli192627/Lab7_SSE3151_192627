import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:private_album/model/image_detail.dart';

class GetPicture extends ChangeNotifier {
  final Query picCollection = Firestore.instance
      .collection('images')
      .orderBy('createdAt', descending: true);

  GetPicture();

  // convert to list from snapshot
  List<ImageDetails> _picFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ImageDetails(
          fileName: doc.data['name'] ?? 'Not found',
          desc: doc.data['desc'] ?? 'Not found',
          url: doc.data['url'] ?? 'Not found',
          createdAt: doc.data['createdAt'] ?? 'Not found');
    }).toList();
  }

  // get streams of data
  Stream<List<ImageDetails>> get pic {
    return picCollection.snapshots().map(_picFromSnapshot);
  }
}
