import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_providers.dart';
import 'package:instagram_clone/resources/auth_metod.dart';
import 'package:instagram_clone/responces/mobile_screen_layout.dart';
import 'package:instagram_clone/responces/responcive_layout_screen.dart';
import 'package:instagram_clone/responces/web_screen_layout.dart';
import 'package:instagram_clone/screens/comment_Screen.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/sign_up_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import './screens/login_screen.dart';
import './screens/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        messagingSenderId: "132387743472",
        appId: "1:132387743472:web:a3b3a2353d068d863f8435",
        projectId: "instagram-clone-9118a",
        apiKey: "AIzaSyAgWLSJlU6wVHyk0bpl0dzoID1OgC8UuE4",
        storageBucket: "instagram-clone-9118a.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<authMethod>(create: (context) => authMethod()),
        ChangeNotifierProvider(create: (context) => UserProviders())
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',

        theme: ThemeData.dark().copyWith(
          backgroundColor: mobileBackgroundColor,
        ),
        home: SignUpScreen(),
        // home: const ResponsiveLayout(
        //   mobileScreenLayout: WebScreenLayout(),
        //   webScreenLayout: MobileScreenLayout(),
        // ),
        // home: MobileScreenLayout(),
        // home: StreamBuilder(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.active) {
        //       if (snapshot.hasData) {
        //         return ResponsiveLayout(
        //             webScreenLayout: WebScreenLayout(),
        //             mobileScreenLayout: MobileScreenLayout());
        //       } else if (snapshot.hasError) {
        //         return Center(
        //           child: Text('${snapshot.error}'),
        //         );
        //       }
        //     }
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(
        //         child: CircularProgressIndicator(
        //           color: primaryColor,
        //         ),
        //       );
        //     }
        //     return LoginScreen();
        //   },
        // ),
      ),
    );
  }
}
