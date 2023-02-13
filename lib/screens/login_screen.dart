import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/screens/sign_up_screen.dart';
//import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';
import '../resources/auth_metod.dart';
import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = true;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await authMethod().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == "success") {
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      //
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigateToSingnUp() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
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
          InkWell(
            onTap: loginUser,
            child: Container(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Text("Login"),
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
                onTap: navigateToSingnUp,
                child: Container(
                  child: Text(
                    " Sign Up",
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
