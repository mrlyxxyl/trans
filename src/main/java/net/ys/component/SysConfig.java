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
        this.uploadApiUrl = uploadApiUrl;
    }

    @Value("${etl.ktr.path}")
    public void setEtlKtrPath(String etlKtrPath) {
        this.etlKtrPath = etlKtrPath;
    }

    @Value("${etl.kjb.path}")
    public void setEtlKjbPath(String etlKjbPath) {
        this.etlKjbPath = etlKjbPath;
    }
}
