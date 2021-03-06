import 'package:flutter/material.dart';
import 'package:sptan/core/services/firestore_database.dart';
import 'package:sptan/presentation/helper/router_helper.dart';
import 'package:sptan/presentation/helper/text_styles.dart';
import 'package:sptan/presentation/helper/ui_helper.dart';
import 'package:sptan/presentation/views/chat_view.dart';
import 'package:sptan/presentation/widgets/button_widget.dart';

class ChatDurationDialog extends StatefulWidget {
  final String chatID;

  ChatDurationDialog(this.chatID);

  @override
  _ChatDurationDialogState createState() => _ChatDurationDialogState();
}

class _ChatDurationDialogState extends State<ChatDurationDialog> {
  List<int> durations = [
    15,
    30,
    45,
    60,
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        Navigator.pop(context);
        return false;
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffFAFAFA),
            borderRadius: BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                'Chat-Dauer',
                textAlign: TextAlign.center,
                style: TSRobotoBoldStyle.copyWith(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  durations.length,
                  (index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Column(
                        children: [
                          if (index == 0)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Divider(height: 0),
                            ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 7,
                              horizontal: 50,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.done_all,
                                  color: Colors.transparent,
                                ),
                                Text(
                                  '${durations[index]} min',
                                  textAlign: TextAlign.center,
                                  style: TSMuseoStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.done_all,
                                  color: selectedIndex == index
                                      ? Colors.green
                                      : Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Divider(height: 0),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ButtonWidget(
                  onTap: () async {
                    UIHelper.showSpinLoading(context);
                    await FirestoreDatabase().setChatDuration(
                      id: widget.chatID,
                      duration: durations[selectedIndex] * 60,
                    );
                    RouterHelper.pushReplacement(
                      context,
                      ChatView(widget.chatID),
                    );
                  },
                  text: 'Fortsetzen',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
