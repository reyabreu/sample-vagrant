package com.paysafe.parrot;

import org.apache.camel.spring.boot.FatJarRouter;
import org.apache.camel.spring.boot.FatWarInitializer;

public class ParrotBootWarInitializer extends FatWarInitializer {

  @Override
  protected Class<? extends FatJarRouter> routerClass() {
    return ParrotStartBootRouter.class;
  }
  
}
