import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/service/image_service.dart';
import '../service/ML_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ImageService imageService = Get.put(ImageService());
  final MlService tfliteService = Get.put(MlService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vegetable Classification"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (imageService.pickedFile.value != null) {
                return Column(
                  children: [
                    Image.file(
                      imageService.pickedFile.value!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        tfliteService.classifyImage(imageService.pickedFile.value!);
                      },
                      child: const Text("Classify Image"),
                    ),
                  ],
                );
              } else {
                return const Text("No image selected");
              }
            }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                imageService.pickImage();
              },
              child: const Text("Pick Image from Gallery"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                imageService.captureImage();
              },
              child: const Text("Capture Image from Camera"),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(
              "Result: ${tfliteService.result.value}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    );
  }
}
