package net.ys.component;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 系统配置类
 * User: NMY
 * Date: 16-8-28
 */
@Component
public class SysConfig {

    public static String uploadApiUrl;

    public static String etlKtrPath;

    public static String etlKjbPath;

    @Value("${upload.api.url}")
    public void setUploadApiUrl(String uploadApiUrl) {
        SysConfig.uploadApiUrl = uploadApiUrl;
    }

    @Value("${etl.ktr.path}")
    public static void setEtlKtrPath(String etlKtrPath) {
        SysConfig.etlKtrPath = etlKtrPath;
    }

    @Value("${etl.kjb.path}")
    public static void setEtlKjbPath(String etlKjbPath) {
        SysConfig.etlKjbPath = etlKjbPath;
    }
}
