import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context)
      .showSnackBar(new SnackBar(content: new Text(msg)));
}

Future<List<File>> pickImages() async {
  List<File> imageList = [];
  try {
    print("Mohit" + imageList.toString());
    final fileList = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: true);
    print("Mohit" + fileList.toString());
    if (fileList != null && fileList.files.isNotEmpty) {
      for (int i = 0; i < fileList.files.length; i++) {
        print("Mohit" + fileList.files[i].path!);
        imageList.add(new File(fileList.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  print(imageList);
  return imageList;
}
