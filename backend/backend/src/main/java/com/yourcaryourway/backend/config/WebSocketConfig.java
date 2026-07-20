package com.yourcaryourway.backend.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.*;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	/*
	* Configure le broker de messages utilisé par WebSocket.
	*
	* Le broker permet de gérer la diffusion des messages aux clients connectés.
	* Ici, on utilise le broker simple intégré à Spring pour envoyer les messages
	* vers les destinations commençant par "/topic".
	*/
    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        config.enableSimpleBroker("/topic");
        config.setApplicationDestinationPrefixes("/app");
    }
    
    /*
    * Configure le point d'entrée WebSocket utilisé par les clients.
    *
    * Cette méthode définit l'URL sur laquelle les clients vont se connecter
    * pour établir une communication WebSocket avec le serveur.
    */
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry
            .addEndpoint("/chat")
            .setAllowedOriginPatterns("*")
            .withSockJS();
    }
}