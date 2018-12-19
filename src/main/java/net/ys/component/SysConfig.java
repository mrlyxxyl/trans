package net.ys.component;

import net.ys.utils.PropertyUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.List;

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

    public static String[] name;

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

    @Value("${name:name_*}")
    public void setName(String[] name) {
        String prefix = name[0];
        List<String> nameList = PropertyUtil.gets(prefix.substring(0, prefix.length() - 1));
        String[] names = new String[nameList.size()];
        this.name = nameList.toArray(names);
    }
}
