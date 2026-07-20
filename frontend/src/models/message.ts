export interface ChatMessage {
  sender:string;
  role:string;
  content:string;
  timestamp?:string;
}