import 'package:clean_getx/src/_internal/internal.dart';
import 'package:flutter/material.dart'
    show
        Center,
        CircularProgressIndicator,
        Material,
        SizedBox,
        Text,
        Theme,
        Widget,
        optionalTypeArgs;
import 'package:get/get.dart' show NotifierBuilder, SimpleBuilder, StateMixin;

@optionalTypeArgs
abstract class ViewModel<T> extends BaseViewModel with StateMixin<T> {
  Widget obx(
    NotifierBuilder<T?> widget, {
    Widget Function(String? error)? onError,
    Widget? onLoading,
    Widget? onEmpty,
  }) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: SimpleBuilder(
        builder: (_) {
          if (status.isLoading) {
            return onLoading ??
                const Center(child: CircularProgressIndicator.adaptive());
          } else if (status.isError) {
            return onError != null
                ? onError(status.errorMessage)
                : Center(
                    child: Text('An error occurred: ${status.errorMessage}'),
                  );
          } else if (status.isEmpty) {
            return onEmpty ?? const SizedBox.shrink();
          }
          return widget(value);
        },
      ),
    );
  }
}
