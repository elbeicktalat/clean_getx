import 'package:get/get.dart'
    show
        AsyncInstanceBuilderCallback,
        Bindings,
        GetInstance,
        InstanceBuilderCallback;
import 'package:meta/meta.dart' show protected;

abstract class Binding extends Bindings {
  @protected
  S put<S>(
    S dependency, {
    String? tag,
    bool permanent = false,
  }) =>
      GetInstance().put<S>(dependency, tag: tag, permanent: permanent);

  @protected
  void lazyPut<S>(
    InstanceBuilderCallback<S> builder, {
    String? tag,
    bool fenix = false,
  }) =>
      GetInstance().lazyPut<S>(builder, tag: tag, fenix: fenix);

  @protected
  Future<S> putAsync<S>(
    AsyncInstanceBuilderCallback<S> builder, {
    String? tag,
    bool permanent = false,
  }) async =>
      GetInstance().putAsync<S>(builder, tag: tag, permanent: permanent);

  @protected
  S putOrFind<S>(InstanceBuilderCallback<S> builder, {String? tag}) =>
      GetInstance().putOrFind(builder, tag: tag);

  @protected
  S find<S>({String? tag}) => GetInstance().find<S>(tag: tag);
}
