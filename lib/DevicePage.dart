import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'DeviceContainer.dart';
import 'ControllerPage.dart';

class DevicePage extends StatefulWidget {
  @override
  DevicePageState createState() => DevicePageState();
}

class DevicePageState extends State<DevicePage> {
  //instanz kreiren
  FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  //Den Bluetooth status auf unbekannt setzen
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  //Liste der geräte machen
  List<BluetoothDevice> _devices;

  BluetoothConnection _connection;

  @override
  void initState() {
    super.initState();

    //Bluetooth status aktualiesren
    _bluetooth.state.then((BluetoothState state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    // Auf zukünftige änderungen im Bluetoothstate warten
    _bluetooth.onStateChanged().listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    //Bluetooth aktivieren
    _enableBluetooth();
  }

  void _enableBluetooth() {
    //testen ob Bluetooth schon aktiviert ist
    if (_bluetoothState.isEnabled) {
      //Bluetooth nicht aktivieren weil schon aktiv ist
      return;
    } else {
      //Bluetooth aktivieren
      _bluetooth.requestEnable();

      //Geräte aktualisieren
      _getPairedDevices();
    }
  }

  void _disableBluetooth() {
    //Überprüfen ob bluetooth aus ist
    if (!_bluetoothState.isEnabled) {
      return;
    } else {
      //Bluetooth ausschalten
      _bluetooth.requestDisable();
    }
  }

  void _getPairedDevices() {
    _bluetooth.getBondedDevices().then((List<BluetoothDevice> devices) {
      setState(() {
        _devices = devices;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEVICES',
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          title: Text('Bluetooth Devices'),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'Enable Bluetooth:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Switch(
                      value: _bluetoothState.isEnabled,
                      onChanged: (bool value) {
                        if (value) {
                          _enableBluetooth();
                        } else {
                          _disableBluetooth();
                        }
                      }),
                ],
              ),
            ),
            DeviceContainer(
              device: _devices[1],
              connection: _connection,
            )
          ],
        ),
      ),
    );
  }
}
