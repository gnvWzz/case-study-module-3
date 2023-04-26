package com.example.casestudymodule3.model;

public class Item {
    private int id;
    private Gear gear;
    private int quantity;
    private long price;
    public Item() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Gear getGear() {
        return gear;
    }

    public void setGear(Gear gear) {
        this.gear = gear;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }
}
