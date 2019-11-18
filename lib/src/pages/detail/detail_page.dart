import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:youtube_player/youtube_player.dart';
class DetailPage extends StatefulWidget {
  DetailPage({Key key, @required this.judul, @required this.desc, @required this.video, @required this.gambar}) : super(key: key);

  final String judul;
  final String desc;
  final String video;
  final String gambar;

  
  @override
  _DetailPageState createState() => _DetailPageState(judul: this.judul, desc: this.desc, video: this.video, gambar: this.gambar);
}

class _DetailPageState extends State<DetailPage> {

  _DetailPageState({this.judul, this.desc, this.video, this.gambar});
  final String judul;
  final String desc;
  final String video;
  final String gambar;

  // const DetailPage({Key key, @required this.judul, @required this.desc, @required this.video, @required this.gambar}) : super(key: key);
  
  YoutubePlayerController _controller;
  String videoId;

  

  @override
void initState(){
  videoId = YoutubePlayer.convertUrlToId(video);
    _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
            mute: false,
            autoPlay: true,
            forceHideAnnotation: true,
        ),
    );
    super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: BoxDecoration(
              color: Colors.black26
            ),
            height: 400,
            child: Image.asset(gambar, fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0,bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: Text(
                    judul,
                    style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                      // child: Text(
                      //   "8.4/85 reviews",
                      //   style: TextStyle(color: Colors.white, fontSize: 13.0),
                      // ),
                    ),
                    Spacer(),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // const SizedBox(height: 30.0),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: RaisedButton(
                      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      //     color: Colors.purple,
                      //     textColor: Colors.white,
                      //     child: Text("Back Home", style: TextStyle(
                      //       fontWeight: FontWeight.normal
                      //     ),),
                      //     padding: const EdgeInsets.symmetric(
                      //       vertical: 16.0,
                      //       horizontal: 32.0,
                      //     ),
                      //     onPressed: () {},
                      //   ),
                      // ),
                      // const SizedBox(height: 30.0),
                      Text("Deksripsi".toUpperCase(), style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text(
                          desc, textAlign: TextAlign.justify, style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14.0
                          ),),
                      const SizedBox(height: 10,),
                      YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        onReady: () {
                          print('Player is ready.');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text("DETAIL",style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
