import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:provider/provider.dart';
import '../providers/user_providers.dart';
import '../resources/firebase_firestore_method.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  final TextEditingController _discriptionController = TextEditingController();
  void postImage(
    String uid,
    String username,
    String profImage,
  ) async {
    try {
      String res = await FirestoreMethod().uploadPost(
        _discriptionController.text,
        _file!,
        uid,
        username,
        profImage,
      );
      if (res == 'success') {
        showSnackBar("Posted", context);
      } else {
        showSnackBar(res, context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('create a post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text("Take a Photos"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text("Select a Photos from Gallery"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _discriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProviders userProvider = Provider.of<UserProviders>(context);
    return _file == null
        ? Center(
            child: IconButton(
              icon: const Icon(Icons.upload),
              onPressed: () => _selectImage(context),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: null,
              ),
              title: const Text("To post"),
              centerTitle: false,
              actions: [
                TextButton(
                  onPressed: () => postImage(
                      userProvider.getUser!.username,
                      userProvider.getUser!.uid,
                      userProvider.getUser!.photoUrl),
                  child: Text(
                    "Post",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
            body: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(userProvider.getUser!.photoUrl),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "write a caption..",
                        border: InputBorder.none,
                      ),
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
                          image: MemoryImage(_file!),
                          fit: BoxFit.fill,
                          alignment: FractionalOffset.topCenter,
                        )),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 10,
                  ),
                ]),
          );
  }
}
