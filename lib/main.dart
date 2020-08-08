import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_app/playpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  var tabbarController;
  var selectIndex = 0;
  @override
  void initState() {
    super.initState();
    tabbarController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
          child: Container(
            height: 40,
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.2)),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20,
                  ),
                  hintText: "Search album,song...",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              child: Image.asset(
                "assets/avatar.png",
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: ListView(
              children: [
                Text(
                  "Hot Recommended",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      RecommentCard(
                        image: Random().nextInt(7) + 1,
                      ),
                      RecommentCard(
                        image: Random().nextInt(7) + 1,
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Hot Playlists",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 25,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.white,
                        onPressed: () {},
                        child: Text(
                          "View All",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 2),
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "album"
                    ),
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "a"
                    ),
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "b"
                    ),
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "c"
                    ),
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "d"
                    ),
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "e"
                    ),
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "f"
                    ),
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "g"
                    )
                  ],
                ),
                Text(
                  "Our Choises for you",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TabBar(
                  controller: tabbarController,
                  indicatorColor: Colors.pink,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 5,
                  tabs: [
                    Tab(
                      child: Text("Songs"),
                    ),
                    Tab(
                      child: Text("Playlists"),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: LimitedBox(
                    maxHeight: 400,
                    child: TabBarView(
                      controller: tabbarController,
                      children: [
                        ListView(
                          shrinkWrap: true,
                          children: [
                            ChoisesCard(
                              image: Random().nextInt(7) + 1,
                            ),
                            ChoisesCard(
                              image: Random().nextInt(7) + 1,
                            ),
                            ChoisesCard(
                              image: Random().nextInt(7) + 1,
                            ),
                            ChoisesCard(
                              image: Random().nextInt(7) + 1,
                            ),
                            ChoisesCard(
                              image: Random().nextInt(7) + 1,
                            ),
                            ChoisesCard(
                              image: Random().nextInt(7) + 1,
                            )
                          ],
                        ),
                        ListView(
                          children: [
                            ChoisesCard(
                              image: Random().nextInt(7) + 1,
                            ),
                            ChoisesCard(
                              image: Random().nextInt(7) + 1,
                            ),
                            ChoisesCard(
                              image: Random().nextInt(7) + 1,
                            ),
                            ChoisesCard(
                              image: Random().nextInt(7) + 1,
                            ),
                            ChoisesCard(
                              image: Random().nextInt(7) + 1,
                            ),
                            ChoisesCard(
                              image: Random().nextInt(7) + 1,
                            ),
                            ChoisesCard(
                              image: Random().nextInt(7) + 1,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Text(
                        "Hot Singers",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 25,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.white,
                          onPressed: () {},
                          child: Text(
                            "View All",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 2),
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "2",
                    ),
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "3",
                    ),
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "4",
                    ),
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "5",
                    ),
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "6",
                    ),
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "7",
                    ),
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "8",
                    ),
                    HotPlayListCard(
                      image: Random().nextInt(7) + 1,tag: "9",
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: NavigateBottomItem(
                            icon: Icons.history,
                            title: "Discover",
                          )),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: NavigateBottomItem(
                            icon: Icons.album,
                            title: "Albums",
                          )),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: NavigateBottomItem(
                            icon: Icons.music_note,
                            title: "My Songs",
                          )),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: NavigateBottomItem(
                            icon: Icons.account_circle,
                            title: "Profile",
                          ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NavigateBottomItem extends StatelessWidget {
  final icon;
  final String title;
  NavigateBottomItem({this.icon, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
          ),
          Text(
            title.toUpperCase(),
          )
        ],
      ),
    );
  }
}

class RecommentCard extends StatelessWidget {
  final image;
  RecommentCard({this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/p$image.jpg",
              height: 150,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "Sound of water",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text("Denise Brewer")
        ],
      ),
    );
  }
}

class HotPlayListCard extends StatefulWidget {
  final image;
  final tag;
  HotPlayListCard({this.image,this.tag});
  @override
  _HotPlayListCardState createState() => _HotPlayListCardState();
}

class _HotPlayListCardState extends State<HotPlayListCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayPage(),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(tag: widget.tag,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/p${widget.image}.jpg")),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "My Classic List",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    size: 15,
                  ),
                  Text("100"),
                  Spacer(),
                  Icon(
                    Icons.track_changes,
                    size: 15,
                  ),
                  Text("10 Tracks")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChoisesCard extends StatelessWidget {
  final image;
  ChoisesCard({this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/p$image.jpg",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Counting Stars",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  "OneRepublic Native",
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),
                )
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [Icon(Icons.favorite), Text("200")],
          )
        ],
      ),
    );
  }
}
