--left join inclusive
select drivers.*, cars.model as car_model, cars.color as car_color from drivers
left join cars ON drivers.car_id = cars.car_id;
-- left join exlusive, manualy
select drivers.*, cars.model as car_model, cars.color as car_color from drivers
left join cars ON drivers.car_id = cars.car_id where drivers.car_id is null;

-- right join inclusive
select drivers.*, cars.model as car_model, cars.color as car_color from drivers
right join cars ON drivers.car_id = cars.car_id;

-- right outer join= exlusive
select drivers.*, cars.* from drivers
right join cars ON drivers.car_id = cars.car_id where drivers.driver_id is null;

-- full JOIN inclusive
select drivers.*, cars.* from drivers
full join cars ON drivers.car_id = cars.car_id 

-- full OUTER JOIN exclusive
select drivers.*, cars.* from drivers
full join cars ON drivers.car_id = cars.car_id where drivers.driver_id is null or drivers.car_id is null;

