import 'package:flutter/material.dart';
import 'package:walkie_taklie/main.dart';
import 'package:walkie_taklie/utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class GroupCallPage extends StatelessWidget {
  const GroupCallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;

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
      config: ZegoUIKitPrebuiltCallConfig.groupVoiceCall(
        
      )
        ..onOnlySelfInRoom = (context) {
          Navigator.pop(context);
        },
    );
  }
}
