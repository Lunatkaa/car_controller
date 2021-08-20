import 'package:car_controller/ControllerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class DeviceContainer extends StatelessWidget {
  final BluetoothDevice device;

  DeviceContainer(
    this.device,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  device.address,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black38,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.blue,
                    content: Text(
                      'Connecting to ${device.name} ...',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
                try {
                  BluetoothConnection _connection =
                      await BluetoothConnection.toAddress(device.address);
                  print('Connected to ${device.name}');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ControllerPage(_connection),
                    ),
                  );
                } on PlatformException {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.blue,
                      content: Text(
                        'Error try again',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  );
                }
              },
              child: Text('CONNECT'),
            ),
          )
        ],
      ),
    );
  }
}
