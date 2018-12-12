package net.ys.constant;

public enum DbType {

    MY_SQL(0), ORACLE(1), MS_SQL(2);

    public int type;

    private DbType(int type) {
        this.type = type;
    }
}
