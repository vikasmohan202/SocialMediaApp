import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';
import '../widgets/comment_card.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text("commentScreen"),
        centerTitle: false,
      ),
      body: CommentCard(),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: EdgeInsets.only(left: 15, right: 8),
          child: Row(children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1661961111184-11317b40adb2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80"),
              radius: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16,right: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'comment as username',
                    border: InputBorder.none,

                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8,
                horizontal: 8),
                child: const Text('Post', style: TextStyle(
                  color: blueColor
                ),),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
