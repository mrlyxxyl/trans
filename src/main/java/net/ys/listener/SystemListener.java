package net.ys.listener;

import net.ys.service.EtlService;
import net.ys.threadpool.ThreadPoolManager;
import net.ys.utils.ApplicationContextUtil;
import net.ys.utils.PropertyUtil;

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
        final String kjbPath = PropertyUtil.get("etl_ktr_path");

        Runnable r = new Runnable() {
            @Override
            public void run() {
                EtlService etlService = ApplicationContextUtil.getBean("etlService", EtlService.class);
                etlService.restartEtlJob(kjbPath);
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