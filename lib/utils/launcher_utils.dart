
import 'package:url_launcher/url_launcher.dart';
/// here we are creating some command to achive some functionality
class Command {
  static final all = [email, browser1, browser2];
/// To Open Mail
  static const email = 'write email';
  /// TO  Open Applications in  Mobile
  static const browser1 = 'open';
  /// To Open Browser and fetch LInk
  static const browser2 = 'go to';
}

class Utils {
  /// Scanning the text
  static void scanText(String rawText) {
   /// Convert the given Text to Lowercase
    final text = rawText.toLowerCase();
  /// Checking weather text contain word "write Email"
    if (text.contains(Command.email)) {
     /// _getTextAfterCommand this method seprate the  command and  return text after command
      final body = _getTextAfterCommand(text: text, command: Command.email);
    /// openEmail this method helps to open mail
      openEmail(body: body);
    } else if (text.contains(Command.browser1)) {

      /// _getTextAfterCommand this method seprate the  command and  return text after command
      final url = _getTextAfterCommand(text: text, command: Command.browser1);
     /// openLink this method helps us to open other app
      openLink(url: url);
    } else if (text.contains(Command.browser2)) {
      /// _getTextAfterCommand this method seprate the  command and  return text after command
      final url = _getTextAfterCommand(text: text, command: Command.browser2);
      /// openLink this method helps us to open other app
      openLink(url: url);
    }
  }
/// this method separates the command and text
  static String _getTextAfterCommand({
    /// Enter text
    required String text,
    /// specific cammand
    required String command,
  }) {
    final indexCommand = text.indexOf(command);
    final indexAfter = indexCommand + command.length;

    if (indexCommand == -1) {
      return "";
    } else {
      return text.substring(indexAfter).trim();
    }
  }

  static Future openLink({
    required String url,
  }) async {
    if (url.trim().isEmpty) {
      await _launchUrl('https://google.com');
    } else {
      await _launchUrl('https://$url.com');
    }
  }
/// this  method helps to open mail
  static Future openEmail({
    required String body,
  }) async {
    /// mailto it is specific intent to open mail it comes with package (Url Launcher)
    final url = 'mailto: ?body=${Uri.encodeFull(body)}';
    await _launchUrl(url);
  }
/// this  help us to open app
  static Future _launchUrl(String url) async {
    /// it first check the url will it able to launch it not if true
    if (await canLaunch(url)) {
      /// we launch that url and open app
      await launch(url);
    }
  }
}