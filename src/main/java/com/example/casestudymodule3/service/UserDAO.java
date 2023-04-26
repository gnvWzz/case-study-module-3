package com.example.casestudymodule3.service;

import com.example.casestudymodule3.model.Gear;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO{
    private final String jdbcURL = "jdbc:mysql://localhost:3306/gaminggear?useSSL=false";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "123";
    private final String FIND_CLOSE_NAME = "select * from gears where name like '%' ? '%';";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public void insertGear(Gear gear) throws SQLException {
        String query = "{CALL insert_gear(?,?,?,?,?,?)}";

        try (Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query);) {
            callableStatement.setString(1, gear.getName());
            callableStatement.setString(2, gear.getManufacturer());
            callableStatement.setString(3, gear.getType());
            callableStatement.setLong(4, gear.getPrice());
            callableStatement.setString(5, gear.getDescription());
            callableStatement.setString(6, gear.getImage());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public Gear selectGear(int id) {
        Gear gear = null;
        String query = "{CALL select_gear(?)}";

        try (Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query)) {
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String manufacturer = rs.getString("manufacturer");
                String type = rs.getString("type");
                long price = rs.getLong("price");
                String description = rs.getString("description");
                String image = rs.getString("image");
                gear = new Gear(id, name, manufacturer, type, price, description, image);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return gear;
    }

    @Override
    public List<Gear> selectAllGears() {
        List<Gear> gears = new ArrayList<>();
        String query = "{CALL select_all_gears}";

        try (Connection connection = getConnection();
            CallableStatement callableStatement = getConnection().prepareCall(query);) {
            System.out.println(callableStatement);

            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String manufacturer = rs.getString("manufacturer");
                String type = rs.getString("type");
                long price = rs.getLong("price");
                String description = rs.getString("description");
                String image = rs.getString("image");
                gears.add(new Gear(id, name, manufacturer, type, price, description, image));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return gears;
    }

    @Override
    public boolean deleteGear(int id) throws SQLException {
        boolean rowDeleted;
        String query = "{CALL delete_gear(?)}";
        try (Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query);) {
            callableStatement.setInt(1, id);
            rowDeleted = callableStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateGear(Gear gear) throws SQLException {
        boolean rowUpdated;
        String query = "{CALL update_gear(?,?,?,?,?,?,?)}";
        try (Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query);) {
            callableStatement.setString(1, gear.getName());
            callableStatement.setString(2, gear.getManufacturer());
            callableStatement.setString(3, gear.getType());
            callableStatement.setLong(4, gear.getPrice());
            callableStatement.setString(5, gear.getDescription());
            callableStatement.setString(6, gear.getImage());
            callableStatement.setInt(7, gear.getId());

            rowUpdated = callableStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public List<Gear> findGearByName(String name) {
        List<Gear> gearList = new ArrayList<>();
        String query = "{CALL find_gear_by_name(?)}";
        try (Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query);) {
            callableStatement.setString(1,name);
            System.out.println(callableStatement);
            ResultSet resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String manufacturer = resultSet.getString("manufacturer");
                String type = resultSet.getString("type");
                long price = Long.parseLong(resultSet.getString("price"));
                String description = resultSet.getString("description");
                String image = resultSet.getString("image");
                gearList.add(new Gear(id,name,manufacturer,type,price,description,image));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gearList;
    }

    @Override
    public List<Gear> sortGearByNameASC() {
        List<Gear> gearListSortedByNameASC = new ArrayList<>();
        String query = "{CALL sort_gears_by_name_asc}";

        try (Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query);) {
            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String manufacturer = rs.getString("manufacturer");
                String type = rs.getString("type");
                long price = Long.parseLong(rs.getString("price"));
                String description = rs.getString("description");
                String image = rs.getString("image");
                gearListSortedByNameASC.add(new Gear(id,name,manufacturer,type,price,description,image));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return gearListSortedByNameASC;
    }

    @Override
    public List<Gear> sortGearByNameDESC() {
        List<Gear> gearListSortedByNameDESC = new ArrayList<>();
        String query = "{CALL sort_gears_by_name_desc}";

        try (Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query);) {
            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String manufacturer = rs.getString("manufacturer");
                String type = rs.getString("type");
                long price = Long.parseLong(rs.getString("price"));
                String description = rs.getString("description");
                String image = rs.getString("image");
                gearListSortedByNameDESC.add(new Gear(id,name,manufacturer,type,price,description,image));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return gearListSortedByNameDESC;
    }

    @Override
    public Gear selectGear(String image) {
        Gear gear = null;
        String query = "{CALL select_gear_by_image(?)}";

        try (Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query)) {
            callableStatement.setString(1, image);
            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String manufacturer = rs.getString("manufacturer");
                String type = rs.getString("type");
                long price = rs.getLong("price");
                String description = rs.getString("description");
                gear = new Gear(id, name, manufacturer, type, price, description, image);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return gear;
    }

    @Override
    public List<Gear> findGearByManufacturer(String manufacturer) {
        List<Gear> gearList = new ArrayList<>();
        String query = "{CALL find_gear_by_manufacturer(?)}";
        try (Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query);) {
            callableStatement.setString(1,manufacturer);
            System.out.println(callableStatement);
            ResultSet resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String type = resultSet.getString("type");
                long price = Long.parseLong(resultSet.getString("price"));
                String description = resultSet.getString("description");
                String image = resultSet.getString("image");
                gearList.add(new Gear(id,name,manufacturer,type,price,description,image));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gearList;
    }

    @Override
    public List<Gear> findGearByType(String type) {
        List<Gear> gearList = new ArrayList<>();
        String query = "{CALL find_gear_by_type(?)}";
        try (Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query);) {
            callableStatement.setString(1,type);
            System.out.println(callableStatement);
            ResultSet resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String manufacturer = resultSet.getString("manufacturer");
                long price = Long.parseLong(resultSet.getString("price"));
                String description = resultSet.getString("description");
                String image = resultSet.getString("image");
                gearList.add(new Gear(id,name,manufacturer,type,price,description,image));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gearList;
    }

    @Override
    public List<Gear> findCloseName(String closeName) {
        List<Gear> gearList = new ArrayList<>();
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_CLOSE_NAME);) {
            preparedStatement.setString(1,closeName);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String manufacturer = resultSet.getString("manufacturer");
                String type = resultSet.getString("type");
                long price = resultSet.getLong("price");
                String description = resultSet.getString("description");
                String image = resultSet.getString("image");
                gearList.add(new Gear(id,name,manufacturer,type,price,description,image));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gearList;
    }
}
