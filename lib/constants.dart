import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Constants{
  final storageRef = FirebaseStorage.instance.ref();
  get auth => FirebaseAuth.instance;
}