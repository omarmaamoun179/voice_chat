import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:walkie_taklie/group_call_page.dart';
import 'package:walkie_taklie/one_call_page.dart';
import 'package:walkie_taklie/utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

void main() {
  runApp(const MyApp());
}

final String localUserId = math.Random().nextInt(10000).toString();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'walkie_taklie',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final callIdController = TextEditingController();
  String callType = 'person';
  bool isMicrophoneOn = true;
// Default to person

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('walkie_talkie'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: callIdController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter code to join the room',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 'person',
                    groupValue: callType,
                    onChanged: (value) {
                      setState(() {
                        callType = value.toString();
                      });
                    },
                  ),
                  const Text('Person'),
                  Radio(
                    value: 'group',
                    groupValue: callType,
                    onChanged: (value) {
                      setState(() {
                        callType = value.toString();
                      });
                    },
                  ),
                  const Text('Group'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (!isMicrophoneOn) {
                   
                    isMicrophoneOn = !isMicrophoneOn;
                  }
                  if (callType == 'person') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CallPage(
                            onCallEnded: () {
                            
                              isMicrophoneOn = !isMicrophoneOn;
                            },
                            isMicrophoneOn: isMicrophoneOn,
                            callID: callIdController.text,
                          );
                        },
                      ),
                    );
                  } else if (callType == 'group') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return GroupCallPage(
                            callID: callIdController.text,
                          );
                        },
                      ),
                    );
                  }
                },
                child: const Text('Join Call'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

