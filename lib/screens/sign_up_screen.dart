import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_metod.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:provider/provider.dart';

import '../widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoding = true;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Flexible(
            child: Container(),
            flex: 2,
          ),
          //svg image
          SvgPicture.asset(
            "assets/image.svg",
            color: primaryColor,
            height: 64,
          ),
          const SizedBox(
            height: 64,
          ),

          Stack(
            children: [
              _image != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlNJUXMTbhOHehoX6TPOGMw2vYKaAPuCjq-k_4tT2t&s"),
                    ),
              Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(Icons.add_a_photo),
                  ))
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          //textfield input for userr name
          TextFieldInput(
            textEditingController: _usernameController,
            hintText: "Enter your username",
            textInputType: TextInputType.text,
          ),
          const SizedBox(
            height: 12,
          ),
          //textfield input for email
          TextFieldInput(
            textEditingController: _emailController,
            hintText: "Enter Your Email address",
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 12,
          ),
          //textfield input for password
          TextFieldInput(
            textEditingController: _passwordController,
            hintText: "Enter Your password",
            textInputType: TextInputType.text,
            isPass: true,
          ),
          const SizedBox(
            height: 12,
          ),
          TextFieldInput(
            textEditingController: _bioController,
            hintText: "Enter your bio",
            textInputType: TextInputType.text,
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () async {
              // String res = await authMethod().signUpUser(
              //     email: _emailController.text,
              //     password: _passwordController.text,
              //     username: _usernameController.text,
              //     bio: _bioController.text,
              //     file: _image!,);
              context.read<authMethod>().signUpUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                  username: _usernameController.text,
                  bio: _bioController.text,
                  file: _image!);
            },
            child: Container(
              child: const Text("SignUp"),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  color: Colors.blue),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Flexible(
            child: Container(),
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Don't have a account",
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              GestureDetector(
                onTap: navigateToLogin,
                child: Container(
                  child: Text(
                    " Login",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ],
          )
          //button Login
        ]),
      ),
    ));
  }
}
