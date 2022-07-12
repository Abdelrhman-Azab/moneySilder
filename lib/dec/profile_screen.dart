import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text("Add Photo"),
        leading: GestureDetector(child: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.6,
                width: double.infinity,
              ),
              Container(
                alignment: Alignment.center,
                height: size.height * 0.3,
                color: Colors.blue,
              ),
              Positioned(
                top: size.height * 0.3 - 100,
                left: 50,
                right: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: kElevationToShadow[1]),
                      height: 200,
                      width: size.width * 0.5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                            'https://meragor.com/files/styles//ava_800_800_wm/brendy-fon-futbol-logotipy-16011.jpg',
                          ))),
                      height: 200,
                      width: size.width * 0.5 - 20,
                    ),
                    Positioned(
                      right: size.width * 0.14,
                      bottom: size.height * 0.02,
                      child: GestureDetector(
                        onTap: () {
                          print("Camera");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          height: 45,
                          width: 45,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: size.height * 0.08,
                left: 0,
                right: 0,
                child: Center(
                  child: const Text(
                    "Update your profile picture",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.35, vertical: 15),
                  child: Text(
                    "Save",
                    style: TextStyle(fontSize: 18),
                  )))
        ],
      ),
    );
  }
}
