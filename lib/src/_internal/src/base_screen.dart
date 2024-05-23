part of internal;

/// The base mixin for the public [Screen].
///
/// This mixin need a type parameter of [BaseViewModel].
@internal
mixin BaseScreenMixin<T extends BaseViewModel>
    on ResponsiveView<T>, BaseViewMixin<T> {
  @override
  @protected
  Widget build(BuildContext context) {
    screen.context = context;
    viewModel._context = context;
    Widget? widget;
    if (alwaysUseBuilder) {
      widget = builder();
      if (widget != null) return widget;
    }
    if (screen.isDesktop) {
      widget = desktop() ?? widget;
      if (widget != null) return widget;
    }
    if (screen.isTablet) {
      widget = tablet() ?? desktop();
      if (widget != null) return widget;
    }
    if (screen.isPhone) {
      widget = phone() ?? tablet() ?? desktop();
      if (widget != null) return widget;
    }
    return watch() ?? phone() ?? tablet() ?? desktop() ?? builder()!;
  }
}

class ResponsiveView<T extends BaseViewModel> extends View<T>
    with GetResponsiveMixin {
  ResponsiveView({
    this.alwaysUseBuilder = false,
    ResponsiveScreenSettings settings = const ResponsiveScreenSettings(),
    super.key,
  }) : screen = ResponsiveScreen(settings);

  @override
  final bool alwaysUseBuilder;

  @override
  final ResponsiveScreen screen;
}
