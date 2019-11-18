import 'package:flutter/material.dart';
import 'package:germas/src/pages/detail/detail_page.dart';
import 'package:germas/src/component/listMateri.dart' as list;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollController = ScrollController();
  Color appBarBackground;
  double topPosition;
  @override
  void initState() {
    topPosition = -80;
    appBarBackground = Colors.transparent;
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  double _getOpacity() {
    double op = (topPosition + 80) / 80;
    return op > 1 || op < 0 ? 1 : op;
  }

  _onScroll() {
    if (_scrollController.offset > 50) {
      if (topPosition < 0)
        setState(() {
          topPosition = -130 + _scrollController.offset;
          if (_scrollController.offset > 130) topPosition = 0;
        });
    } else {
      if (topPosition > -80)
        setState(() {
          topPosition--;
          if (_scrollController.offset <= 0) topPosition = -80;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: <Widget>[
          ListView.builder(
            controller: _scrollController,
            itemCount: list.list.length,
            itemBuilder: (context, index) {
              Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 50),
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 70),
                      Text(
                        "Awesome and simple app bar hiding animation",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24.0),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        "AWESOME",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      )
                    ],
                  ),
              
                )
                ]);
              return Column(
                children: <Widget>[
                //   Container(
                //   padding: const EdgeInsets.only(left: 16.0, right: 50),
                //   height: 190,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0)),
                //     color: Colors.white,
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisSize: MainAxisSize.min,
                //     children: <Widget>[
                //       const SizedBox(height: 70),
                //       Text(
                //         "Awesome and simple app bar hiding animation",
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold, fontSize: 24.0),
                //       ),
                //       const SizedBox(height: 20.0),
                //       Text(
                //         "AWESOME",
                //         style: TextStyle(
                //             fontSize: 16.0,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.orange),
                //       )
                //     ],
                //   ),
              
                // ),
                  Card(
                    elevation: 4.0,
                    child: Container(
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => DetailPage(gambar: list.list[index]['gambar'], judul: list.list[index]['jenis'], video: list.list[index]['video'], desc: list.list[index]['deskripsi'],)
                          ));
                        },
                        splashColor: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(height: 140, width: MediaQuery.of(context).size.width, child: Image.asset(list.list[index]['gambar'], fit: BoxFit.fitWidth)),
                              SizedBox(height: 10,),
                              Text(
                                list.list[index]['jenis'],
                                style: Theme.of(context).textTheme.headline.copyWith(color: Colors.black),
                              ),
                              Text(
                                  list.list[index]['deskripsi'].toString().substring(0,90) + '...',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              
                              Divider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.share, color: Colors.grey,),
                                    onPressed: (){},
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            top: topPosition,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              padding: const EdgeInsets.only(left: 50,top: 25.0,right: 20.0),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0)),
                color: Colors.purple.withOpacity(_getOpacity()),
              ),
              child: DefaultTextStyle(
                style: TextStyle(),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                child: Semantics(
                      child: Text(
                      'Aplikasi Gerakan Masyarakat Sehat',
                      style: TextStyle(color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.bold),
                    ),
                  header: true,
                ),
                ),
              )
          ),
          SizedBox(
            height: 80,
            child: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}