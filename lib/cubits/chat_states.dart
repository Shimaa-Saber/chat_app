import '../models/message.dart';

abstract class chatStates{}

class chatInitial extends chatStates{}

class chatSuccess extends chatStates{
List<Message>messages;

chatSuccess({required this. messages}){}

}