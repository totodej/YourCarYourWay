import { Component, inject, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { ChatService } from '../../services/chatService';

@Component({
  selector: 'app-chat',

  standalone: true,

  imports: [CommonModule, FormsModule],

  templateUrl: './chat.html',

  styleUrls: ['./chat.css'],
})
export class ChatComponent implements OnInit {
  conversationId = '123';

  sender = 'Client';

  message = '';

  messages: any[] = [];

  private chatService: ChatService = inject(ChatService);
  
  /**
   * Initialise le composant en se connectant au serveur WebSocket
   * et en écoutant les nouveaux messages de la conversation.
   */
  ngOnInit(): void {
    this.chatService.connect(
      this.conversationId,

      (message: any) => {
        this.messages.push(message);
      },
    );
  }

  /**
   * Envoie le message saisi si celui-ci n'est pas vide,
   * puis réinitialise le champ de saisie.
   */
  send(): void {
    if (this.message.trim() === '') {
      return;
    }

    this.chatService.sendMessage(this.conversationId, this.sender, this.message,);
    this.message = '';
  }
}
