package br.csi.model;

public class Compra  {

    private static int id_compra;

    private int data_compra;

    public int getId_compra() {
        return id_compra;
    }

    public static void setid_compra(int id) {
        id_compra = id;
    }

    public int getData_compra() {
        return data_compra;
    }

    public void setData_compra(int data_compra) {
        this.data_compra = data_compra;
    }
}
