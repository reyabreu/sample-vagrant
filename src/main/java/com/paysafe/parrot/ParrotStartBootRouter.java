package com.paysafe.parrot;

import org.apache.camel.spring.boot.FatJarRouter;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

/**
 * 
 * For Camel spring-boot applications, this is enough as a CamelContext is created automatically and
 * routes are added on configuration.
 * 
 * @author Reynaldo.A
 *
 */
@SpringBootApplication
public class ParrotStartBootRouter extends FatJarRouter {

  @Override
  public void configure() throws Exception {
    from("timer://trigger")
        .transform()
        .simple("ref:helloWorld")
        .to("log:out", "mock:test");
  }

  @Bean
  String helloWorld() {
    return "Hello World from Parrot Vagrant!";
  }

}
