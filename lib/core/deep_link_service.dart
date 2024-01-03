import 'package:app_links/app_links.dart';
import 'package:deeplinking_demo/models/deep_link_data_model.dart';
import 'package:deeplinking_demo/router/router.dart';

class DeepLinkService {
  DeepLinkService._();
  static DeepLinkService get instance => _instance;
  static final DeepLinkService _instance = DeepLinkService._();

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

  final paths = ['doctors'];
  void _openPage(Uri uri) async {
    final navigator = NavigationService.instance;
    final path = uri.path;
    final query = uri.queryParameters;
    if (paths.contains(path)) {
      if (path == paths[0] && query.isNotEmpty) {
        navigator.navigateTo(
          RoutePaths.DEEP_LINK_ENTRY,
          argument: {
            'data': DeepLinkData(),
          },
        );
      }
    } else {
      // TODO: handle route not found
      return;
    }
  }
}
