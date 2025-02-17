import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageService extends GetxController {
  late Rx<File?> pickedFile = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();

  void pickImage() async {
    final imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile == null) {
      Get.snackbar("", "Can not load image");
      return;
    }
    pickedFile.value = File(imageFile.path);
  }

  void captureImage() async {
    final imageFile = await picker.pickImage(source: ImageSource.camera);
    if (imageFile == null) {
      Get.snackbar("", "Can not load image");
      return;
    }
    pickedFile.value = File(imageFile.path);
  }
}

