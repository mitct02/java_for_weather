/*
 * Created on 16-Oct-2004
 *
 */
package org.tom.weather.comm;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.tom.weather.posting.DataPoster;
import uk.me.jstott.jweatherstation.LoopPacket;

public class Main {
  public static final Logger LOGGER = Logger.getLogger(Main.class);
  public static final Logger DATA_PROBLEMS_LOGGER = Logger.getLogger("DATA_PROBLEMS_LOGGER");
  private String portName = null;
  private VantagePro station;
  private List posterList;

  /**
   * Main method
   * 
   * @param args
   * @since 1.0
   */
  public static void main(String[] args) {
    while (true) {
      try {
        ApplicationContext factory = new FileSystemXmlApplicationContext(
            "weather.xml");
        Main main = (Main) factory.getBean("weatherMonitor");
        main.monitorWeather();
      } catch (BeansException e) {
        LOGGER.error(e);
      }
    }
  }

  public void monitorWeather() {
        try {
            getStation().test();
        } catch (IOException ex) {
            LOGGER.error(ex);
        }
    while (true) {
      try {
        for (int i = 0; i < 15; i++) {
          LoopPacket loop = getStation().readLoopData();
          if (!loop.isValid()) {
            DATA_PROBLEMS_LOGGER.info(loop.toString());
          }
          if (loop != null && loop.isValid()) {
            if (LOGGER.isDebugEnabled()) {
              LOGGER.debug(loop);
            }
            post(loop);
          }
          // LOGGER.info(loop);
        }
        boolean ok = getStation().dmpaft();
        if (!ok) {
          LOGGER.warn("dmpaft() returned false!");
        }
      } catch (IOException e) {
        LOGGER.error("communication exception - waiting 5s", e);
        try {
          Thread.sleep(5000);
          boolean ok = getStation().test();
          // show results of station test after the wait
          LOGGER.warn("station test:" + (ok ? "ok" : "not ok"));
        } catch (Exception e1) {
          LOGGER.error(e1);
        }
      }
    }
  }

  private void post(LoopPacket loop) {
    for (Iterator iter = getPosterList().iterator(); iter.hasNext();) {
      DataPoster poster = (DataPoster)iter.next();
      poster.post(loop);
    }
  }

  public void setPortName(String portName) {
    if (LOGGER.isDebugEnabled()) {
      LOGGER.debug("portName set: " + portName);
    }
    this.portName = portName;
  }

  public String getPortName() {
    return portName;
  }

  public void setStation(VantagePro station) {
    this.station = station;
  }

  public VantagePro getStation() {
    return station;
  }

  public void setPosterList(List posterList) {
    this.posterList = posterList;
  }

  public List getPosterList() {
    return posterList;
  }
}