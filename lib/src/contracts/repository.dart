import 'package:clean_getx/src/services/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' show GetInstance;

abstract class Repository {
  @protected
  bool get isConnected => GetInstance().find<ConnectivityService>().isConnected;
}
