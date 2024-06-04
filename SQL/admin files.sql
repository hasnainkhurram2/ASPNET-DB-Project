create table admin(
admin_id int primary key,
name varchar(20),
password int,
)

insert into admin values (1, 'James', 123456)

create procedure Check_admins
@admin_id int,
@password int
as begin
select* from admin
where admin_id=@admin_id and password=@password;
end

exec Check_admins @admin_id=1, @password=123456


