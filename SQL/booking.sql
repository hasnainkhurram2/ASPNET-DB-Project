select* from flights as f join airports as a on a.airport_id = f.depart_airport_id where f.depart_airport_id IN ( select airport_id from airports where name = 'John F. Kennedy International Airport' ) and f.arrival_airport_id IN( select airport_id from airports where name = 'Los Angeles International Airport' ) and f.flight_date = '2024-05-01';

select* from flights

select* from passengers   
select* from bookings

delete from passengers

INSERT INTO passengers (passenger_id, full_name, dob, email, Ph_no, full_address, password, pincode, country, city)
VALUES
(1, 'John Doe', '1990-05-15', 'johndoe@gmail.com', '123-456-7890', '123 Main St, Springfield, USA', 123456, '12345', 'USA', 'Springfield'),
(2, 'Jane Smith', '1985-08-20', 'janesmith@gmail.com', '987-654-3210', '456 Elm St, New York City, USA', 654321, '67890', 'USA', 'New York City'),
(3, 'Michael Johnson', '1978-03-10', 'michaelj@gmail.com', '555-555-5555', '789 Oak Ave, Los Angeles, USA', 987654, '54321', 'USA', 'Los Angeles'),
(4, 'Emily Davis', '1992-11-28', 'emilydavis@gmail.com', '111-222-3333', '321 Pine St, Chicago, USA', 789012, '98765', 'USA', 'Chicago'),
(5, 'Chris Wilson', '1982-09-05', 'chriswilson@gmail.com', '444-444-4444', '654 Maple Rd, Houston, USA', 456789, '24680', 'USA', 'Houston'),
(6, 'Sarah Brown', '1995-07-18', 'sarahbrown@gmail.com', '777-888-9999', '987 Cherry Ln, Miami, USA', 654987, '13579', 'USA', 'Miami'),
(7, 'David Martinez', '1980-12-03', 'davidmartinez@gmail.com', '666-777-8888', '564 Walnut Blvd, San Francisco, USA', 123987, '11223', 'USA', 'San Francisco'),
(8, 'Jessica Taylor', '1987-04-25', 'jessicataylor@gmail.com', '222-333-4444', '789 Birch Ave, Seattle, USA', 789654, '99887', 'USA', 'Seattle'),
(9, 'Matthew Anderson', '1975-06-30', 'matthewa@gmail.com', '999-999-9999', '753 Spruce St, Austin, USA', 456123, '45678', 'USA', 'Austin'),
(10, 'Amanda Thomas', '1998-02-12', 'amandat@gmail.com', '333-222-1111', '852 Pinecone Dr, Denver, USA', 987654, '78901', 'USA', 'Denver');


INSERT INTO bookings (booking_id, passenger_id, flight_id, seat_no, booking_date, payment_method, class, seat_type)
VALUES
(1, 1, 1, 12, '2024-04-26', 'credit', 'Business', 'window'),
(2, 2, 2, 7, '2024-04-27', 'debit', 'Economy', 'aisle'),
(3, 3, 3, 24, '2024-04-28', 'credit', 'First Class', 'window'),
(4, 4, 4, 3, '2024-04-29', 'debit', 'Economy', 'aisle'),
(5, 5, 5, 15, '2024-04-30', 'credit', 'Business', 'window'),
(6, 1, 6, 10, '2024-05-01', 'credit', 'Business', 'window'),
(7, 2, 7, 19, '2024-05-02', 'debit', 'Economy', 'aisle'),
(8, 3, 8, 5, '2024-05-03', 'credit', 'First Class', 'window'),
(9, 4, 9, 18, '2024-05-04', 'debit', 'Economy', 'aisle'),
(10, 5, 10, 9, '2024-05-05', 'credit', 'Business', 'window');

create table bookings(
booking_id int primary key,
passenger_id int,
flight_id int,
seat_no int,
booking_date date,
payment_method varchar(100),
class varchar(100),
seat_type varchar(20) not null,
constraint Check_Seat_Type check(seat_type in('aisle', 'window')),
constraint payment_method check(payment_method in('credit', 'debit')),
foreign key(flight_id,class) references prices(flight_id,class)
);


INSERT INTO prices (flight_id, class, price)
VALUES 
    (1, 'Business', 2000.00), 
    (2, 'Economy', 500.00), 
    (3, 'First Class', 4000.00),
    (4, 'Economy', 600.00),
    (5, 'Business', 1800.00),
    (6, 'Business', 2100.00),
    (7, 'Economy', 700.00),
    (8, 'First Class', 4200.00),
    (9, 'Economy', 650.00),
    (10, 'Business', 1900.00);