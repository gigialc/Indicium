
import 'package:motor_flutter/motor_flutter.dart';

Future<Schema?> broadcastInitialArtistSchemaDefinition() async {
    final artistFields = <String, SchemaFieldKind>{
    'name': SchemaFieldKind(kind: Kind.STRING),
    'did': SchemaFieldKind(kind: Kind.STRING),
    'profile_pic': SchemaFieldKind(kind: Kind.STRING),
    'bio': SchemaFieldKind(kind: Kind.STRING),
    'collectible': SchemaFieldKind(kind: Kind.STRING),
    'quantity': SchemaFieldKind(kind: Kind.STRING),
  };

  final responseArtist =
      await MotorFlutter.to.publishSchema("artist", artistFields);
return responseArtist.schema;
}

Future<Schema?> broadcastInitialCollectibleSchemaDefinition() async{
       final collectibles = <String, SchemaFieldKind>{
    'quantity': SchemaFieldKind(kind: Kind.STRING),
    'name': SchemaFieldKind(kind: Kind.STRING),
    'price': SchemaFieldKind(kind: Kind.INT),
    'asset': SchemaFieldKind(kind: Kind.STRING),
  };

  final responseCollectible =
      await MotorFlutter.to.publishSchema("collectible", collectibles);
  return responseCollectible.schema;
}

