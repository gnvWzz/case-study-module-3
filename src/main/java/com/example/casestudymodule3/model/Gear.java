package com.example.casestudymodule3.model;

import java.io.Serializable;

public class Gear implements Serializable {
    private int id;
    private String name;
    private String manufacturer;
    private String type;
    private long price;
    private String description;
    private String image;

    public Gear() {
    }

    public Gear(int id, String name, String manufacturer, String type, long price, String description, String image) {
        this.id = id;
        this.name = name;
        this.manufacturer = manufacturer;
        this.type = type;
        this.price = price;
        this.description = description;
        this.image = image;
    }

    public Gear(String name, String manufacturer, String type, long price, String description, String image) {
        this.name = name;
        this.manufacturer = manufacturer;
        this.type = type;
        this.price = price;
        this.description = description;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }
}
