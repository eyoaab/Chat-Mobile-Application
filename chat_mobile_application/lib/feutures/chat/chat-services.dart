import 'package:chat_mobile_application/feutures/chat/message-entity.dart';

class ChatServices{

String generateChatId(String userId1, String userId2) {
  List<String> ids = [userId1, userId2];
  ids.sort(); 
  return ids.join('_'); 
}
List<MessageEntity> messageEntitiesFromJsonList(List<dynamic> jsonList) {
  return jsonList.map((json) => MessageEntity.fromJson(json as Map<String, dynamic>)).toList();
}

}