import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Image_pic extends StatefulWidget {
  const Image_pic({Key? key}) : super(key: key);

  @override
  State<Image_pic> createState() => _Image_picState();
}

class _Image_picState extends State<Image_pic> {
  final ImagePicker _picker = ImagePicker();
  String imagePath = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Image Picker",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: imagePath.isNotEmpty
                ? Image.file(
                    File(imagePath),
                    height: 200,
                    width: 200,
                    alignment: Alignment.center,
                  )
                : Image.network(
                    'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png',height: 200,width: 200,fit: BoxFit.fill,),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text("Select Image "),
                        children: [
                          ListTile(
                            title: Text("Camera"),
                            onTap: () async {
                              Navigator.pop(context);

                              final XFile? photo = await _picker.pickImage(
                                  source: ImageSource.camera);

                              setState(() {
                                if (photo != null) {
                                  imagePath = photo.path;
                                }
                              });
                            },
                          ),
                          ListTile(
                            title: Text("Gallary"),
                            onTap: () async {
                              Navigator.pop(context);

                              final XFile? photo = await _picker.pickImage(
                                  source: ImageSource.gallery);

                              setState(() {
                                if (photo != null) {
                                  imagePath = photo.path;
                                }
                              });
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  "Choose Image",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
