import 'package:beshiefy_source_code/presentations/widgets/custom_button.dart';
import 'package:beshiefy_source_code/presentations/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  String generatedText = 'Generated Text Here';

  void generateText() {
    String inputText = controller.text;
    if (inputText.trim().isEmpty) {
      setState(() {
        generatedText = '';
      });
    } else {
      String genText = inputText.replaceAll(RegExp(r' +'), '🤸');
      setState(() {
        generatedText = genText;
      });
    }
  }

  void clearText() {
    controller.clear();
    setState(() {
      generatedText = '';
    });
  }

  void copyText() {
    Clipboard.setData(ClipboardData(text: generatedText));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Copied Successfully'),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'Welcome to Beshy Tumbling Generator',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTextField(
                  label: 'Enter your tumbling beshy words',
                  controller: controller,
                  onChanged: (value) => generateText(),
                ),
                CustomTextField(
                  label: generatedText,
                  enabledtext: false,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  width: width * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        width: width * 0.2,
                        label: 'Copy',
                        onPressed: copyText,
                      ),
                      CustomButton(
                        width: width * 0.2,
                        label: 'Clear',
                        onPressed: clearText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
