import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/views/widget/text_input.dart';
import 'package:video_player/video_player.dart';
class ConfirmScreen extends StatefulWidget {
final File videoFile;

  final String videoPath;

  const ConfirmScreen({super.key, required this.videoFile, required this.videoPath});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  TextEditingController songController= TextEditingController();
  TextEditingController captionController= TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      controller=VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: SingleChildScrollView(
       child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height/1.5 ,
              child: VideoPlayer(controller),
            ),
            const SizedBox(height: 30,),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 10) ,
                    width: MediaQuery.of(context).size.width-20,
                    child: TextInputField(controller: songController, lableText: 'Song Name', isObscure: false, icon:Icons.music_note),
                  ),
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 10) ,
                    width: MediaQuery.of(context).size.width-20,
                    child: TextInputField(controller: captionController, lableText: 'Caption', isObscure: false, icon:Icons.closed_caption),
                  ),
                  const SizedBox( height: 10,),
                  ElevatedButton(onPressed: (){}, child: Text('Shere !', style: TextStyle(fontSize: 20,color: Colors.white),))
                ],
              ),
            )
          ],
       ),
     ),
    );
  }
}