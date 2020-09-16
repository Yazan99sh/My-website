import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_web/url_launcher_web.dart';
class SocialMedia extends StatefulWidget {
  Map social;

  @override
  _SocialMediaState createState() => _SocialMediaState();

  SocialMedia(this.social);
}

class _SocialMediaState extends State<SocialMedia> {
  var _Hover = false;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _Hover ? Colors.white :Color.fromRGBO(30, 136, 229, 1),
        border: _Hover
            ? null
            : Border.all(
                color: Colors.white,
              ),
      ),
      child: InkWell(
        onHover: (hover) {
          if (hover) {
            setState(() {
              _Hover = true;
            });
          } else {
            setState(() {
              _Hover = false;
            });
          }
        },
        onTap: () {
          launchURL();
        },
        child: Center(
            child: Image.asset(
          '${widget.social['logo']}',
          color: _Hover ? Color.fromRGBO(30, 136, 229, 1) : Colors.white,
          width: 25,
        )),
      ),
    );
  }
  launchURL() async {
    String url;
    if (widget.social['Link'].toString().contains('@')) {
      final Uri _emailLaunchUri = Uri(
          scheme: 'mailto',
          path: '${widget.social['Link']}',
          queryParameters: {
            'subject': ''
          }
      );
      launch(_emailLaunchUri.toString());
    }
    else {
      url = '${widget.social['Link']}';

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        js.context.callMethod("open", [widget.social['Link']]);
        throw 'Could not launch $url';
      }
    }
  }
}
