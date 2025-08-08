Create Database Rapido;
use Rapido;

SELECT * FROM RIDE;



-- Q1). Retrieve all successful Ride:

CREATE VIEW Successful_Ride AS
    SELECT 
        *
    FROM
        RIDE
    WHERE
        RIDE_STATUS = 'COMPLETED';

SELECT * FROM SUCCESSFUL_RIDE;




-- Q2). Find the average ride distance for each vehicle type:

CREATE VIEW Average_Distance AS
    SELECT 
        services, AVG(distance) AS Avg_Distance
    FROM
        ride
    GROUP BY services;

SELECT *  FROM AVERAGE_DISTANCE; 



-- Q3). Get the total number of cancelled rides by customers:

CREATE VIEW Total_Cancelled_Ride AS
    SELECT 
        COUNT(*) AS Cancelled_Ride
    FROM
        ride
    WHERE
        ride_status = 'cancelled';
        
SELECT * FROM TOTAL_CANCELLED_RIDE; 
        
        

-- Q4). Ratio of Successful Vs Cancelled Ride:

CREATE VIEW Ride_Status_Ratio AS
    SELECT 
        SUM(CASE
            WHEN ride_status = 'completed' THEN 1
            ELSE 0
        END) / SUM(CASE
            WHEN ride_status = 'cancelled' THEN 1
            ELSE 0
        END) AS Ratio
    FROM
        ride;
        
	SELECT * FROM RIDE_STATUS_RATIO;
    
    
    
    -- Q5). List the top 5 Ride_id who booked the highest number of rides:
    
    CREATE VIEW HighestBooked_Ride_Id AS
    SELECT 
        ride_id, COUNT(*) AS Total_Ride
    FROM
        ride
    GROUP BY ride_id
    ORDER BY Total_Ride DESC
    LIMIT 5;

SELECT * FROM HIGHESTBOOKED_RIDE_ID;



-- Q6). Get the number of rides which was done by bike and auto :

CREATE VIEW Ride_By_Bike_Auto AS
    SELECT 
        services, COUNT(*) AS Total_ride
    FROM
        ride
    WHERE
        services IN ('bike' , 'auto')
    GROUP BY services;

SELECT * FROM RIDE_BY_BIKE_AUTO;



-- Q7). Find the maximum and minimum Ride_Charge by Services:

CREATE VIEW Max_Min_Charge AS
    SELECT 
        services,
        MAX(ride_charge) AS Max_Charge,
        MIN(ride_charge) AS Min_Charge
    FROM
        ride
    GROUP BY services;
    
    SELECT * FROM MAX_MIN_CHARGE;



-- Q8. Retrieve all rides where payment was made using GPay , misc_charge >40 and total_Fare is less then 200:

CREATE VIEW GPay_MiscCharge_TotalFare AS
    SELECT 
        *
    FROM
        ride
    WHERE
        payment_method = 'GPay'
            AND misc_charge > 40
            AND total_fare < 200;
            
SELECT * FROM GPAY_MISCCHARGE_TOTALFARE;



-- Q9). Find the average Ride_Charge and Total Rides in July 2024:

CREATE VIEW July2024_Data AS
    SELECT 
        AVG(ride_charge) AS Avg_Charge, COUNT(*) AS Total_Rides
    FROM
        ride
    WHERE
        date LIKE ('%07-2024');
        
SELECT * FROM JULY2024_DATA;



-- Q10). List all Cancelled rides along with the destination which was cancelled by more then 1 time:

CREATE VIEW Cancelled_Ride_Destination AS
    SELECT 
        destination, COUNT(destination) AS Total_times
    FROM
        ride
    WHERE
        ride_status = 'cancelled'
    GROUP BY destination
    HAVING Total_times > 1;
    
SELECT * FROM CANCELLED_RIDE_DESTINATION;




# Retrieve All Answers :-


-- Q1). Retrieve all successful Ride:
SELECT * FROM SUCCESSFUL_RIDE;

-- Q2). Find the average ride distance for each vehicle type:
SELECT *  FROM AVERAGE_DISTANCE; 

-- Q3). Get the total number of cancelled rides by customers:
SELECT * FROM TOTAL_CANCELLED_RIDE; 

-- Q4). Ratio of Successful Vs Cancelled Ride:
SELECT * FROM RIDE_STATUS_RATIO;

-- Q5). List the top 5 Ride_id who booked the highest number of rides:
SELECT * FROM HIGHESTBOOKED_RIDE_ID;

-- Q6). Get the number of rides which was done by bike and auto :
SELECT * FROM RIDE_BY_BIKE_AUTO;

-- Q7). Find the maximum and minimum Ride_Charge by Services:
SELECT * FROM MAX_MIN_CHARGE;

-- Q8. Retrieve all rides where payment was made using GPay , misc_charge >40 and total_Fare is less than 200:
SELECT * FROM GPAY_MISCCHARGE_TOTALFARE;

-- Q9). Find the average Ride_Charge and Total Rides in July 2024:
SELECT * FROM JULY2024_DATA;

-- Q10). List all Cancelled rides along with the destination which was cancelled by more than 1 time:
SELECT * FROM CANCELLED_RIDE_DESTINATION;
