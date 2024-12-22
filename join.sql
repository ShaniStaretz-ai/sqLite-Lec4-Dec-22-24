-- left join inclusive
select drivers.*, cars.model as car_model, cars.color as car_color from drivers
left join cars ON drivers.car_id = cars.car_id;
-- left join exlusive
select drivers.*, cars.model as car_model, cars.color as car_color from drivers
left join cars ON drivers.car_id = cars.car_id where drivers.car_id is null;