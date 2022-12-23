// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class WhatsApp extends StatefulWidget {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  State<WhatsApp> createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp> {
  final DailOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: WillPopScope(
        onWillPop: () async {
          if (DailOpen.value) {
            DailOpen.value = false;
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              elevation: 30,
              // toolbarHeight: 30,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.airplanemode_active),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.light_mode),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                PopupMenuButton(
                    itemBuilder: ((context) => [
                          const PopupMenuItem(child: Text("GBSettings")),
                          const PopupMenuItem(child: Text("Message Scheduler")),
                          const PopupMenuItem(child: Text("Auto Reply")),
                          const PopupMenuItem(child: Text("Restart WhatsApp")),
                          const PopupMenuItem(child: Text("Message a number")),
                          const PopupMenuItem(
                              child: Text("Mass Message Sender")),
                          const PopupMenuItem(child: Text("New group")),
                          const PopupMenuItem(child: Text("New broadcast")),
                          const PopupMenuItem(child: Text("Linked devices")),
                          const PopupMenuItem(child: Text("Starred message")),
                          const PopupMenuItem(child: Text("Settings")),
                        ]))
              ],
              bottom: const TabBar(
                indicatorWeight: 3,
                indicatorColor: Color.fromARGB(255, 44, 188, 102),
                tabs: [
                  Tab(
                    icon: Icon(Icons.camera_alt),
                  ),
                  Tab(
                    child: Text("Chats"),
                  ),
                  Tab(child: Text("Group", style: TextStyle(fontSize: 13))),
                  Tab(child: Text("Status")),
                  Tab(
                    child: Text("Calls"),
                  )
                ],
              ),
              title: const Text("WhatsApp"),
              // backgroundColor: const Color.fromARGB(255, 41, 109, 10),
            ),
            body: TabBarView(children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [Icon(Icons.camera), Text("Camera")],
                ),
              ),
              ListView.builder(
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("images/whats.jpg"),
                      ),
                      title: Text("Hira kiran"),
                      subtitle: Text("hey!"),
                      trailing: Text("10:05am"),
                    );
                  })),
              ListView.builder(
                  itemCount: 80,
                  itemBuilder: ((context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("images/whats.jpg"),
                      ),
                      title: Text("Flutter Cyex"),
                      subtitle: Text("your task is uploaded"),
                      trailing: Text("8:10pm"),
                    );
                  })),
              ListView.builder(
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    if (index == 0) {
                      return Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20, top: 20),
                            child: Text("Recent updates"),
                          ),
                          ListTile(
                            leading: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.red,
                                    )),
                                child: const CircleAvatar(
                                  backgroundImage:
                                      AssetImage("images/whats.jpg"),
                                )),
                            title: const Text("Hira kiran"),
                            subtitle: const Text("12 minutes ago"),
                          ),
                        ],
                      );
                    } else {
                      return ListTile(
                        leading: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 3,
                                  color: Colors.red,
                                )),
                            child: const CircleAvatar(
                              backgroundImage: AssetImage("images/whats.jpg"),
                            )),
                        title: const Text("Hira kiran"),
                        subtitle: const Text("12 minutes ago"),
                        // trailing: const Text("10:05am"),
                      );
                    }
                  })),
              ListView.builder(
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage("images/whats.jpg"),
                        ),
                        title: const Text("Misbah"),
                        subtitle: const Text("31 Augest, 12:04pm"),
                        trailing: Icon(
                            index == 1 ? Icons.call : Icons.video_call_sharp));
                  })),
            ]),
            floatingActionButton: SpeedDial(
              icon: Icons.add,
              animatedIcon: AnimatedIcons.close_menu,
              backgroundColor: Colors.green,
              spacing: 12,
              spaceBetweenChildren: 12,
              closeManually: true,
              // overlayColor: Colors.black,
              overlayOpacity: 0,
              openCloseDial: DailOpen,
              children: [
                SpeedDialChild(
                  child: const Icon(Icons.email, color: Colors.white),
                  backgroundColor: Colors.green,
                  // label: "Mail",
                  // onTap: () => showtToast("Selected Mail"),
                ),
                SpeedDialChild(
                  child: const Icon(Icons.copy, color: Colors.white),
                  backgroundColor: Colors.green,

                  // label: "Copy",
                ),
                SpeedDialChild(
                  child: const Icon(
                    Icons.document_scanner,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.green,
                  // label: "Document",
                ),
                SpeedDialChild(
                  child: const Icon(Icons.message, color: Colors.white),
                  backgroundColor: Colors.green,
                  // label: "Message",
                ),
              ],
            )),
      ),
    );
  }
}
