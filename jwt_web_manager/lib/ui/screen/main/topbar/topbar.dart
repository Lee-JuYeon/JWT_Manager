import 'package:flutter/material.dart';
import 'package:jwt_web_manager/ui/custom/googlelogin/googlelogin.dart';


class TopBar extends StatefulWidget {
  final TextEditingController textEditingController;

  const TopBar({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.textEditingController;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Widget _TopBarTextField(){
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    labelText: 'Enter your text',
                    border: InputBorder.none, // 테두리 제거
                  ),
                  style: TextStyle(fontSize: 14.0), // 텍스트 크기 조절
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // 버튼이 눌렸을 때의 동작을 정의합니다.
                },
                child: Text('🖋️'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TopBarTextField(),
          Spacer(),
          GoogleLoginButton(),
        ],
      ),
    );
  }
}
