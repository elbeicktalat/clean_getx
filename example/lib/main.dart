import 'package:clean_getx/clean_getx.dart';
import 'package:flutter/material.dart' hide View;
import 'package:get/get.dart';
import 'package:lets_theme/lets_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CleanGetX.instance.initDependencies();
  await CleanGetX.instance.initPreferencesService();
  HomeBinding().dependencies();

  final ThemeMode? themeMode = await LetsTheme.getThemeMode();

  runApp(MyApp(savedThemeMode: themeMode));

  CleanGetX.instance.initConnectivityService();
}

class MyApp extends View {
  const MyApp({
    super.key,
    required this.savedThemeMode,
  });

  final ThemeMode? savedThemeMode;

  @override
  Widget builder() {
    return LetsTheme(
      light: ThemeData.light(),
      dark: ThemeData.dark(),
      initialMode: savedThemeMode ?? ThemeMode.light,
      builder: (light, dark) => GetMaterialApp(
        theme: light,
        darkTheme: dark,
        home: const HomeView(),
      ),
    );
  }
}

// Remember to set the View generic `Type` in order to accesses your custom properties,
// getters, setters, methods in your Widget. As below HomeViewModel is subclass of ViewModel.
// If you don't specify the View generic `Type` then you'll be able to accesses only predefined stuff. e.g a context getter.
class HomeView extends View<HomeViewModel> {
  const HomeView({super.key});

  // Note: that you can assess the BuildContext globally in your widget.
  @override
  Widget? builder() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean GetX Demo App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(
            onPressed: viewModel.navToNext, // Your custom method.
            child: const Text('Go Next'),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: LetsThemeToggle.compact(),
          ),
        ],
      ),
    );
  }
}

class HomeViewModel extends ViewModel {
  void navToNext() {
    Navigator.push(
      context, // You can accesses the BuildContext globally in your ViewModel.
      MaterialPageRoute(
        builder: (context) {
          return const SecondPage();
        },
      ),
    );
  }
}

class HomeBinding extends Binding {
  @override
  void dependencies() {
    put<HomeViewModel>(HomeViewModel());
  }
}

// Remember what we have side?
// The type parameter on View is optional, so in this case you cannot access custom invocation,
// but still able to get the predefined ones like the global context.
class SecondPage extends View {
  const SecondPage({super.key});

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: FilledButton(
          // just for demo purpose, by default AppBar has button to navigate back.
          // see the global context?
          onPressed: () => Navigator.pop(context), // Your custom method.
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
