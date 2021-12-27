import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_app/components/chips.dart';
import 'package:iot_app/components/status_indicator.dart';
import 'package:iot_app/screens/devices_screen.dart';

import '../constants.dart';

List<Widget> rooms = [];

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    buildRooms();
  }

  void buildRooms() {
    var roomData = KRooms;
    rooms.clear();
    for (var i = 0; i < roomData.length; i++) {
      rooms.add(DeviceCard(
        label: roomData[i]["label"],
        temp: roomData[i]["temp"],
        waterPercent: roomData[i]["waterLevel"],
        isOnline: roomData[i]["isOnline"],
        icon: roomData[i]["icon"],
      ));
    }
    rooms.insert(roomData.length, NewDeviceCard(onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DeviceScreen()));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_customize_rounded),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              Flexible(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 1.3,
                      children: rooms,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 8.0, right: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rooms",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2.0,
                  fontSize: 25.0,
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 2.0,
                    ),
                    child: const Text(
                      "Edit",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          20.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Icon(
                    Icons.add_circle_outline,
                    color: KPrimaryBlue,
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 30.0, right: 15.0),
          child: SizedBox(
            height: 35.0,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: const [
                Chips(
                  isActive: true,
                  label: "Ground Floor",
                  count: "3",
                ),
                Chips(
                  isActive: false,
                  label: "First Floor",
                  count: "2",
                ),
                Chips(
                  isActive: false,
                  label: "Second Floor",
                  count: "1",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class NewDeviceCard extends StatelessWidget {
  final VoidCallback onTap;
  const NewDeviceCard({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: KPrimaryBlue),
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              )),
          width: MediaQuery.of(context).size.height * 0.22,
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Add Room",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}

class DeviceCard extends StatelessWidget {
  final icon;
  final label;
  final temp;
  final waterPercent;
  final isOnline;
  const DeviceCard(
      {Key? key,
      this.icon,
      this.label,
      this.temp,
      this.waterPercent,
      this.isOnline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DeviceScreen()));
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: KPrimaryBlue),
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              )),
          width: MediaQuery.of(context).size.height * 0.22,
          height: MediaQuery.of(context).size.height * 0.15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      icon,
                      color: Colors.grey[400],
                      size: 40.0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          label,
                          style: TextStyle(letterSpacing: 1.2),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              children: [
                                Icon(
                                  Icons.thermostat,
                                  size: 18.0,
                                  color: Colors.grey[400],
                                ),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Text(
                                  "$temp°",
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 14.0),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Wrap(
                              children: [
                                Icon(
                                  Icons.shower,
                                  size: 18.0,
                                  color: Colors.grey[400],
                                ),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Text(
                                  "$waterPercent%",
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 14.0),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              StatusIndicator(
                isOnline: isOnline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
