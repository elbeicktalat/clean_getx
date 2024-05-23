import 'package:clean_getx/src/contracts/presentation/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' show GetInstance, GetMiddleware;

@optionalTypeArgs
abstract class Middleware<T extends ViewModel> extends GetMiddleware {
  String? get tag => null;

  T get viewModel => GetInstance().find<T>(tag: tag);
}
