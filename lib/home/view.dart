import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telegram/chat/view.dart';
import 'package:telegram/colors/colors.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AppColor appColor = new AppColor();
  TabController? tabController;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  AnimationController? _controller;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    _controller!.duration = Duration(seconds: 2);
    _controller!.addListener(() => setState(() {}));
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _controller!.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            key: scaffoldKey,
            body: Column(
              children: [
                customAppBar(),
                // swipeCard(),
                scrollingTabs()
              ],
            )));
  }

  Widget customAppBar() {
    return Container(
        // height: 50,
        width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Telegram",
                style: TextStyle(
                    color: appColor.primary(),
                    fontSize: 30,
                    fontFamily: 'GilroyBold'
                    // fontWeight: FontWeight.bold
                    )),
            Container(
                child: Row(
              children: [
                GestureDetector(
                    onTap: () {},
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: SvgPicture.asset('assets/svg/Plus.svg'))),
                GestureDetector(
                    onTap: () {},
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: SvgPicture.asset('assets/svg/Search.svg'))),
                GestureDetector(
                    onTap: () {},
                    child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: SvgPicture.asset('assets/svg/Menu.svg'))),
              ],
            ))
          ],
        ));
  }

  double dragPosition = 0.0;
  Widget contactList() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (conext, index) => SizedBox(height: 20),
      itemCount: _lastMessages.length,
      padding: EdgeInsets.symmetric(vertical: 30),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            swipeCard(),
            _contact(index),
            // Draggable(
            //     onDragStarted: () {},
            //     onDragUpdate: (update) {
            //       print(update.globalPosition.dx);
            //       print(update.globalPosition);
            //       // print(update.);
            //     },
            //     affinity: Axis.horizontal,
            //     axis: Axis.horizontal,
            //     child: Stack(
            //       children: [
            //         swipeCard(),
            //         Container(
            //           child: Transform.translate(
            //               offset: Offset(-233, 0.0), child: _contact(index)),
            //         )
            //       ],
            //     ),
            //     feedback: Material(
            //       child: _contact(index),
            //     ),
            //     childWhenDragging: swipeCard())
          ],
        );
      },
    );
  }

  Widget _contact(index) {
    return AnimatedPositioned(
        key: ObjectKey(index),
        duration: Duration(milliseconds: 300),
        left: dragPosition,
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Chat()));
            },
            onHorizontalDragStart: (drag) {
              setState(() {});
              // print('start');
              // print(dragPosition);
              // print(drag);
              // print(drag.sourceTimeStamp);
            },
            onHorizontalDragUpdate: (update) {
              setState(() {});
              // print('update');
              // print(update);
              // print(update.sourceTimeStamp);
              // check if drag is to the left
              if (dragPosition <= 0.0) {
                if (dragPosition == 0 && update.primaryDelta! <= 0) {
                  // do nothing
                  setState(() {
                    dragPosition =
                        dragPosition + update.primaryDelta!.toDouble();
                  });
                } else {
                  setState(() {
                    dragPosition =
                        dragPosition + update.primaryDelta!.toDouble();
                  });
                }
                // print(update.primaryDelta);
              } else {
                setState(() {
                  dragPosition = 0.0;
                  _controller!.animateTo(0.1);
                });
              }
            },
            onHorizontalDragEnd: (ended) {
              // print(ended);
              // print('dragPosition');
              // print(dragPosition);
              if (dragPosition > 0) {
                setState(() {
                  // dragPosition = -(MediaQuery.of(context).size.width * 0.55);
                  dragPosition = 0.0;
                  _controller!.animateTo(0.0);
                });
              }
              if (dragPosition < -(MediaQuery.of(context).size.width * 0.275)) {
                setState(() {
                  dragPosition = -(MediaQuery.of(context).size.width * 0.55);
                });
              }
              if (dragPosition > -(MediaQuery.of(context).size.width * 0.275)) {
                setState(() {
                  dragPosition = 0.0;
                });
              }
            },
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(_lastMessages[index]['image']),
                        )),
                    height: 72,
                    width: 72,
                  ),
                  SizedBox(width: 15),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${_lastMessages[index]['name']}",
                          style: TextStyle(
                              fontFamily: 'GilroyBold', fontSize: 23)),
                      SizedBox(height: 5),
                      Text("${_lastMessages[index]['lastMessage']}",
                          style: TextStyle(
                              color: appColor.primary(), fontSize: 16)),
                    ],
                  )),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('15:20', style: TextStyle(color: Colors.grey[600])),
                      SizedBox(height: 5),
                      Container(
                        constraints: BoxConstraints(minWidth: 28),
                        height: 28,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: appColor.primary(),
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                            child: Text('${index + 1}',
                                style: TextStyle(color: Colors.white))),
                      )
                    ],
                  )),
                ],
              ),
            )));
  }

  Widget scrollingTabs() {
    return Expanded(
        // height: 50,
        child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                Container(
                  height: 50,
                  margin: EdgeInsets.only(bottom: 4),
                  child: TabBar(
                    isScrollable: true,
                    overlayColor: MaterialStateProperty.all(Colors.white),
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.white,
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GilroyBold',
                        fontSize: 20),
                    unselectedLabelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'GilroyBold',
                        fontSize: 18),
                    indicator: BoxDecoration(
                        color: appColor.primary(),
                        borderRadius: BorderRadius.circular(20)),
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Important'),
                      Tab(text: 'Unread'),
                      Tab(text: 'Read'),
                    ],
                  ),
                ),
                Expanded(
                  child: contactList(),
                )
              ],
            )));
  }

  Widget swipeCard() {
    return Container(
        height: 72,
        width: MediaQuery.of(context).size.width,
        color: appColor.primary(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                // color: Colors.yellow,
                height: 72,
                width: MediaQuery.of(context).size.width * 0.55,
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        print('object 1');
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          height: 72,
                          color: appColor.primary(),
                          child: SvgPicture.asset('assets/svg/Archive.svg')),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        print('object 2');
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 28),
                          height: 72,
                          // constraints: BoxConstraints(maxWidth: 28),
                          color: appColor.primary(),
                          child:
                              SvgPicture.asset('assets/svg/Double-tick.svg')),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        print('object 3');
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          height: 72,
                          color: appColor.primary(),
                          child: SvgPicture.asset('assets/svg/Delete.svg')),
                    )),
                  ],
                ))
          ],
        ));
  }

  List _lastMessages = [
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/sample1.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/sample2.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/sample3.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/sample4.png",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/sample5.png",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/sample6.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/sample7.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/sample8.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/sample9.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/sample10.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    }
  ];
}
