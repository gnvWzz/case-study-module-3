package com.example.casestudymodule3.service;

import com.example.casestudymodule3.model.Gear;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    public void insertGear(Gear gear) throws SQLException;

    public Gear selectGear(int id);

    public List<Gear> selectAllGears();

    public boolean deleteGear(int id) throws SQLException;

    public boolean updateGear(Gear gear) throws SQLException;

    public List<Gear> findGearByName(String name);

    public List<Gear> sortGearByNameASC();

    public List<Gear> sortGearByNameDESC();

    public Gear selectGear(String image);

    public List<Gear> findGearByManufacturer(String manufacturer);

    public List<Gear> findGearByType(String type);

    public List<Gear> findCloseName(String closeName);
}
