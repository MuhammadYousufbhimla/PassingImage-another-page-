import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:passingimage/generate.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String name = "";
  XFile? image;
  final picker = ImagePicker();

  File? imageFile;
  XFile? PFile;
  File? rec;

  // /// Get from gallery
  // _getFromGallery() async {
  //   final XFile? pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //       PFile = pickedFile;
  //       rec = imageFile;
  //       print(rec);
  //     });
  //   }
  // }

  // /// Get from Camera
  // _getFromCamera() async {
  //   final XFile? pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.camera,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //       PFile = pickedFile;
  //       rec = imageFile;
  //       print(rec);
  //     });
  //   }
  // }

  Future _getFromCamera() async {
    image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      image = image;
      print(image!.path);
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GeneratePage(
                  imagename: File(image!.path),
                )));
  }

  Future _getFromGallery() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      image = image;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GeneratePage(
                  imagename: File(image!.path),
                )));
  }

  @override
  Widget build(BuildContext context) {
    List title = ['Hardware', 'Software'];

    return Scaffold(
      backgroundColor: Color(0xfff3edf9),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
            child: Column(children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.23,
                decoration: BoxDecoration(
                  color: Color(0xff8440fa),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      color: Color(0xff8440fa),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 4),
                        leading: InkWell(
                          onTap: () {
                            print("attribue page");
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xffab8ce5),
                          ),
                        ),
                        title: Text(
                          'System',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xfff3edf9)),
                        ),
                        trailing: Icon(
                          Icons.account_circle,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Good Morning,',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w200,
                            color: Color(0xfff3edf9)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: (Text(
                        "Yousuf",
                        style: TextStyle(
                          fontSize: 26.0,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Software Detect',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff3f3754),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Column(children: [
                      GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 02,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 200,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                print("object");

                                setState(() {
                                  if (index == 0) {
                                    name = title[0];

                                    print(name);
                                  } else if (index == 1) {
                                    name = title[1];

                                    print(name);
                                  }
                                  selectedPhoto(context);
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.01,
                                    right: MediaQuery.of(context).size.height *
                                        0.01,
                                    bottom: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01,
                                    bottom: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    // color: Colors.white,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xff352c56).withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          title[index],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff3f3754),
                                          ),
                                        ),
                                      ),
                                      // Container(
                                      //     child: (image != null)
                                      //         ? Container(
                                      //             height: MediaQuery.of(context)
                                      //                     .size
                                      //                     .height *
                                      //                 0.15,
                                      //             width: MediaQuery.of(context)
                                      //                 .size
                                      //                 .width,
                                      //             decoration: BoxDecoration(
                                      //               image: DecorationImage(
                                      //                 image: FileImage(
                                      //                     File(image!.path)),
                                      //                 fit: BoxFit.fill,
                                      //               ),
                                      //             ))
                                      //         : Container(
                                      //             height: MediaQuery.of(context)
                                      //                     .size
                                      //                     .height *
                                      //                 0.15,
                                      //             width: MediaQuery.of(context)
                                      //                 .size
                                      //                 .width,
                                      //             decoration: BoxDecoration(),
                                      //           )),
                                      // Text("data")
                                    ],
                                  )),
                            );
                          })
                    ])
                  ],
                ),
              ),
              // SizedBox(
              //   height: 20.0,
              // ),
            ]),
          ),
        ),
      ),
    );
  }

  void selectedPhoto(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Center(
                  child: Text(
                "$name",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              )),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () async {
                            Navigator.of(context).pop();
                            _getFromGallery();
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.05,
                                left: MediaQuery.of(context).size.width * 0.05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.upload_file,
                                  color: Color(0xff3f3754),
                                  size: 40,
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0xff8440fa).withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Upload file',
                                  style: TextStyle(
                                      color: Color(0xff3f3754),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.of(context).pop();
                            _getFromCamera();
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.05,
                                left: MediaQuery.of(context).size.width * 0.05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  color: Color(0xff3f3754),
                                  size: 40,
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0xff8440fa).withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Camera",
                                  style: TextStyle(
                                      color: Color(0xff3f3754),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ]));
      });
}
