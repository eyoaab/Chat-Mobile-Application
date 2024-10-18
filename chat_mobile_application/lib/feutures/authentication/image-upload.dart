import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart'; 

class ImageUploadScreen {

  File? _image;
  String? _imageUrl;

  Future<void> pickImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        // setState(() {
        //   _image = File(pickedImage.path);
        // });
        // 
        await uploadImageToFirebase(_image!);
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> uploadImageToFirebase(File imageFile) async {
    try {
      String fileName = basename(imageFile.path);
      String firebaseStoragePath = 'uploads/$fileName'; 

      FirebaseStorage storage = FirebaseStorage.instance;
      TaskSnapshot uploadTask = await storage.ref(firebaseStoragePath).putFile(imageFile);

      String downloadUrl = await uploadTask.ref.getDownloadURL();

      // setState(() {
      //   _imageUrl = downloadUrl;  
      // });

      print('Image uploaded. Download URL: $downloadUrl');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }




}
