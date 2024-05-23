import 'dart:async';
import 'dart:ui';

import 'package:clean_getx/src/contracts/domain/service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart' show Rx, RxT;
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityService extends Service {
  Connectivity get connectivity => _connectivity;
  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  /// A void callback called everytime the connectivity is changes.
  ///
  /// You can make use of this property as you like,
  /// for example: show a snack bar to inform the user about the connectivity status.
  VoidCallback? onConnectivityChange;

  /// Whether the device is connected the the internet.
  ///
  /// This is make sure that you have a real access to the internet.
  bool get isConnected => _isConnected.value;
  late Rx<bool> _isConnected;

  Future<ConnectivityService> init() async {
    await _checkConnectivity(await _connectivity.checkConnectivity());
    return this;
  }

  Future<void> _checkConnectivity(List<ConnectivityResult> results) async {
    if (results.first == ConnectivityResult.none) return;
    final bool hasConnection = await InternetConnectionChecker().hasConnection;
    _isConnected = hasConnection.obs;
  }

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
  }

  Future<void> _onConnectivityChanged(List<ConnectivityResult> results) async {
    onConnectivityChange?.call();
    await _checkConnectivity(results);
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
