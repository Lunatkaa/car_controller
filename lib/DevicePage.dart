import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'ControllerPage.dart';

class DevicePage extends StatefulWidget {
  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  //Bluetooth Verbindungs Status
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  BluetoothDevice _device;

  //Bluetooth Instanz
  FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  //Bluetooth Verbindung
  BluetoothConnection connection;

  //Überprüfung auf verbindung
  bool get isConnected => connection != null && connection.isConnected;

  bool isDisconnecting = false;

  bool _connected = false;

  bool _isButtonUnavailable = false;

  int _deviceState;

  //Liste für speichern der verfügbaren geräte
  List<BluetoothDevice> _devicesList = [];

  @override
  void initState() {
    super.initState();

    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    _deviceState = 0;

    //Bluetooth aktieviren
    enableBluetooth();

    // gucken ob der State sich geändert hat
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;

        getPairedDevices();
      });
    });
  }

  Future<void> enableBluetooth() async {
    // Den aktuellen State bekommen
    _bluetoothState = await FlutterBluetoothSerial.instance.state;

    //State Überprüfen und je nachdem handeln
    if (_bluetoothState == await BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
      return true;
    } else {
      await getPairedDevices();
    }
    return false;
  }

  Future<void> getPairedDevices() async {
    List<BluetoothDevice> devices = [];

    //Alle verfügbaren geräte bekommen
    try {
      devices = await _bluetooth.getBondedDevices();
    } on PlatformException {
      print('error');
    }

    if (!mounted) {
      return;
    }

    //devices in _deviceList übertragen damit acuh au´ßerhab der klasse erreichbar
    setState(() {
      _devicesList = devices;
    });
  }

  @override
  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection.dispose();
      connection = null;
    }

    super.dispose();
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devicesList.isEmpty) {
      items.add(
        DropdownMenuItem(
          child: Text('NONE'),
        ),
      );
    } else {
      _devicesList.forEach((device) {
        items.add(
          DropdownMenuItem(
            child: Text(device.name),
            value: device,
          ),
        );
      });
    }
    return items;
  }

  void _connect() async {
    if (_device == null) {
      show('NO DEVICE SELECTED')
    }
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
            Switch(
              value: _bluetoothState.isEnabled,
              onChanged: (bool value) {
                future() async {
                  if (value) {
                    //Bluetooth aktivieren
                    await FlutterBluetoothSerial.instance.requestEnable();
                  } else {
                    await FlutterBluetoothSerial.instance.requestDisable();
                  }
                  await getPairedDevices();
                  _isButtonUnavailable = false;

                  if (_connected) {
                    _disconnect();
                  }
                }

                future().then((_) {
                  setState(() {});
                });
              },
            ),
            DropdownButton(
              items: _getDeviceItems(),
              onChanged: (value) => setState(() => _device = value),
              value: _devicesList.isNotEmpty ? _device : null,
            )
          ],
        ),
      ),
    );
  }
}
