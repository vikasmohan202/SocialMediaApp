import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
              .copyWith(right: 0),
          child: Row(children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1661961110218-35af7210f803?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'username',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        shrinkWrap: true,
                        children: ['delete']
                            .map((e) => InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 16),
                                    child: Text(e),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.abc_outlined,
                  color: Colors.white,
                )),
                  
          ]),
        ),
        //Image Section
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          width: double.infinity,
          child: Image.network(
            'https://images.unsplash.com/photo-1661961110218-35af7210f803?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
            fit: BoxFit.cover,
          ),
        ),
        // LIKE COMMENT SECTION
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.comment_outlined,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                )),
            Expanded(
                child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: const Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
            )),
            //descripation and number of comments
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w900),
                    child: Text(
                      "1254 likes",
                      style: Theme.of(context).textTheme.bodyText2,
                    )),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                      text: TextSpan(
                          style: const TextStyle(color: primaryColor),
                          children: [
                        TextSpan(
                          text: " Hey this is the disctription",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ])),
                ),
                InkWell(
                  onDoubleTap: () {
                    print("hi");
                  },
                  child: Container(
                    child: Text(
                      " View all 200 comment",
                      style: const TextStyle(
                        fontSize: 16,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    " 22/12/2023",
                    style: const TextStyle(
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                ),
              ]),
        ),
      ]),
    );
  }
}
