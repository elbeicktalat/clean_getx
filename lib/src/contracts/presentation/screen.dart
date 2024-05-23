import 'package:clean_getx/src/_internal/internal.dart';
import 'package:meta/meta.dart' show optionalTypeArgs;

@optionalTypeArgs
abstract class Screen<T extends BaseViewModel> extends ResponsiveView<T>
    with BaseViewMixin<T>, BaseScreenMixin<T> {
  Screen({
    super.alwaysUseBuilder,
    super.settings,
    super.key,
  });
}
