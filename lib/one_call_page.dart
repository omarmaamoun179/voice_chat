import 'package:flutter/material.dart';
import 'package:walkie_taklie/main.dart';
import 'package:walkie_taklie/utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage(
      {Key? key,
      required this.callID,
      required this.onCallEnded,
      required this.isMicrophoneOn})
      : super(key: key);
  final String callID;
  final VoidCallback onCallEnded;
  final bool isMicrophoneOn;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: Utils
          .appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: Utils
          .AppSing, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: localUserId,
      userName: 'user$localUserId',
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()
        ..turnOnMicrophoneWhenJoining = isMicrophoneOn
        ..onOnlySelfInRoom = (context) {
          Navigator.pop(context);
          onCallEnded(
          
          );
        },
    );
  }
}

