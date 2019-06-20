package net.ys.listener;

import net.ys.component.ApplicationContextUtil;
import net.ys.service.EtlService;
import net.ys.threadpool.ThreadPoolManager;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * User: NMY
 * Date: 16-8-29
 */
@WebListener
public class SystemListener implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        /**
         * 启动所有已开启的etl进行传输
         */
        Runnable r = new Runnable() {
            @Override
            public void run() {
                EtlService etlService = ApplicationContextUtil.getBean("etlService", EtlService.class);
                etlService.restartEtlJob();
            }
        };
        ThreadPoolManager.INSTANCE.complexPool.doIt(r);

        /**
         * 启动所有已开启的api进行传输
         */
        r = new Runnable() {
            @Override
            public void run() {
                EtlService etlService = ApplicationContextUtil.getBean("etlService", EtlService.class);
                etlService.restartApiJob();
            }
        };
        ThreadPoolManager.INSTANCE.complexPool.doIt(r);
    }
}