CREATE PROCEDURE GetPassengerById
    @PassengerId INT
AS
BEGIN
    SELECT *
    FROM dbo.passengers
    WHERE passenger_id = @PassengerId;
END;


CREATE PROCEDURE check_user
    @PassengerId INT,
	@password varchar(30)
AS
BEGIN
    SELECT *
    FROM dbo.passengers
    WHERE passenger_id = @PassengerId and password=@password;
END;

exec GetPassengerById @passengerID = 1

exec check_user @passengerID = 1, @password=123456

select* from passengers

CREATE PROCEDURE GetBookingDetails
    @BookingId VARCHAR(50),
    @PassengerId VARCHAR(50)
AS
BEGIN
    SELECT a.name AS AirlineName,
           b.seat_no AS SeatNumber,
           b.booking_date AS BookingDate,
           ap1.name AS DepartureAirport,
           ap2.name AS ArrivalAirport
    FROM bookings AS b
    JOIN flights AS f ON f.flight_id = b.flight_id
    JOIN airlines AS a ON a.airline_id = f.airline_id
    JOIN airports AS ap1 ON ap1.airport_id = f.depart_airport_id
    JOIN airports AS ap2 ON ap2.airport_id = f.arrival_airport_id
    WHERE b.booking_id = @BookingId
    AND b.passenger_id = @PassengerId;
END;


ALTER PROCEDURE Searchflights
    @DepartureAirportName VARCHAR(100),
    @ArrivalAirportName VARCHAR(100),
    @FlightDate DATE
AS
BEGIN
    SELECT *
    FROM flights AS f
    JOIN airports AS depart_airport ON depart_airport.airport_id = f.depart_airport_id
    JOIN airports AS arrival_airport ON arrival_airport.airport_id = f.arrival_airport_id
    WHERE depart_airport.name = @DepartureAirportName
    AND arrival_airport.name = @ArrivalAirportName
    AND f.flight_date = @FlightDate;
END;

ALTER PROCEDURE SignUpPassenger
	@PassengerID int,
    @FullName VARCHAR(100),
    @DOB VARCHAR(15),
    @Email VARCHAR(100),
    @PhoneNumber VARCHAR(20),
    @Country VARCHAR(30),
    @City VARCHAR(30),
    @Pincode INT,
    @FullAddress VARCHAR(100),
    @Password VARCHAR(30)
AS
BEGIN
    INSERT INTO dbo.passengers (passenger_id, full_name, dob, email, Ph_no, country, city, pincode, full_address, [password])
    VALUES (@PassengerID, @FullName, @DOB, @Email, @PhoneNumber, @Country, @City, @Pincode, @FullAddress, @Password);
END;




