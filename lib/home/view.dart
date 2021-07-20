import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telegram/colors/colors.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppColor appColor = new AppColor();
  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [customAppBar(), scrollingTabs()],
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

  Widget contactList() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (conext, index) => SizedBox(height: 20),
      itemCount: _lastMessages.length,
      padding: EdgeInsets.symmetric(vertical: 30),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          // 'assets/images/basketballguy.jpg'
                          _lastMessages[index]['image']),
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
                          fontFamily: 'GilroyBold',
                          // fontWeight: FontWeight.bold,
                          fontSize: 23)),
                  SizedBox(height: 5),
                  Text("${_lastMessages[index]['lastMessage']}",
                      style:
                          TextStyle(color: appColor.primary(), fontSize: 16)),
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
        );
      },
    );
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

  List _lastMessages = [
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/basketballguy.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/basketballguy.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/basketballguy.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/basketballguy.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/basketballguy.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/basketballguy.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/basketballguy.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/basketballguy.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/basketballguy.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/basketballguy.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/basketballguy.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/basketballguy.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
    {
      "name": "Sherlock Holmes",
      "image": "assets/images/basketballguy.jpg",
      "unread": "5",
      "lastMessage": "So you're coming home today?"
    },
  ];
}
