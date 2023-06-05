use seminar_6hw;

# Задача 1
/* Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'
*/
drop function times;
delimiter //
create function times (seconds int)
returns varchar(100)
deterministic
begin
declare days char(3);
declare hours, minutes, sec char(2);
declare result varchar(100);
set days = cast(floor(seconds/60/60/24) as char(3));
set hours = cast(floor(mod(seconds/60/60/24,1)*24) as char(2));
set minutes = cast(floor(mod(mod(seconds/60/60/24,1)*24,1)*60) as char(2));
set sec = cast(round(mod(mod(mod(seconds/60/60/24,1)*24,1)*60,1)*60) as char(2));
set result = concat(days, " days ", hours, " hours ", minutes, " minutes ", sec, " seconds");
return result;
end //
delimiter ;

-- проверка
select times(123456);

# Задача 2
-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
drop function even_numbers;

delimiter //
create function even_numbers ()
returns varchar(100)
deterministic
begin
declare i int default 1;
declare result varchar(100) default "";
	while i <= 10 do
		if (i % 2 = 0) then
			set result = concat(result, " ", i);
			set i = i + 2;
		else
			set i = i + 1;
        end if;
	end while;
return result;
end //
delimiter ;

select even_numbers();