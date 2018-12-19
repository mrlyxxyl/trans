package net.ys.service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.ys.bean.*;
import net.ys.component.SysConfig;
import net.ys.constant.DbType;
import net.ys.constant.X;
import net.ys.dao.DbDao;
import net.ys.dao.EtlDao;
import net.ys.threadpool.ThreadPoolManager;
import net.ys.utils.DBUtil;
import net.ys.utils.KettleUtil;
import net.ys.utils.LogUtil;
import net.ys.utils.TimeUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class EtlService {

    @Resource
    private EtlDao etlDao;

    @Resource
    private DbDao dbDao;

    public static Map<String, TimerTask> jobs;
    public static Timer timer;

    //单次传输最大限制
    static final int PAGE_SIZE = 500;
    static final String BOUNDARY = "----------HV2ymHFg03ehbqgZCaKO6jyH";

    static {
        jobs = new ConcurrentHashMap<String, TimerTask>(100);
        timer = new Timer();
    }

    public long queryEtlEntityCount(String prjId) {
        return etlDao.queryEtlEntityCount(prjId);
    }

    public List<EtlEntity> queryEtlEntities(String prjId, int page, int pageSize) {
        return etlDao.queryEtlEntities(prjId, page, pageSize);
    }

    public EtlEntity queryEtlEntity(String id) {
        return etlDao.queryEtlEntity(id);
    }

    public boolean updateEtlEntity(EtlEntity etlEntity) {
        return etlDao.updateEtlEntity(etlEntity);
    }

    public EtlEntity addEtlEntity(EtlEntity etlEntity) {
        return etlDao.addEtlEntity(etlEntity);
    }

    public long queryEtlFieldCount(String entityId) {
        return etlDao.queryEtlFieldCount(entityId);
    }

    public List<EtlField> queryEtlFields(String entityId, int page, int pageSize) {
        return etlDao.queryEtlFields(entityId, page, pageSize);
    }

    /**
     * 生成映射文件的字段
     *
     * @param entityId
     * @return
     */
    public List<EtlField> queryEtlKtrFields(String entityId) {
        return etlDao.queryEtlKtrFields(entityId);
    }

    public EtlField addEtlField(EtlField etlField) {
        return etlDao.addEtlField(etlField);
    }

    public EtlProject queryEtlKtrProject(String entityId) {
        return etlDao.queryEtlKtrProject(entityId);
    }

    public long queryEtlProjectCount() {
        return etlDao.queryEtlProjectCount();
    }

    public List<EtlProject> queryEtlProjects(int page, int pageSize) {
        return etlDao.queryEtlProjects(page, pageSize);
    }

    public EtlProject queryEtlProject(String id) {
        return etlDao.queryEtlProject(id);
    }

    public boolean updateEtlProject(EtlProject etlProject) {
        return etlDao.updateEtlProject(etlProject);
    }

    public EtlProject addEtlProject(EtlProject etlProject) {
        return etlDao.addEtlProject(etlProject);
    }

    public List<EtlAllField> queryFields(EtlAllTable table) {
        return etlDao.queryFields(table);
    }

    public long queryEtlDataSourceCount() {
        return etlDao.queryEtlDataSourceCount();
    }

    public List<EtlDataSource> queryEtlDataSources(int page, int pageSize) {
        return etlDao.queryEtlDataSources(page, pageSize);
    }

    public EtlDataSource queryEtlDataSource(String id) {
        return etlDao.queryEtlDataSource(id);
    }

    public boolean updateEtlDataSource(EtlDataSource etlDataSource) {
        boolean flag = testConnDs(etlDataSource);
        etlDataSource.setAlive(flag ? 1 : 0);
        return etlDao.updateEtlDataSource(etlDataSource);
    }

    public EtlDataSource addEtlDataSource(EtlDataSource etlDataSource) {
        boolean flag = testConnDs(etlDataSource);
        etlDataSource.setAlive(flag ? 1 : 0);
        return etlDao.addEtlDataSource(etlDataSource);
    }

    public List<EtlAllTable> querySrcTables(EtlProject project) {
        return etlDao.queryEtlAllTables(project.getSrcDbId());
    }

    public List<EtlAllTable> queryDesTables(EtlProject project) {
        return etlDao.queryEtlAllTables(project.getDesDbId());
    }

    public List<EtlAllField> queryPrimaryKey(String tableId) {
        return etlDao.queryPrimaryKey(tableId);
    }

    public boolean testConnDs(EtlDataSource etlDataSource) {
        int dbType = etlDataSource.getDbType();
        boolean flag = false;
        if (dbType == DbType.MY_SQL.type) {
            flag = DBUtil.testConnMySql(etlDataSource);
        } else if (dbType == DbType.ORACLE.type) {
            flag = DBUtil.testConnOracle(etlDataSource);
        } else if (dbType == DbType.MS_SQL.type) {
            flag = DBUtil.testConnMSSQL(etlDataSource);
        }
        return flag;
    }

    public boolean entityDel(String id) {
        return etlDao.entityDel(id);
    }

    public boolean projectDel(String id) {
        return etlDao.projectDel(id);
    }

    public boolean fieldDel(String id) {
        return etlDao.fieldDel(id);
    }

    public boolean chgJobStatus(String entityId, int status) {
        return etlDao.chgJobStatus(entityId, status);
    }

    public boolean chgApiJobStatus(String entityId, int status) {
        return etlDao.chgApiJobStatus(entityId, status);
    }

    public EtlAllTable querySrcEtlAllTable(String prjId, String tabName) {
        return etlDao.querySrcEtlAllTable(prjId, tabName);
    }

    public EtlAllTable queryDesEtlAllTable(String prjId, String tabName) {
        return etlDao.queryDesEtlAllTable(prjId, tabName);
    }

    /**
     * 启动所有已开启的etl进行传输
     */
    public List<Map<String, Object>> queryStartedEntities() {
        return etlDao.queryEtlStartedEntities();
    }

    /**
     * 启动所有已开启的api任务进行传输
     */
    public List<EtlEntity> queryStartedApiEntities() {
        return etlDao.queryStartedApiEntities();
    }

    public boolean genTables(EtlDataSource dataSource) {
        boolean flag = false;
        if (dataSource != null && dataSource.getAlive() == 1) {
            int type = dataSource.getDbType();

            List<DbTable> tables = null;
            if (type == DbType.MY_SQL.type) {
                tables = DBUtil.getTablesMySql(dataSource.getDbIp(), dataSource.getDbPort(), dataSource.getDbName(), dataSource.getDbUsername(), dataSource.getDbPwd());
            } else if (type == DbType.ORACLE.type) {
                tables = DBUtil.getTablesOracle(dataSource.getDbIp(), dataSource.getDbPort(), dataSource.getDbName(), dataSource.getDbUsername(), dataSource.getDbPwd());
            } else if (type == DbType.MS_SQL.type) {
                tables = DBUtil.getTablesMSSQL(dataSource.getDbIp(), dataSource.getDbPort(), dataSource.getDbName(), dataSource.getDbUsername(), dataSource.getDbPwd());
            }

            if (tables != null && tables.size() > 0) {
                dbDao.addTables(dataSource.getId(), tables);
            }

            List<EtlAllTable> etlAllTables = etlDao.queryEtlAllTables(dataSource.getId());
            List<String> tableIdList = compareTables(tables, etlAllTables);

            if (tableIdList.size() > 0) {
                etlDao.delTables(tableIdList);
            }

            flag = true;
        }
        return flag;
    }

    private List<String> compareTables(List<DbTable> tables, List<EtlAllTable> sysTables) {
        List<String> list = new ArrayList<String>();

        if (sysTables.size() > 0) {
            boolean exist;
            for (EtlAllTable sysTable : sysTables) {
                exist = false;
                for (DbTable table : tables) {
                    if (table.getTableName().equalsIgnoreCase(sysTable.getName())) {
                        exist = true;
                        break;
                    }
                }

                if (!exist) {
                    list.add(sysTable.getId());
                }
            }
        }
        return list;
    }

    public boolean genFields(EtlDataSource dataSource) {
        boolean flag = false;
        List<EtlAllTable> tables = dbDao.queryEtlAllTables(dataSource);
        int type = dataSource.getDbType();
        List<DbField> fields;
        List<EtlAllField> etlAllFields;
        List<String> fieldIdList;
        if (type == DbType.MY_SQL.type) {
            for (EtlAllTable table : tables) {
                fields = DBUtil.getFieldsMySql(dataSource.getDbIp(), dataSource.getDbPort(), dataSource.getDbName(), table, dataSource.getDbUsername(), dataSource.getDbPwd());
                if (fields != null && fields.size() > 0) {
                    dbDao.addFields(fields);
                }

                etlAllFields = etlDao.queryEtlAllFields(table.getId());
                fieldIdList = compareFields(fields, etlAllFields);
                if (fieldIdList.size() > 0) {
                    etlDao.delFields(fieldIdList);
                }
            }
            flag = true;
        } else if (type == DbType.ORACLE.type) {
            for (EtlAllTable table : tables) {
                fields = DBUtil.getFieldsOracle(dataSource.getDbIp(), dataSource.getDbPort(), dataSource.getDbName(), table, dataSource.getDbUsername(), dataSource.getDbPwd());
                if (fields != null && fields.size() > 0) {
                    dbDao.addFields(fields);
                }
                etlAllFields = etlDao.queryEtlAllFields(table.getId());
                fieldIdList = compareFields(fields, etlAllFields);
                if (fieldIdList.size() > 0) {
                    etlDao.delFields(fieldIdList);
                }
            }
            flag = true;
        } else if (type == DbType.MS_SQL.type) {
            for (EtlAllTable table : tables) {
                fields = DBUtil.getFieldsMSSQL(dataSource.getDbIp(), dataSource.getDbPort(), dataSource.getDbName(), table, dataSource.getDbUsername(), dataSource.getDbPwd());
                if (fields != null && fields.size() > 0) {
                    dbDao.addFields(fields);
                }
                etlAllFields = etlDao.queryEtlAllFields(table.getId());
                fieldIdList = compareFields(fields, etlAllFields);
                if (fieldIdList.size() > 0) {
                    etlDao.delFields(fieldIdList);
                }
            }
            flag = true;
        }

        return flag;
    }

    private List<String> compareFields(List<DbField> fields, List<EtlAllField> etlAllFields) {
        List<String> list = new ArrayList<String>();

        if (etlAllFields.size() > 0) {
            boolean exist;
            for (EtlAllField etlAllField : etlAllFields) {
                exist = false;
                for (DbField field : fields) {
                    if (field.getFieldName().equalsIgnoreCase(etlAllField.getName())) {
                        exist = true;
                        break;
                    }
                }

                if (!exist) {
                    list.add(etlAllField.getId());
                }
            }
        }
        return list;
    }

    public void genTablesAndFields(final EtlDataSource etlDataSource) {
        Runnable r = new Runnable() {
            @Override
            public void run() {
                try {
                    boolean flag = genTables(etlDataSource);
                    if (flag) {
                        genFields(etlDataSource);
                    }
                } catch (Exception e) {
                    LogUtil.error(e);
                }
            }
        };
        ThreadPoolManager.INSTANCE.complexPool.doIt(r);
    }

    public boolean stopAllEtlJob(String prjId) {
        return etlDao.stopAllEtlJob(prjId);
    }

    public boolean stopAllApiJob(String prjId) {
        return etlDao.stopAllApiJob(prjId);
    }

    public long queryEtlAllTableCount(String dsId) {
        return etlDao.queryEtlAllTableCount(dsId);
    }

    public List<EtlAllTable> queryEtlAllTables(String dsId, int page, int pageSize) {
        return etlDao.queryEtlAllTables(dsId, page, pageSize);
    }

    /**
     * 启动api传输任务
     *
     * @param project
     * @param entity
     * @param fields
     * @return
     */
    public boolean startApiJob(EtlProject project, EtlEntity entity, List<EtlField> fields) {

        try {
            Map<String, String> sql = genSql(project.getCenterDbType(), entity, fields);

            TimerTask timerTask = new ApiTimerTask(project, entity, sql.get("sqlSelect"), sql.get("sqlCount"));
            int repeat = entity.getRepeat();
            if (repeat == 0) {//无需重复
                timer.schedule(timerTask, 3000);
                return true;
            }

            int intervalMinute = entity.getIntervalMinute();
            int intervalSecond = entity.getIntervalSecond();
            long delay = X.TIME.MINUTE_MILLISECOND * intervalMinute + X.TIME.SECOND_MILLISECOND * intervalSecond;
            timer.schedule(timerTask, 3000, delay);
            jobs.put(entity.getId(), timerTask);//加入到内存中，以便后续停止操作
            return true;
        } catch (Exception e) {
            LogUtil.error(e);
        }

        return false;
    }

    /**
     * 重启etl传输任务，重启服务用
     *
     * @return
     */
    public void restartEtlJob(String kjbPath) {
        try {
            List<Map<String, Object>> etlEntities = queryStartedEntities();
            if (etlEntities.size() > 0) {
                for (Map<String, Object> etlEntity : etlEntities) {
                    String entityId = String.valueOf(etlEntity.get("id"));
                    String etlId = String.valueOf(etlEntity.get("etl_id"));
                    KettleUtil.startEtlJob(kjbPath + etlId + ".kjb", entityId);
                }
            }
        } catch (Exception e) {
            LogUtil.error(e);
        }
    }

    /**
     * 重启api传输任务，重启服务用
     *
     * @return
     */
    public void restartApiJob() {
        try {
            List<EtlEntity> etlEntities = queryStartedApiEntities();
            List<EtlField> fields;
            EtlEntity entity;
            EtlProject project;
            Map<String, String> sql;
            TimerTask timerTask;
            for (EtlEntity etlEntity : etlEntities) {
                String entityId = etlEntity.getId();
                fields = queryEtlKtrFields(entityId);
                entity = queryEtlEntity(entityId);
                project = queryEtlKtrProject(entityId);
                sql = genSql(project.getCenterDbType(), entity, fields);
                timerTask = new ApiTimerTask(project, entity, sql.get("sqlSelect"), sql.get("sqlCount"));
                int intervalMinute = entity.getIntervalMinute();
                int intervalSecond = entity.getIntervalSecond();
                long delay = X.TIME.MINUTE_MILLISECOND * intervalMinute + X.TIME.SECOND_MILLISECOND * intervalSecond;
                timer.schedule(timerTask, 3000, delay);
                jobs.put(entity.getId(), timerTask);//加入到内存中，以便后续停止操作
            }
        } catch (Exception e) {
            LogUtil.error(e);
        }
    }

    public boolean stopApiJob(String entityId) {
        try {
            TimerTask timerTask = jobs.get(entityId);
            if (timerTask == null) {
                return true;
            }
            timerTask.cancel();
            jobs.remove(entityId);
            return true;
        } catch (Exception e) {
            LogUtil.error(e);
        }
        return false;
    }

    private Map<String, String> genSql(int dbType, EtlEntity entity, List<EtlField> fields) {
        Map<String, String> sql = new HashMap<String, String>();

        String quotLeft;
        String quotRight;
        StringBuffer sqlSelect;
        StringBuffer sqlCount;
        if (dbType == 0) {
            quotLeft = "`";
            quotRight = "`";

            sqlSelect = new StringBuffer("SELECT ").append(quotLeft).append(fields.get(0).getSrcFieldName()).append(quotRight);
            for (int i = 1; i < fields.size(); i++) {
                sqlSelect.append(", ").append(quotLeft).append(fields.get(i).getSrcFieldName()).append(quotRight);
            }
            sqlSelect.append(" FROM ").append(quotLeft).append(entity.getSrcTabName()).append(quotRight).append(" WHERE SYS__CREATE_OR_UPDATE_TIME BETWEEN ? AND ? ORDER BY SYS__CREATE_OR_UPDATE_TIME, ").append(quotLeft).append(entity.getSrcPrimaryKey()).append(quotRight).append(" LIMIT ?,?");
            sqlCount = new StringBuffer("SELECT COUNT(*) AS C FROM ").append(quotLeft).append(entity.getSrcTabName()).append(quotRight).append(" WHERE SYS__CREATE_OR_UPDATE_TIME BETWEEN ? AND ?");
        } else if (dbType == 1) {
            quotLeft = "\"";
            quotRight = "\"";

            sqlSelect = new StringBuffer("SELECT * FROM ( SELECT T1.*, ROWNUM AS ORACLE___RW FROM (SELECT ").append(quotLeft).append(fields.get(0).getSrcFieldName()).append(quotRight);
            for (int i = 1; i < fields.size(); i++) {
                sqlSelect.append(", ").append(quotLeft).append(fields.get(i).getSrcFieldName()).append(quotRight);
            }
            sqlSelect.append(" FROM ").append(quotLeft).append(entity.getSrcTabName()).append(quotRight).append(" WHERE to_char(SYS__CREATE_OR_UPDATE_TIME,'yyyy-mm-dd HH24:mi:ss') BETWEEN ? AND ? ORDER BY SYS__CREATE_OR_UPDATE_TIME, ").append(quotLeft).append(entity.getSrcPrimaryKey()).append(quotRight).append(") T1) T2 WHERE T2.ORACLE___RW >= ? AND T2.ORACLE___RW < ? ");
            sqlCount = new StringBuffer("SELECT COUNT(*) AS C FROM ").append(quotLeft).append(entity.getSrcTabName()).append(quotRight).append(" WHERE to_char(SYS__CREATE_OR_UPDATE_TIME,'yyyy-mm-dd HH24:mi:ss') BETWEEN ? AND ?");
        } else {
            quotLeft = "[";
            quotRight = "]";

            sqlSelect = new StringBuffer("SELECT ").append(quotLeft).append(fields.get(0).getSrcFieldName()).append(quotRight).append(" ");
            for (int i = 1; i < fields.size(); i++) {
                sqlSelect.append(", ").append(quotLeft).append(fields.get(i).getSrcFieldName()).append(quotRight).append(" ");
            }
            sqlSelect.append(" FROM ").append(quotLeft).append(entity.getSrcTabName()).append(quotRight).append(" WHERE SYS__CREATE_OR_UPDATE_TIME BETWEEN ? AND ? ORDER BY SYS__CREATE_OR_UPDATE_TIME, ").append(quotLeft).append(entity.getSrcPrimaryKey()).append(quotRight).append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
            sqlCount = new StringBuffer("SELECT COUNT(*) AS C FROM ").append(quotLeft).append(entity.getSrcTabName()).append(quotRight).append(" WHERE SYS__CREATE_OR_UPDATE_TIME BETWEEN ? AND ?");
        }

        sql.put("sqlSelect", sqlSelect.toString());
        sql.put("sqlCount", sqlCount.toString());
        LogUtil.debug(sqlCount, sqlSelect);
        return sql;
    }

    /**
     * 定时同步待传输数据,分页传输
     */
    public boolean uploadDataStep(URL url, List<Map<String, Object>> dataList) {
        HttpURLConnection connection = null;
        try {
            String data = JSONArray.fromObject(dataList).toString();
            connection = (HttpURLConnection) url.openConnection();
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setUseCaches(false);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Connection", "Keep-Alive");
            connection.setRequestProperty("Charset", X.ENCODING.U);
            connection.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);
            StringBuffer contentBody = new StringBuffer();
            contentBody.append("--").append(BOUNDARY).append("\r\nContent-Disposition: form-data; name=\"data\"\r\n\r\n").append(data).append("\r\n--").append(BOUNDARY);
            contentBody.append(BOUNDARY).append("--\r\n\r\n--").append(BOUNDARY).append("--\r\n");
            OutputStream out = connection.getOutputStream();
            out.write(contentBody.toString().getBytes(X.ENCODING.U));
            out.flush();
            out.close();
            InputStream in = connection.getInputStream();
            int statusCode = connection.getResponseCode();
            if (statusCode == 200) {
                byte[] bytes = new byte[in.available()];
                in.read(bytes);
                String resp = new String(bytes, 0, bytes.length);
                JSONObject jsonObject = JSONObject.fromObject(resp);
                int resultCode = jsonObject.optInt("code");
                if (resultCode == 1000) {//上传成功
                    return true;
                } else {
                    LogUtil.info("uploadDataStep-error-code-->" + jsonObject.optInt("code") + " msg:" + jsonObject.optString("msg"));
                }
            }
        } catch (Exception e) {
            LogUtil.error(e);
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
        return false;
    }

    public boolean insertOrUpdateDate(String tableName, String data) {
        JSONArray jsonArray = JSONArray.fromObject(data);
        if (jsonArray.size() == 0) {
            return true;
        }

        JSONObject object = jsonArray.getJSONObject(0);
        Set<String> keys = object.keySet();
        StringBuffer sql = new StringBuffer("INSERT INTO `").append(tableName).append("` (");
        boolean flag = false;
        for (String key : keys) {
            if ("ORACLE___RW".equals(key)) {
                flag = true;
                continue;
            }
            sql.append(" `").append(key).append("`,");
        }
        sql.deleteCharAt(sql.length() - 1);
        int markSize;
        if (flag) {
            markSize = keys.size() - 1;
        } else {
            markSize = keys.size();
        }
        sql.append(") VALUES (").append(genMark(markSize)).append(") ON DUPLICATE KEY UPDATE ");

        for (String key : keys) {
            if ("ORACLE___RW".equals(key)) {
                continue;
            }
            sql.append("`").append(key).append("` = ?,");
        }

        sql.deleteCharAt(sql.length() - 1);

        LogUtil.debug(sql);

        return etlDao.insertOrUpdateDate(sql.toString(), jsonArray);
    }

    /**
     * 生成问号字符串
     *
     * @param size
     * @return
     */
    public String genMark(int size) {
        StringBuffer sb = new StringBuffer("?");
        for (int i = 1; i < size; i++) {
            sb.append(",?");
        }
        return sb.toString();
    }

    class ApiTimerTask extends TimerTask {

        private EtlProject project;
        private EtlEntity entity;
        private String sqlSelect;
        private String sqlCount;

        ApiTimerTask(EtlProject project, EtlEntity entity, String sqlSelect, String sqlCount) {
            this.project = project;
            this.entity = entity;
            this.sqlSelect = sqlSelect;
            this.sqlCount = sqlCount;
        }

        @Override
        public void run() {
            try {
                int dbType = project.getCenterDbType();
                String now = TimeUtil.genYmdHms();
                String lastTransTime = etlDao.queryLastTransTime(entity);
                String tableName = entity.getDesTabName();
                URL url = new URL(SysConfig.uploadApiUrl + "/api/upload.do?table_name=" + tableName);
                Connection connection;
                if (dbType == 0) {
                    connection = DBUtil.getConnectionMySql(project.getCenterDbIp(), Integer.parseInt(project.getCenterDbPort()), project.getCenterDbName(), project.getCenterDbUsername(), project.getCenterDbPwd());
                } else if (dbType == 1) {
                    connection = DBUtil.getConnectionOracle(project.getCenterDbIp(), Integer.parseInt(project.getCenterDbPort()), project.getCenterDbName(), project.getCenterDbUsername(), project.getCenterDbPwd());
                } else {
                    connection = DBUtil.getConnectionMSSQL(project.getCenterDbIp(), Integer.parseInt(project.getCenterDbPort()), project.getCenterDbName(), project.getCenterDbUsername(), project.getCenterDbPwd());
                }

                long dataCount = DBUtil.getDataCount(connection, sqlCount, lastTransTime, now);
                LogUtil.debug("tableName:::" + tableName + "\t\tlastTransTime:::" + lastTransTime + "\t\tdataCount:::" + dataCount + "\t\tuploadData-start");
                if (dataCount > 0) {
                    long page = dataCount / PAGE_SIZE + (dataCount % PAGE_SIZE == 0 ? 0 : 1);
                    List<Map<String, Object>> data;
                    boolean flag;
                    int startPos;
                    int endPos;
                    for (int i = 1; i <= page; i++) {
                        startPos = (i - 1) * PAGE_SIZE;
                        if (dbType == 0 || dbType == 2) {
                            endPos = PAGE_SIZE;
                        } else {//oracle特殊
                            endPos = i * PAGE_SIZE;
                        }

                        data = DBUtil.getData(connection, sqlSelect, lastTransTime, now, startPos, endPos);
                        flag = uploadDataStep(url, data);
                        if (!flag) {
                            return;
                        }
                    }
                }

                DBUtil.closeConnection(connection);
                etlDao.updateApiTransTime(entity, now);

                LogUtil.debug("tableName:::" + tableName + "\t\tuploadData-end");
            } catch (Exception e) {
                LogUtil.error(e);
            }
        }
    }
}
