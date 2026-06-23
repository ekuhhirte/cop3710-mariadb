#include <iostream>
#include <mariadb/conncpp.hpp>

int main(){
    try {
        // Instantiate Driver
        sql::Driver* driver = sql::mariadb::get_driver_instance();
        
        // Configure Connection properties
        sql::SQLString url("jdbc:mariadb://localhost:3306/LRH_Catapult");
        sql::Properties properties({
            {"user", "root"},
            {"password", "rootpass"}
        });
        
        // Establish Connection
        std::cout << "Connecting to database..." << std::endl;
        std::unique_ptr<sql::Connection> conn(driver->connect(url, properties));
        
        // Check Status
        if (conn && conn->isValid()) {
            std::cout << "SUCCESS: Connected to MariaDB successfully!" << std::endl;
        } else {
            std::cerr << "FAILURE: Connection object is invalid." << std::endl;
            return 1;
        }
    } 
    catch (sql::SQLException& e) {
        std::cerr << "SQL ERROR: " << e.what() << std::endl;
        std::cerr << "Error Code: " << e.getErrorCode() << std::endl;
        return 1;
    }
    
    return 0;
}