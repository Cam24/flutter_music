import 'package:flutter/material.dart';

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing"),
        actions: [Icon(Icons.search)],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.black,
        child: ListView(
          children: [
            Row(
              children: [Icon(Icons.add), Spacer(), Icon(Icons.send)],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Hero(
                tag: "album",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/p2.jpg",
                    fit: BoxFit.cover,
                    height: 400,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "Counting Stars",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Onerepublic Native",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text("1:03"),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Slider(
                    activeColor: Colors.red,
                    onChanged: (d) {},
                    value: 30,
                    min: 0,
                    max: 100,
                  ),
                ),
                Text("4:12")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_left,
                  size: 50,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.pause_circle_outline,
                  size: 70,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.arrow_right,
                  size: 50,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
