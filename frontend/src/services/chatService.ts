import { Injectable } from '@angular/core';

import SockJS from 'sockjs-client';

import { Client } from '@stomp/stompjs';

@Injectable({
  providedIn: 'root',
})
export class ChatService {
  private stompClient!: Client;

  /**
   * Établit une connexion WebSocket au serveur et s'abonne
   * aux messages de la conversation spécifiée.
   *
   * @param conversationId Identifiant de la conversation.
   * @param callback Fonction appelée à chaque message reçu.
   */
  connect(conversationId: string, callback: any) {
    this.stompClient = new Client({
      webSocketFactory: () => new SockJS('http://localhost:8080/chat'),
    });

    this.stompClient.onConnect = () => {
      this.stompClient.subscribe(
        '/topic/conversation/' + conversationId,

        (message) => {
          callback(JSON.parse(message.body));
        },
      );
    };

    this.stompClient.activate();
  }

  /**
   * Envoie un message à une conversation via le serveur WebSocket.
   *
   * @param conversationId Identifiant de la conversation.
   * @param sender Nom ou identifiant de l'expéditeur.
   * @param content Contenu du message à envoyer.
   */
  sendMessage(conversationId: string, sender: string, content: string) {
    this.stompClient.publish({
      destination: '/app/message/' + conversationId,

      body: JSON.stringify({
        sender: sender,

        content: content,
      }),
    });
  }
}
