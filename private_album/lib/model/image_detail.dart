import 'package:cloud_firestore/cloud_firestore.dart';

class ImageDetails {
  final String fileName;
  final String desc;
  final String url;
  final String location;
  final Timestamp createdAt;

  ImageDetails({
    this.desc,
    this.fileName,
    this.url,
    this.location,
    this.createdAt,
  });
}
