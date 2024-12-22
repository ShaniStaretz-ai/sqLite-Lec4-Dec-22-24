# sqLite-Lec4-Dec-22-24

JOIN

## subjects learned:

* FOREIGN KEY:
    * on table A, definition you can add connection to other table B with B's primary key
    * example:car_id INTEGER **UNIQUE**,FOREIGN KEY(car_id) REFERENCE cars(car_id)
    * this relation between both tables calls 1 on 1 relation.
      meaning each row in table A can have only 1 unique id in table B
    * the UNIQUE constraint makes the **relation 1-1**:
        * each driver must have only **1** car
        * each car must have only **1** driver and not more drivers
        * without the UNIQUE key word, the **relation will be 1 to many (1-n)**
    * it is NOT customary to do **a double** connection on the table B foreign key of driver_id,
      because it can make complications
* the first table is always the "right" table and the second table is the "left table"
* ON - when connecting the relations, this will specify the connection between the 2 tables.
* JOIN example:
    * INNER JOIN: return all drivers **with cars only**
      ```
          SELECT drivers.*, cars.model as car_model, cars.color as car_color 
          FROM drivers
          JOIN cars 
          ON drivers.car_id = cars.car_id;
      ```
    * LEFT JOIN (inclusive):return all drivers **without and with** cars
      ```
          SELECT drivers.*, cars.model as car_model, cars.color as car_color 
          FROM drivers
          LEFT JOIN cars 
          ON drivers.car_id = cars.car_id;
      ```
    * LEFT OUTER JOIN (exclusive): return all drivers **without** cars
     ```
          SELECT drivers.*, cars.model as car_model, cars.color as car_color 
          FROM drivers
          LEFT **OUTER** JOIN cars 
          ON drivers.car_id = cars.car_id;
    ```
  or if the OUTER doesn't work like in sqlite need to add the condition manually:
     ```
          SELECT drivers.*, cars.model as car_model, cars.color as car_color 
          FROM drivers
          LEFT JOIN cars 
          ON drivers.car_id = cars.car_id;
          where drivers.car_id is null;
    ```
* for RIGHT join, just replace the LEFT keyword with the RIGHT.
  this will return all cars table with the relation of drivers table.
    * meaning get all cars with/without drivers
* for FULL JOIN (inclusive):
    ```
    select drivers.*, cars.* from drivers
    full join cars ON drivers.car_id = cars.car_id
    ``` 
    * FULL OUTER JOIN (exclusive):
      ```
      select drivers.*, cars.* from drivers
      full join cars ON drivers.car_id = cars.car_id 
      where drivers.driver_id is null OR drivers.car_id is null
      ```
        


