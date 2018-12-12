package net.ys.controller;

import net.ys.constant.GenResult;
import net.ys.service.DbService;
import net.ys.service.EtlService;
import net.ys.utils.LogUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

@Controller
@RequestMapping(value = "api")
public class ApiController {

    @Resource
    private DbService dbService;

    @Resource
    private EtlService etlService;

    @RequestMapping(value = "genTable")
    @ResponseBody
    public Map<String, Object> genTable() {
        try {
            long now = System.currentTimeMillis();
            dbService.genTable();
            return GenResult.SUCCESS.genResult(System.currentTimeMillis() - now);
        } catch (Exception e) {
            LogUtil.error(e);
            return GenResult.UNKNOWN_ERROR.genResult();
        }
    }

    @RequestMapping(value = "genField")
    @ResponseBody
    public Map<String, Object> genField() {
        try {
            long now = System.currentTimeMillis();
            dbService.genField();
            return GenResult.SUCCESS.genResult(System.currentTimeMillis() - now);
        } catch (Exception e) {
            LogUtil.error(e);
            return GenResult.UNKNOWN_ERROR.genResult();
        }
    }

    /**
     * 上传数据
     *
     * @param tableName 表名
     * @param data      jsonArray数据
     * @return
     */
    @RequestMapping(value = "upload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> upload(@RequestParam(required = true, value = "table_name", defaultValue = "") String tableName, @RequestParam(required = true, defaultValue = "") String data) {
        try {
            LogUtil.debug(tableName, data);
            boolean flag = etlService.insertOrUpdateDate(tableName, data);
            if (flag) {
                return GenResult.SUCCESS.genResult();
            }
            return GenResult.FAILED.genResult();
        } catch (Exception e) {
            LogUtil.error(e);
            return GenResult.UNKNOWN_ERROR.genResult();
        }
    }
}
