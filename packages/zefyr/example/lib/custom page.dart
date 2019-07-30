import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';

import 'src/view.dart';


class CustomPage extends StatefulWidget {
  @override
  _CustomPageState createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {

  final ZefyrController _controller = ZefyrController(NotusDocument());
  final FocusNode _focusNode = new FocusNode();

  String tempText = '因为来自git的Zefyr的每个版本都依赖于托管的url_启动程序，而Party_应用程序依赖于来自git的url_启动程序，所以禁止来自git的Zefyr。'
      '因此，因为Party_应用程序依赖于Git的Zefyr，所以版本解决失败。';

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      _controller.document.insert(0, tempText);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final form = Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(hintText: '请输入标题')
        ),
        Expanded(child: buildEditor())
      ]
    );

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.grey.shade200,
        brightness: Brightness.light,
        title: Text('自定义编辑'),
      ),
      body: ZefyrScaffold(
        child: form
      )
    );
  }

  Widget buildEditor() {
    final theme = ZefyrThemeData(
      toolbarTheme: ZefyrToolbarTheme.fallback(context).copyWith(
        color: Colors.white,
        toggleColor: Colors.grey.shade400,
        iconColor: Colors.blueGrey,
        disabledIconColor: Color(0xFFf2f2f2),
      )
    );

    return ZefyrTheme(
      data: theme,
      child: ZefyrField(
        controller: _controller,
        focusNode: _focusNode,
        autofocus: false,
        imageDelegate: CustomImageDelegate(),
        physics: ClampingScrollPhysics(),
        decoration: InputDecoration(
          hintText: '请输入正文内容',
          hintStyle: TextStyle(),
          fillColor: Colors.cyanAccent,
          contentPadding: EdgeInsets.all(0.0),
          isDense: true,
        )
      )
    );
  }
}
