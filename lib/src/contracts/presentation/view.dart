import 'package:clean_getx/src/_internal/internal.dart';
import 'package:flutter/cupertino.dart';

@optionalTypeArgs
abstract class View<T extends BaseViewModel> extends StatelessWidget
    with BaseViewMixin<T> {
  const View({super.key});
}
