import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => new _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    //80% of screen width
    double c_width = MediaQuery.of(context).size.width * 0.8;
    double grid_width = MediaQuery.of(context).size.width * 0.9;
    double height_width = MediaQuery.of(context).size.height * 0.9;
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(
        //   title: Text('Live')
        // ),
        body: SafeArea(
            top: true,
            bottom: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                image:
                                    new AssetImage("assets/images/model.jpg"),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: null,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Johndoe",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18)),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: Text("I wrote this song for my",
                        style: TextStyle(color: Colors.white))),

                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "540",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, color: Colors.white),
                      ),
                      Text(" following", style: TextStyle(color: Colors.white)),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "1240",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, color: Colors.white),
                      ),
                      Text(" followers", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),

                Tabs(refresh: () => setState(() {})),

                // Container (
                //   padding: const EdgeInsets.all(16.0),
                //   width: c_width,
                //   child: new Row (
                //     children: <Widget>[
                //       new Text ("Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 ", textAlign: TextAlign.left, style: TextStyle(color: Colors.white)),
                //       new Text ("Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2", textAlign: TextAlign.left, style: TextStyle(color: Colors.white)),
                //     ],
                //   ),
                // ),
                // Row(
                //   children: <Widget>[
                //     Flexible(
                //       child:
                //         Text("this is a very long text and i need it be so, ", style: TextStyle(color: Colors.white),),
                //     ),

                //   ],
                // ),

                value == 0
                    ? Expanded(
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //               color: Color(0xffffffff),
                        //             ),
                        // ),
                        // height: (mediaQuery.size.height - 117

                        //       ),
                        // width: grid_width,
                        // constraints: BoxConstraints.expand(),
                        child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 6.0 / 9.0,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              // height: 400,
                              decoration: BoxDecoration(
                                image: new DecorationImage(
                                  image: new AssetImage(
                                      "assets/images/fullmodel.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                // shape: BoxShape.circle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                //   border: Border.all(
                                //   color: Colors.white,
                                //   width: 2
                                // ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlutterLogo(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              // height: 400,
                              decoration: BoxDecoration(
                                image: new DecorationImage(
                                  image: new AssetImage(
                                      "assets/images/fullmodel.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                // shape: BoxShape.circle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                //   border: Border.all(
                                //   color: Colors.white,
                                //   width: 2
                                // ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlutterLogo(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlutterLogo(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlutterLogo(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlutterLogo(),
                          ),
                        ],
                      ))
                    : Container(),

                // Padding(
                //   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget> [
                //       // value == 0 ? Container(child: Text("Nearby Page", style: TextStyle(fontSize: 56, color: Colors.white))) : Container(),
                //       value == 1 ? Container(child: Text("Recent Page", style: TextStyle(fontSize: 56, color: Colors.white))) : Container(),
                //       value == 2 ? Container(child: Text("Notice Page", style: TextStyle(fontSize: 56, color: Colors.white))) : Container(),
                //     ]
                //   )
                // )
              ],
            )));
  }
}

class Tabs extends StatefulWidget {
  final Function refresh;

  Tabs({required this.refresh});

  @override
  _TabsState createState() => _TabsState();
}

int value = 0;

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            MyTab(
                text: 'Public',
                isSelected: value == 0,
                onTap: () => _updateValue(0)),
            MyTab(
                text: 'Private',
                isSelected: value == 1,
                onTap: () => _updateValue(1)),
            MyTab(
                text: 'Notice',
                isSelected: value == 2,
                onTap: () => _updateValue(2)),
          ],
        ));
  }

  void _updateValue(int newValue) {
    widget.refresh();
    setState(() {
      value = newValue;
    });
  }
}

class MyTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onTap;

  const MyTab(
      {required this.isSelected, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double view_width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                fontSize: isSelected ? 16 : 16,
                color: isSelected ? Color(0xFFFF6363) : Colors.white,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w700,
              ),
            ),
            Container(
              height: 2,
              width: view_width * 0.3 - 8,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(4),
                color: isSelected ? Color(0xFFFF6363) : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
