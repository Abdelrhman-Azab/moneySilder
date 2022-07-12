import 'package:flutter/material.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({Key? key}) : super(key: key);

  @override
  _TextFieldScreenState createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          margin: const EdgeInsets.all(10),
          child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Phone number",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
              ),
              onTap: () {}),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          margin: const EdgeInsets.all(10),
          child: TextFormField(

              obscureText: !isVisible,
              decoration: InputDecoration(
                border: InputBorder.none,
                
                labelText: "Password",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
                suffixIcon: InkWell(
                  child: isVisible
                      ? Icon(
                          Icons.visibility,
                          color: Colors.grey[700],
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Colors.grey[700],
                        ),
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                ),
              ),
              onTap: () {}),
        )
      ],
    ));
  }
}

// Widget myTextField(
//         {required String label,
//         bool isPassword = false,
//         Function? passwordVisabilty ,
//         TextInputType keyboardType = TextInputType.name}) =>
//     Container(
//       padding: const EdgeInsets.symmetric(horizontal: 4),
//       margin: const EdgeInsets.all(10),
//       child: TextFormField(

//           // validator: (value) {
//           //   if (value!.isEmpty) {
//           //     return "validateMessage";
//           //   }
//           // },
//           // controller: controller,

//           obscureText: isPassword,
//           keyboardType: keyboardType,
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             labelText: label,
//             contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//             labelStyle: TextStyle(color: Colors.black),
//             enabledBorder:
//                 OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//             focusedBorder:
//                 OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//             suffixIcon: isPassword
//                 ? InkWell(
//                     child: Icon(
//                       Icons.visibility_off,
//                       color: Colors.grey[700],
//                     ),
//                     onTap: () {},
//                   )
//                 : null,
//           ),
//           onTap: () {}),
//     );
