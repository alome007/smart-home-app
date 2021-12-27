import 'package:flutter/material.dart';
import 'package:iot_app/components/status_indicator.dart';

import '../constants.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  var temperature = 23;

  void updateTemperature(int action) {
    if (action == 0) {
      if (temperature <= 0) return;
      temperature--;
    } else {
      temperature++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0XFFF8F9FA),
        elevation: 0.0,
        title: Text(
          "Living Room",
          style: TextStyle(color: Colors.black, letterSpacing: 1.2),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Material(
              color: Color(0XFFF8F9FA),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.thermostat_outlined,
                      color: Colors.grey[400],
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "${temperature.toString()}°C",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Icon(
                      Icons.water,
                      color: Colors.grey[400],
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "49%",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Icon(
                      Icons.bolt,
                      color: Colors.grey[400],
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "289w",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Icon(
                      Icons.light_mode,
                      color: Colors.grey[400],
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "100m",
                      style: TextStyle(color: Colors.grey[400]),
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 0.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        DeviceCard(
                          label: "Air Conditioner",
                          isActive: true,
                          icon: Icons.ac_unit,
                        ),
                        DeviceCard(
                          label: "Lamp",
                          isActive: false,
                          icon: Icons.light,
                        ),
                        DeviceCard(
                          label: "Television",
                          isActive: false,
                          icon: Icons.tv,
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.9,
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      temperature.toString(),
                      style:
                          TextStyle(fontSize: 150, fontWeight: FontWeight.w100),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Text(
                        "°C",
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.ac_unit,
                      color: KPrimaryBlue,
                      size: 25,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      "Cooling",
                      style: TextStyle(color: KPrimaryBlue),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.air),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          "Auto",
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.storm),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          "Auto",
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                AcControl(
                  onMinusTap: () {
                    setState(() {
                      updateTemperature(0);
                    });
                  },
                  onPlusTap: () {
                    setState(() {
                      updateTemperature(1);
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          child: Icon(
                            Icons.power_settings_new,
                            size: 35,
                            color: Colors.red,
                          ),
                        ),
                        VerticalDivider(
                          thickness: 0.8,
                          width: 2,
                          indent: 5,
                          color: Colors.grey,
                        ),
                        Text("Mode"),
                        VerticalDivider(
                          thickness: 0.8,
                          width: 2,
                          indent: 5,
                          color: Colors.grey,
                        ),
                        Text("Speed"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AcControl extends StatelessWidget {
  const AcControl({
    Key? key,
    required this.onPlusTap,
    required this.onMinusTap,
  }) : super(key: key);

  final onPlusTap;
  final onMinusTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Container(
        height: 70.0,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0XFFE8E8E8)),
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: onMinusTap,
              child: Icon(
                Icons.remove,
                size: 30,
                color: Color(0XFF7D7D7E),
              ),
            ),
            Text(
              "Temp",
              style: TextStyle(color: Color(0XFF7D7D7E), fontSize: 15.0),
            ),
            GestureDetector(
              onTap: onPlusTap,
              child: Icon(
                Icons.add,
                size: 30,
                color: Color(0XFF7D7D7E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  const DeviceCard({Key? key, this.isActive, this.icon, required this.label})
      : super(key: key);
  final isActive;
  final icon;
  final label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color: isActive ? KPrimaryBlue : Colors.white,
            border: Border.all(color: KPrimaryBlue),
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            )),
        width: MediaQuery.of(context).size.height * 0.15,
        height: MediaQuery.of(context).size.height * 0.18,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: StatusIndicator(
                isOnline: true,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.grey,
              size: 30,
            ),
            SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
