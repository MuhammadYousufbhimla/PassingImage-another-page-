import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class GeneratePage extends StatefulWidget {
  GeneratePage({super.key, this.image});

  final File? image;
  File? imageFile;
  @override
  State<GeneratePage> createState() => _GeneratePageState(image: null);
}

class _GeneratePageState extends State<GeneratePage> {
  _GeneratePageState({
    Key? key,
    required this.image,
  });
  Widget? _child;
  bool loading = false;
  final picker = ImagePicker();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3edf9),
      appBar: AppBar(
        backgroundColor: Color(0xff8440fa),
        centerTitle: true,
        title: Text(
          "Testing Memo..",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            color: Colors.white,
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              SizedBox(
                height: 80.0,
              ),
              Stack(
                children: [
                  Container(
                    child: (image != null)
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.28,
                            width: MediaQuery.of(context).size.width * 0.75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                image: FileImage(File(image!.path)),
                                fit: BoxFit.fill,
                              ),
                            ))
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.27,
                            width: MediaQuery.of(context).size.width * 0.77,
                            decoration: BoxDecoration(
                              color: Color(0xff8440fa),
                              borderRadius: BorderRadius.circular(25),
                            )),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              CircularProgressIndicator(
                color: Color.fromARGB(255, 10, 84, 143),
                strokeWidth: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
