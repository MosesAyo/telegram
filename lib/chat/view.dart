import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegram/colors/colors.dart';

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  AppColor appColor = new AppColor();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Icon(Icons.arrow_back_ios,
                                          color: appColor.primary()),
                                    ),
                                  ),
                                  Container(
                                      height: 60,
                                      width: 60,
                                      margin: EdgeInsets.only(right: 16),
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(18))),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Lisa',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      Text('Online',
                                          style: TextStyle(
                                              color: appColor.primary()))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 15),
                                height: 25,
                                child: SvgPicture.asset('assets/svg/Grid.svg'))
                          ],
                        )),
                    Expanded(
                        child: ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 14,
                        );
                      },
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return messages[index]['initiator'] == 'sender'
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                    padding: EdgeInsets.all(20),
                                    margin: EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xFFDADADA).withOpacity(0.3),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(100),
                                          bottomLeft: Radius.circular(100),
                                          bottomRight: Radius.circular(100),
                                          topRight: Radius.circular(10),
                                        )),
                                    child: Text(
                                      '${messages[index]['message']}',
                                      style: TextStyle(color: Colors.black),
                                    )))
                            : Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    padding: EdgeInsets.all(20),
                                    margin: EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                        color: appColor.primary(),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(100),
                                          bottomRight: Radius.circular(100),
                                          topLeft: Radius.circular(100),
                                          bottomLeft: Radius.circular(10),
                                        )),
                                    child: Text(
                                      '${messages[index]['message']}',
                                      style: TextStyle(color: Colors.white),
                                    )));
                      },
                    )),
                    Container(
                        child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 60,
                          width: MediaQuery.of(context).size.width - 40,
                          padding: EdgeInsets.only(top: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: Color(0xFFDADADA).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            cursorColor: Colors.black,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              contentPadding:
                                  EdgeInsets.only(left: 20, right: 10),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              hintText: 'Type your message...',
                              hintStyle: new TextStyle(
                                color: Color(0xFF7B7B7B),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            child: Container(
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                height: 60,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  // color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                          onTap: () {
                                            print('object 1');
                                          },
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 18, bottom: 18),
                                              child: SvgPicture.asset(
                                                  'assets/svg/Plus.svg'))),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                          onTap: () {
                                            print('object 1');
                                          },
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 18, bottom: 18),
                                              child: SvgPicture.asset(
                                                  'assets/svg/Smiley.svg'))),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                          onTap: () {
                                            print('object 1');
                                          },
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 18, bottom: 18),
                                              child: SvgPicture.asset(
                                                  'assets/svg/Camera.svg'))),
                                    ),
                                    SizedBox(width: 16)
                                  ],
                                )))
                      ],
                    ))
                  ],
                ))));
  }

  List messages = [
    {
      'message': 'Hello, Will',
      'messageType': 'receiver',
      'initiator': 'receiver'
    },
    {
      'message': 'How have you been?',
      'messageType': 'text',
      'initiator': 'sender'
    },
    {
      'message': 'Hey Kriss, I am doing fine dude. wbu?',
      'messageType': 'text',
      'initiator': 'receiver'
    },
    {
      'image': 'assets/images/basketballguy.jpg',
      'messageType': 'image',
      'initiator': 'receiver'
    },
    {
      'message': 'Is there any thing wrong?',
      'messageType': 'text',
      'initiator': 'receiver'
    },
  ];
}
