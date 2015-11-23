package org.reyabreu.sample;

import org.apache.camel.spring.boot.FatJarRouter;
import org.apache.camel.spring.boot.FatWarInitializer;

public class SampleBootWarInitializer extends FatWarInitializer {

  @Override
  protected Class<? extends FatJarRouter> routerClass() {
    return SampleStartBootRouter.class;
  }
  
}
