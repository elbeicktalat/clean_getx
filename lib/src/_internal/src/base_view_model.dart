part of internal;

/// The parent of all ViewModels.
@internal
abstract class BaseViewModel extends GetxController {
  @protected
  BuildContext get context => _context;
  late BuildContext _context;

  @protected
  @mustCallSuper
  @override
  void onInit() {
    super.onInit();
  }

  @protected
  @mustCallSuper
  @override
  void onReady() {
    super.onReady();
  }

  @protected
  @mustCallSuper
  @override
  void onClose() {
    super.onClose();
  }
}
