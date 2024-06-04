create table flights(
flight_id int primary key,
airline_id int,
flight_date date,
depart_airport_id int,
arrival_airport_id int,
depart_time time,
arrival_time time,
duration time,
plane_id int,
seats_left int,
);

create table staff(
staff_id int primary key,
name varchar(100),
roll varchar(100),
);

create table crew(
crew_id int,
flight_id int,
pilot_id int,
copilot_id int,
staff1 int,
staff2 int,
staff3 int

primary key(crew_id, flight_id),
foreign key (pilot_id) references staff(staff_id),
foreign key (copilot_id) references staff(staff_id),
foreign key (staff1) references staff(staff_id),
foreign key (staff2) references staff(staff_id),
foreign key (staff3) references staff(staff_id),
);


create table airlines(
airline_id int primary key,
name varchar(100),
);

create table airports(
airport_id int primary key,
name varchar(100),
city varchar(100),
country varchar(100),
);

create table planes(
plane_id int primary key,
airline_id int,
name varchar(100),
company varchar(100),
model int,
capacity int,
);

create table passengers(
passenger_id int primary key,
full_name varchar(100) not null,
dob varchar(15),
email varchar(100),
Ph_no varchar(20),
country varchar(30),
city varchar(30),
pincode int,
full_address varchar(100),
password varchar(30) not null,
);

create table admin(
admin_id int primary key,
name varchar(30),
password varchar(30),
);


create table prices(
flight_id int,
class varchar(100),
price decimal,

primary key(flight_id,class)
);


create table bookings(
booking_id int primary key,
passenger_id int,
flight_id int,
seat_no int,
booking_date date,
payment_method varchar(100),
class varchar(100),
seat_type varchar(20) not null,
constraint Check_Seat_Type check(seat_type in('Aisle', 'Window')),
constraint payment_method check(seat_type in('credit', 'debit')),
foreign key(flight_id,class) references prices(flight_id,class)
);

alter table flights
add constraint fk
foreign key (airline_id) references airlines(airline_id);

alter table flights
add constraint fk1
foreign key (depart_airport_id) references airports(airport_id);

alter table flights
add constraint fk2
foreign key (arrival_airport_id) references airports(airport_id);

alter table flights
add constraint fk3
foreign key (plane_id) references planes(plane_id);

alter table bookings
add constraint fk4
foreign key (passenger_id) references passengers(passenger_id);

alter table bookings
add constraint fk5
foreign key (flight_id) references flights(flight_id);

alter table crew
add constraint fk6
foreign key (flight_id) references flights(flight_id);

alter table airplane
add constrant fk7
foreign key (airline_id) references airlines(airline_id);

select* from passengers;
delete from passengers;