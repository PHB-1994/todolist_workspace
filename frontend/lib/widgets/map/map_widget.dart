import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapWidget extends StatefulWidget{
  const MapWidget({super.key});


  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  // 변수 = 데이터를 보관하는 공간의 명칭
  // dart 변수 선언을 했을 때,
  // 공간의 명칭에 들어갈 데이터를 직접적으로 작성하거나
  // 공간의 명칭에 들어갈 데이터가 현재는 존재하지 않으며, 추후 클라이언트가 작성한 데이터나,
  // DB 에서 가져온 데이터를 공간 내부에 주입하고자 한다면 반드시 생성자를 이용해서
  // 변수에 값이 들어갈 수 있도록 하며, 생성자를 선언할 때 필수로 데이터가 필요로 하는 변수인지
  // 선택적으로 변수의 값을 넣을 수 있는 변수인지 구분

  // final String viewId = 'google-maps-iframe';
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadHtmlString(_getMapHtml());
  }

  String _getMapHtml() {
    return '''
    <!DOCTYPE html>
    <html lang="ko">
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          body {
            margin: 0;
            padding: 0;
          }
          iframe {
            width: 100%;
            height: 100vh;
            border: 0;
          }
        </style>
      </head>
      <body>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d10637.73221297587!2d126.98506794572768!3d37.56409327836785!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca28d3199c531%3A0x7a2d35df0efd2d8!2z642V7IiY6raB!5e0!3m2!1sko!2skr!4v1768445411741!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
      </body>
    </html>
    ''';
  }

  /* 만약에
  *     final String viewId = 'google-maps-iframe'; 아니라
  *     final String viewId; 로  작성했다면
  *
  *     const 클래스이름 ({required this.viewId}); 과 같은 형태로 생성자를 선언하여
  * view ID 데이터가 필수로 필요한지 선택적으로 필요한지 개발자는 구분할 의무가 있음
  * */

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300]!)
        )
      ),
      child: WebViewWidget(controller: controller),
    );
  }

}