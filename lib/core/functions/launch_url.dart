import 'package:bookly/core/functions/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  Uri? uri;
  if (url != null) {
    uri = Uri.parse(url);
  }
  if (await canLaunchUrl(uri!)) {
    await launchUrl(uri);
  } else {
    customSnackBar(context, 'Could not launch $url');
  }
}
