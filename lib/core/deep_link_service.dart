import 'package:app_links/app_links.dart';

class DeepLinkService {
  DeepLinkService._();
  final _appLinks = AppLinks();

  initializeAppLinks() async {
    //This is useful when the app was terminated
    final uri = await _appLinks.getInitialAppLink();
    if (uri != null) {
      _openPage(uri);
    }

    _appLinks.allUriLinkStream.listen((uri) {
      // Do something (navigation, ...)
      _openPage(uri);
    });
  }

  void _openPage(Uri uri) async {}
}
