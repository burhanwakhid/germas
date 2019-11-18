import 'package:flutter/material.dart';
import 'package:germas/src/pages/home/home.dart';
// import 'package:youtube_player/youtube_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  YoutubePlayerController _controller;
  String videoId;
  
  @override
void initState(){
  videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=MKOxoCweCHg");
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Germas'),
        backgroundColor: Colors.purple,
      ),

      body: SafeArea(
        top: false,
        bottom: false,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/logo/logo_germas.png', width: MediaQuery.of(context).size.width/2-50,),
                SizedBox(height: 10,),
                Text('GERMAS adalah sebuah gerakan yang bertujuan untuk memasyarakatkan budaya hidup sehat serta meninggalkan kebiasaan dan perilaku masyarakat yang kurang sehat. Aksi GERMAS ini juga diikuti dengan memasyarakatkan perilaku hidup bersih sehat dan dukungan untuk program infrastruktur dengan basis masyarakat', 
                style: TextStyle(color: Colors.grey),),
                SizedBox(height: 10,),
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    print('Player is ready.');
                  },
              ),
                SizedBox(height: 15,),
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.purple,
                  textColor: Colors.white,
                  child: Text("3 Langkah Germas", style: TextStyle(
                    fontWeight: FontWeight.normal
                  ),),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Home()
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}

// class LandingPage extends StatelessWidget {
//   YoutubePlayerController _controller;

//   @override
// void initState(){
//     _controller = YoutubePlayerController(
//         initialVideoId: 'iLnmTe5Q2Qw',
//         flags: YoutubePlayerFlags(
//             mute: false,
//             autoPlay: true,
//             forceHideAnnotation: true,
//         ),
//     );
//     super.initState();
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Germas'),
//         backgroundColor: Colors.purple,
//       ),

//       body: SafeArea(
//         top: false,
//         bottom: false,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Image.asset('assets/logo/logo_germas.png', width: MediaQuery.of(context).size.width/2-50,),
//                 SizedBox(height: 10,),
//                 Text('GERMAS adalah sebuah gerakan yang bertujuan untuk memasyarakatkan budaya hidup sehat serta meninggalkan kebiasaan dan perilaku masyarakat yang kurang sehat. Aksi GERMAS ini juga diikuti dengan memasyarakatkan perilaku hidup bersih sehat dan dukungan untuk program infrastruktur dengan basis masyarakat', 
//                 style: TextStyle(color: Colors.grey),),
//                 SizedBox(height: 10,),
//                 YoutubePlayer(
//                        context: context,
//                        source: "szJw2rxkmPM",
//                        quality: YoutubeQuality.HIGH
//                      ),
//                 SizedBox(height: 15,),
//                 RaisedButton(
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//                   color: Colors.purple,
//                   textColor: Colors.white,
//                   child: Text("3 Langkah Germas", style: TextStyle(
//                     fontWeight: FontWeight.normal
//                   ),),
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 16.0,
//                     horizontal: 32.0,
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => Home()
//                     ));
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
      
//     );
//   }
// }
