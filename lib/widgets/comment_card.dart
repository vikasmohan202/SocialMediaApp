import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({super.key});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1674786272837-1017cad0f47a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .7,
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'write the caption', border: InputBorder.none),
              maxLines: 8,
            ),
          ),
          SizedBox(
            height: 45,
            width: 45,
            child: AspectRatio(
              aspectRatio: 487 / 451,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1675026918756-3413844ea9e5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'),
                  fit: BoxFit.fill,
                  alignment: FractionalOffset.topLeft,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
