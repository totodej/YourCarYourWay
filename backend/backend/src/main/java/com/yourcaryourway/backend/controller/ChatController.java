package com.yourcaryourway.backend.controller;


import com.yourcaryourway.backend.model.ChatMessage;

import org.springframework.messaging.handler.annotation.*;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class ChatController {

    private final SimpMessagingTemplate template;

    public ChatController(SimpMessagingTemplate template){
        this.template = template;
    }

    /**
    * Reçoit un message envoyé par un client sur une conversation donnée
    * puis le diffuse aux utilisateurs abonnés à cette conversation.
    */
    @MessageMapping("/message/{conversationId}")
    public void sendMessage(@DestinationVariable String conversationId, ChatMessage message){
        template.convertAndSend("/topic/conversation/" + conversationId, message);
    }

}