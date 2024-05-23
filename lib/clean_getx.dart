library clean_getx;

import 'package:clean_getx/src/_internal/internal.dart';
import 'package:clean_getx/src/contracts/presentation/view_model.dart';
import 'package:clean_getx/src/services/connectivity_service.dart';
import 'package:clean_getx/src/services/preferences_service.dart';
import 'package:get/get.dart';

export 'package:clean_getx/src/contracts/binding.dart';
export 'package:clean_getx/src/contracts/data/data_sources/data_source.dart';
export 'package:clean_getx/src/contracts/data/data_sources/local_data_source.dart';
export 'package:clean_getx/src/contracts/data/data_sources/remote_data_source.dart';
export 'package:clean_getx/src/contracts/data/model.dart';
export 'package:clean_getx/src/contracts/domain/entity.dart';
export 'package:clean_getx/src/contracts/domain/service.dart';
export 'package:clean_getx/src/contracts/domain/usecase.dart';
export 'package:clean_getx/src/contracts/presentation/middleware.dart';
export 'package:clean_getx/src/contracts/presentation/page.dart';
export 'package:clean_getx/src/contracts/presentation/screen.dart';
export 'package:clean_getx/src/contracts/presentation/view.dart';
export 'package:clean_getx/src/contracts/presentation/view_model.dart';
export 'package:clean_getx/src/services/connectivity_service.dart';
export 'package:clean_getx/src/services/preferences_service.dart';

/// A pre registered [ViewModel], this allows [View] and [Screen] to non specify something custom.
class _ViewModel extends ViewModel {}

/// The glue between the crow widgets and your app.
class CleanGetX {
  const CleanGetX._internal();

  /// The current [CleanGetX], if one has been created.
  static CleanGetX get instance => _instance;
  static const CleanGetX _instance = CleanGetX._internal();

  /// The place in where preregistered dependencies get registered.
  void initDependencies() {
    Get.put<BaseViewModel>(_ViewModel());
  }

  Future<void> initPreferencesService() async {
    await Get.putAsync(() => PreferencesService().init());
  }

  Future<void> initConnectivityService() async {
    await Get.putAsync(() => ConnectivityService().init());
  }
}
