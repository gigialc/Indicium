import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:motor_flutter/motor_flutter.dart';
import 'home_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});
  static const routeName = '/OnboardingPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( 
              "Stake the Stigma",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 232, 7, 7)),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 54,
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 2, 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                onPressed: () {
                  buildArtist();
                  Navigator.of(context).pushNamed(HomePage.routeName);
                },
                child: Text(
                  "Create an Account",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void buildArtist() async {
  final artistFields = <String, SchemaFieldKind>{
    'name': SchemaFieldKind(kind: Kind.STRING),
    'did': SchemaFieldKind(kind: Kind.STRING),
    'profile_pic': SchemaFieldKind(kind: Kind.STRING),
    'bio': SchemaFieldKind(kind: Kind.STRING),
    'collectible': SchemaFieldKind(kind: Kind.LINK),
    'quantity': SchemaFieldKind(kind: Kind.INT),
  };

  final responseArtist =
      await MotorFlutter.to.publishSchema("artist", artistFields);
  final artistSchema = responseArtist.schema;

  final exampleArtist = artistSchema.newDocument("Artist Profile");
  exampleArtist.set<String>("name", "ASAP Rocky");
  exampleArtist.set<String>("did", MotorFlutter.to.address.value);
  exampleArtist.set<String>("profile_pic",
      "https://avatars.dicebear.com/api/adventurer/your-custom-seed.svg"); // Get image using whatever

  exampleArtist.upload(creator: "indicium-artist");
}
