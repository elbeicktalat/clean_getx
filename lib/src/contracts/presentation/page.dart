import 'package:clean_getx/src/contracts/presentation/view.dart';
import 'package:flutter/material.dart' hide View;
import 'package:get/get.dart' show GetPage, Bindings;

@optionalTypeArgs
abstract class Page<T> extends GetPage<T> {
  Page({
    required super.name,
    required this.view,
    super.title,
    super.participatesInRootNavigator,
    super.gestureWidth,
    super.maintainState,
    super.curve,
    super.alignment,
    super.parameters,
    super.opaque,
    super.transitionDuration,
    super.popGesture,
    super.binding,
    super.bindings = const <Bindings>[],
    super.transition,
    super.customTransition,
    super.fullscreenDialog,
    super.middlewares,
    super.unknownRoute,
    super.arguments,
    super.showCupertinoParallax,
    super.preventDuplicates,
    this.subPages = const <Page>[],
  }) : super(
          page: view,
          children: subPages,
        );

  final View Function() view;
  final List<Page> subPages;
}
