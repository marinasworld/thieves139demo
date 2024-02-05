CREATE TABLE CARS (
    car_vin VARCHAR PRIMARY KEY,
    car_status VARCHAR,
    car_maker VARCHAR,
    car_model VARCHAR,
    car_type VARCHAR,
    car_capacity VARCHAR,
    car_description VARCHAR,
    car_price DECIMAL
  );
  
  CREATE TABLE STAFF (
    staff_id INTEGER PRIMARY KEY,
    staff_type VARCHAR,
    staff_name VARCHAR,
    staff_email VARCHAR UNIQUE,
    staff_password VARCHAR
  );
  
  CREATE TABLE CUSTOMERS (
    customer_id INTEGER PRIMARY KEY,
    customer_name VARCHAR,
    customer_email VARCHAR,
    customer_tel VARCHAR,
    customer_address VARCHAR,
    customer_license VARCHAR
  );
  
  CREATE TABLE APPOINTMENT (
    appointment_id INTEGER PRIMARY KEY,
    appointment_date TIMESTAMP,
    appointment_notes VARCHAR,
    customer_id INTEGER,
    staff_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id),
    FOREIGN KEY (staff_id) REFERENCES STAFF(staff_id)
  );
  
  CREATE TABLE TEST_DRIVE (
    car_vin VARCHAR,
    test_start TIMESTAMP,
    test_end TIMESTAMP,
    test_notes VARCHAR,
    staff_id INTEGER,
    customer_id INTEGER,
    appointment_id INTEGER,
    FOREIGN KEY (car_vin) REFERENCES CARS(car_vin),
    FOREIGN KEY (staff_id) REFERENCES STAFF(staff_id),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id),
    FOREIGN KEY (appointment_id) REFERENCES APPOINTMENT(appointment_id),
    PRIMARY KEY (car_vin, test_start)  -- Combine into a composite primary key
  );
  
  CREATE TABLE SALES (
    sale_id INTEGER PRIMARY KEY,
    sale_date TIMESTAMP,
    sale_price DECIMAL,
    sale_status VARCHAR,
    sale_notes VARCHAR,
    car_vin VARCHAR,
    staff_id INTEGER,
    customer_id INTEGER,
    FOREIGN KEY (car_vin) REFERENCES CARS(car_vin),
    FOREIGN KEY (staff_id) REFERENCES STAFF(staff_id),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
  );
  
  CREATE TABLE TRANSACTIONS (
    tx_id INTEGER PRIMARY KEY,
    tx_amount DECIMAL,
    tx_type VARCHAR,
    tx_notes VARCHAR,
    sale_id INTEGER,
    staff_id INTEGER,
    FOREIGN KEY (sale_id) REFERENCES SALES(sale_id),
    FOREIGN KEY (staff_id) REFERENCES STAFF(staff_id)
  );
  

-- tables creation


--  INSERT CARS DATA  
INSERT INTO CARS (car_vin, car_status, car_maker, car_model, car_type, car_capacity, car_description, car_price)
VALUES
  ('1HGCM82633A004352', 'Available', 'Honda', 'Accord', 'Sedan', '5-seater', '2023 Honda Accord Sport in Lunar Silver Metallic', 25470.00),
  ('2T1BURHE8CC154659', 'Sold', 'Toyota', 'RAV4', 'SUV', '5-seater', '2022 Toyota RAV4 Hybrid XLE in Blueprint', 31595.00),
  ('3VW547AX5KM543210', 'Available', 'Volkswagen', 'Jetta', 'Sedan', '5-seater', '2023 Volkswagen Jetta SEL in Platinum Gray Metallic', 24195.00),
  ('4F2YU0G95HR123456', 'On Test Drive', 'Ford', 'Mustang', 'Coupe', '4-seater', '2024 Ford Mustang GT Premium in Rapid Red Metallic', 40270.00),
  ('5XYG254AB7L987654', 'Available', 'Chevrolet', 'Silverado 1500', 'Pickup', 'Crew Cab', '2023 Chevrolet Silverado 1500 LT Trail Boss in Black', 47595.00);
INSERT INTO CARS (car_vin, car_status, car_maker, car_model, car_type, car_capacity, car_description, car_price)
VALUES
    ('6VWWZ48C7DR177925', 'Available', 'Hyundai', 'Tucson', 'SUV', '5-seater', '2023 Hyundai Tucson Limited in Deep Sea Blue', 32495.00),
    ('7JYA35C36HL824567', 'Used', 'Nissan', 'Sentra', 'Sedan', '5-seater', '2021 Nissan Sentra SV in Pearl White', 18995.00),
    ('8T2BU4GV5KM987654', 'On Service', 'Mini', 'Cooper', 'Hatchback', '4-seater', '2022 Mini Cooper S in Chili Red', 3495.00),
    ('9F1LM0R63HR765432', 'Available', 'Subaru', 'Forester', 'SUV', '5-seater', '2024 Subaru Forester Wilderness Edition in Magnetite Gray Metallic', 35795.00),
    ('0XAB89PJ2MN543210', 'Available', 'Kia', 'Telluride', 'SUV', '8-seater', '2023 Kia Telluride SX in Black Copper Metallic', 44895.00);
INSERT INTO CARS (car_vin, car_status, car_maker, car_model, car_type, car_capacity, car_description, car_price)
VALUES
    ('11C5V43N8FM098765', 'Available', 'Volkswagen', 'Golf', 'Hatchback', '5-seater', '2024 Volkswagen Golf GTI in Autobahn Orange Metallic', 31295.00),
    ('12VWM78R4GT543210', 'Used', 'Toyota', 'Camry', 'Sedan', '5-seater', '2022 Toyota Camry XLE Hybrid in Midnight Blue Metallic', 27995.00),
    ('13B4C9Z65HN987654', 'On Service', 'Jeep', 'Wrangler', 'SUV', '5-seater', '2023 Jeep Wrangler Sport Unlimited in Granite Pearl', 3395.00),
    ('14F8G0J73KL543210', 'Available', 'Honda', 'CR-V', 'SUV', '5-seater', '2024 Honda CR-V Touring in Radiant Red Metallic', 33695.00),
    ('15X2H5N91PQ765432', 'Available', 'Ford', 'Escape', 'SUV', '5-seater', '2023 Ford Escape Titanium Hybrid in Magnetic Metallic', 30495.00);
INSERT INTO CARS (car_vin, car_status, car_maker, car_model, car_type, car_capacity, car_description, car_price)
VALUES
    ('16R2S9T47KL543210', 'Available', 'Ford', 'F-150', 'Pickup', 'Crew Cab', '2024 Ford F-150 Lariat in Oxford White', 42995.00),
    ('17J4L0P29HB765432', 'Available', 'Chevrolet', 'Equinox', 'SUV', '5-seater', '2024 Chevrolet Equinox Premier in Midnight Blue Metallic', 29995.00),
    ('18M3N6B85JK098765', 'On Service', 'Toyota', 'Highlander', 'SUV', '7-seater', '2023 Toyota Highlander Limited in Celestial Silver Metallic', 42995.00),
    ('19Z8X3C42MN543210', 'Available', 'Nissan', 'Rogue', 'SUV', '5-seater', '2024 Nissan Rogue SV in Glacier White', 30995.00),
    ('20D9Q1A33FM098765', 'Available', 'Honda', 'Civic', 'Sedan', '5-seater', '2024 Honda Civic LX in Platinum White Pearl', 21995.00);
        


INSERT INTO STAFF (staff_id, staff_type, staff_name, staff_email, staff_password)
  VALUES
    (1, 'Salesperson', 'Sarah Smith', 'ssmith@dealership.com', '**********'),
    (2, 'Sales Manager', 'John Doe', 'jdoe@dealership.com', '**********'),
    (3, 'Finance Manager', 'Jane Brown', 'jbrown@dealership.com', '**********'),
    (4, 'Salesperson', 'David Lee', 'dlee@dealership.com', '**********'),
    (5, 'Customer Service Representative', 'Maria Garcia', 'mgarcia@dealership.com', '**********');
INSERT INTO STAFF (staff_id, staff_type, staff_name, staff_email, staff_password)
    VALUES
      (6, 'Mechanic', 'Mike Garcia', 'mgarcia@dealership.service', '**********'),
      (7, 'Finance Assistant', 'Anna Jones', 'ajones@dealership.finance', '**********'),
      (8, 'Service Manager', 'David Lee', 'dlee@dealership.service', '**********'),
      (9, 'Receptionist', 'Maria Garcia', 'mgarcia@dealership.frontdesk', '**********'),
      (10, 'Lot Attendant', 'William Williams', 'wwilliams@dealership.sales', '**********');
INSERT INTO STAFF (staff_id, staff_type, staff_name, staff_email, staff_password)
VALUES
    (11, 'Parts Manager', 'Emily Davis', 'edavis@dealership.parts', '**********'),
    (12, 'Sales Assistant', 'David Miller', 'dmiller@dealership.sales', '**********'),
    (13, 'Internet Sales Manager', 'Alice Garcia', 'agarcia@dealership.online', '**********'),
    (14, 'Loan Processor', 'Noah Miller', 'nmiller@dealership.finance', '**********'),
    (15, 'Bookkeeper', 'Olivia Brown', 'obrown@dealership.accounting', '**********');
INSERT INTO STAFF (staff_id, staff_type, staff_name, staff_email, staff_password)
VALUES
    (16, 'Salesperson', 'Jennifer Smith', 'jsmith@dealership.com', '**********'),
    (17, 'Service Technician', 'Kevin Brown', 'kbrown@dealership.service', '**********'),
    (18, 'Parts Specialist', 'Jessica Lee', 'jlee@dealership.parts', '**********');
              


    


INSERT INTO CUSTOMERS (customer_id, customer_name, customer_email, customer_tel, customer_address, customer_license)
VALUES
    (1, 'Michael Johnson', 'mjohnson@gmail.com', '555-123-4567', '123 Main St, Anytown, CA 12345', 'ABCDEFG12345'),
    (2, 'Lisa Jones', 'ljones@yahoo.com', '555-987-6543', '456 Elm St, Anytown, CA 12345', 'HIJKLMN56789'),
    (3, 'Robert Williams', 'rwilliams@hotmail.com', '555-555-1212', '789 Oak St, Anytown, CA 12345', 'OPQRSTU90123'),
    (4, 'Emily Davis', 'edavis@gmail.com', '555-345-6789', '100 Maple St, Anytown, CA 12345', 'VWXYZAB67890'),
    (5, 'David Miller', 'dmiller@yahoo.com', '555-765-4321', '543 Pine, Nowhere, NY 10001', 'CSXYGAB67490'),
    (6, 'Alice Garcia', 'agarcia@outlook.com', '555-234-5678', '234 Maplewood Ave, Anytown, CA 12345', 'ZXCVBNM34567'),
    (7, 'Noah Miller', 'nmiller@icloud.com', '555-890-1234', '890 Willow St, Anytown, CA 12345', 'QAZWSXED89012'),
    (8, 'Olivia Brown', 'obrown@hotmail.com', '555-678-9012', '678 Elmwood Dr, Anytown, CA 12345', 'ETFGHIJ78901'),
    (9, 'William Williams', 'wwilliams@gmail.com', '555-456-7890', '456 Oakwood Lane, Anytown, CA 12345', 'RTYUIOP09876'),
    (10, 'Sophia Davis', 'sdavis@yahoo.com', '555-123-0987', '123 Pinewood Terrace, Anytown, CA 12345', 'ASDFGHJKL12345');
INSERT INTO CUSTOMERS (customer_id, customer_name, customer_email, customer_tel, customer_address, customer_license)
VALUES
    (11, 'Ethan Williams', 'ewilliams@gmail.com', '555-987-0123', '987 Elmwood St, Anytown, CA 12345', 'QAZWSXED09876'),
    (12, 'Olivia Rodriguez', 'orodriguez@yahoo.com', '555-345-8765', '345 Maplewood Ave, Anytown, CA 12345', 'TYUIOPLK56789'),
    (13, 'Noah Garcia', 'ngarcia@hotmail.com', '555-765-1234', '765 Oakwood Lane, Anytown, CA 12345', 'ASDFGHJK90123'),
    (14, 'Sophia Brown', 'sbrown@icloud.com', '555-123-9870', '123 Pinewood Terrace, Anytown, CA 12345', 'ZXCVBNM78901'),
    (15, 'William Miller', 'wmiller@outlook.com', '555-098-7654', '543 Willow St, Anytown, CA 12345', 'RTYUIOPL12345');
INSERT INTO CUSTOMERS (customer_id, customer_name, customer_email, customer_tel, customer_address, customer_license)
VALUES
    (16, 'Jason Anderson', 'janderson@gmail.com', '555-123-9876', '789 Cedar St, Anytown, CA 12345', 'QWERTYUI12345'),
    (17, 'Sophia Garcia', 'sgarcia@yahoo.com', '555-987-6543', '456 Pine St, Anytown, CA 12345', 'ASDFGHJK67890');
INSERT INTO CUSTOMERS (customer_id, customer_name, customer_email, customer_tel, customer_address, customer_license)
VALUES
    (18, 'Daniel Martinez', 'dmartinez@gmail.com', '555-234-5678', '321 Oak St, Anytown, CA 12345', 'ZXCVBNM45678'),
    (19, 'Isabella Wilson', 'iwilson@yahoo.com', '555-876-5432', '654 Pine St, Anytown, CA 12345', 'QWERTYUI23456'),
    (20, 'Liam Brown', 'lbrown@hotmail.com', '555-654-3210', '987 Cedar St, Anytown, CA 12345', 'ASDFGHJK34567');
    




INSERT INTO APPOINTMENT (appointment_id, appointment_date, appointment_notes, customer_id, staff_id)
VALUES
    (1, '2024-01-20 10:00:00', 'Test drive requested for Honda Accord', 1, 2),
    (2, '2024-01-27 14:00:00', 'Financial consultation for Toyota RAV4 purchase', 3, 3),
    (3, '2024-02-03 16:00:00', 'Follow-up call regarding Jetta test drive', 4, 1),
    (4, '2024-02-10 11:00:00', 'Review Mustang options with salesperson', 2, 4),
    (5, '2024-02-17 09:00:00', 'Discuss Silverado financing options', 5, 3);
INSERT INTO APPOINTMENT (appointment_id, appointment_date, appointment_notes, customer_id, staff_id)
VALUES
    (6, '2024-02-03 10:00:00', 'Discuss maintenance options for Nissan Sentra', 2, 6),
    (7, '2024-02-10 15:00:00', 'Service appointment for Mini Cooper', 5, 8),
    (8, '2024-02-17 13:00:00', 'Follow-up regarding Subaru Forester purchase', 9, 1),
    (9, '2024-02-24 09:00:00', 'Test drive for Kia Telluride', 6, 4),
    (10, '2024-03-02 14:00:00', 'General inquiry about used car options', 8, 2);
INSERT INTO APPOINTMENT (appointment_id, appointment_date, appointment_notes, customer_id, staff_id)
VALUES
    (11, '2024-03-09 10:00:00', 'Discuss trade-in value for Volkswagen Golf', 4, 12),
    (12, '2024-03-16 14:00:00', 'Test drive for Toyota Camry', 7, 2),
    (13, '2024-03-23 09:00:00', 'Follow-up regarding Jeep Wrangler service', 5, 8),
    (14, '2024-03-30 15:00:00', 'Review financing options for Honda CR-V', 9, 1),
    (15, '2024-04-06 10:00:00', 'Inquiry about Ford Escape features', 6, 4);
INSERT INTO APPOINTMENT (appointment_id, appointment_date, appointment_notes, customer_id, staff_id)
VALUES
    (16, '2024-04-13 10:00:00', 'Test drive scheduled for Ford F-150', 16, 2),
    (17, '2024-04-20 14:00:00', 'Discuss service options for Toyota Highlander', 17, 8);
INSERT INTO APPOINTMENT (appointment_id, appointment_date, appointment_notes, customer_id, staff_id)
VALUES
    (18, '2024-04-27 10:00:00', 'Discuss financing options for purchase', 18, 1),
    (19, '2024-05-04 14:00:00', 'Schedule test drive for Equinox', 19, 4),
    (20, '2024-05-11 16:00:00', 'Review service plan for Civic', 20, 8);
        




INSERT INTO TEST_DRIVE (car_vin, test_start, test_end, test_notes, staff_id, customer_id, appointment_id)
VALUES
    ('1HGCM82633A004352', '2024-01-20 10:15:00', '2024-01-20 10:45:00', 'Positive experience, customer interested in purchase', 1, 2, 1),
    ('3VW547AX5KM543210', '2024-01-27 14:15:00', '2024-01-27 14:45:00', 'Concerns about rear passenger space', 4, 3, 2),
    ('4F2YU0G95HR123456', '2024-02-10 11:15:00', '2024-02-10 11:45:00', 'Thrilled with performance and considering purchase', 2, 4, 4);
INSERT INTO TEST_drive (car_vin, test_start, test_end, test_notes, staff_id, customer_id, appointment_id)
VALUES
    ('9F1LM0R63HR765432', '2024-02-17 13:15:00', '2024-02-17 13:45:00', 'Impressed with features and spaciousness', 1, 9, 8),
    ('0XAB89PJ2MN543210', '2024-02-24 09:15:00', '2024-02-24 10:00:00', 'Positive experience, interested in financing', 4, 6, 9),
    ('6VWWZ48C7DR177925', '2024-03-02 14:15:00', '2024-03-02 14:45:00', 'Concerns about fuel efficiency', 2, 8, 10);
INSERT INTO TEST_DRIVE (car_vin, test_start, test_end, test_notes, staff_id, customer_id, appointment_id)
VALUES
    ('11C5V43N8FM098765', '2024-03-09 10:15:00', '2024-03-09 10:45:00', 'Enjoyed sporty performance, considering purchase', 12, 4, 11),
    ('14F8G0J73KL543210', '2024-03-30 15:15:00', '2024-03-30 15:45:00', 'Spacious and comfortable, family-friendly option', 1, 9, 14),
    ('15X2H5N91PQ765432', '2024-04-06 10:15:00', '2024-04-06 10:45:00', 'Impressed with fuel efficiency and technology', 4, 6, 15);
INSERT INTO TEST_DRIVE (car_vin, test_start, test_end, test_notes, staff_id, customer_id, appointment_id)
VALUES
    ('16R2S9T47KL543210', '2024-04-13 10:15:00', '2024-04-13 10:45:00', 'Impressed with towing capacity', 2, 16, 16),
    ('18M3N6B85JK098765', '2024-04-20 14:15:00', '2024-04-20 14:45:00', 'Discussion about hybrid options', 8, 17, 17);
INSERT INTO TEST_DRIVE (car_vin, test_start, test_end, test_notes, staff_id, customer_id, appointment_id)
VALUES
    ('17J4L0P29HB765432', '2024-04-27 10:15:00', '2024-04-27 10:45:00', 'Impressed with safety features', 1, 18, 18),
    ('20D9Q1A33FM098765', '2024-05-04 14:15:00', '2024-05-04 14:45:00', 'Discussion about technology package', 4, 19, 19),
    ('16R2S9T47KL543210', '2024-05-11 16:15:00', '2024-05-11 16:45:00', 'Exploration of interior features', 8, 20, 20);
INSERT INTO TEST_DRIVE (car_vin, test_start, test_end, test_notes, staff_id, customer_id, appointment_id)
VALUES
    ('19Z8X3C42MN543210', '2024-05-18 10:15:00', '2024-05-18 10:45:00', 'Feedback on handling and acceleration', 2, 18, 18),
    ('18M3N6B85JK098765', '2024-05-25 14:15:00', '2024-05-25 14:45:00', 'Exploring entertainment system features', 4, 19, 19),
    ('16R2S9T47KL543210', '2024-06-01 16:15:00', '2024-06-01 16:45:00', 'Customer liked the interior design', 8, 20, 20),
    ('20D9Q1A33FM098765', '2024-06-08 10:15:00', '2024-06-08 10:45:00', 'Discussion about fuel efficiency', 2, 18, 18),
    ('17J4L0P29HB765432', '2024-06-15 14:15:00', '2024-06-15 14:45:00', 'Considering additional safety features', 4, 19, 19);
    




INSERT INTO SALES (sale_id, sale_date, sale_price, sale_status, sale_notes, car_vin, staff_id, customer_id)
VALUES
    (1, '2024-01-20 11:00:00', 25470.00, 'Completed', 'Financed through dealership', '1HGCM82633A004352', 1, 2),
    (2, '2024-01-27 15:00:00', 31595.00, 'Pending', 'Awaiting loan approval', '2T1BURHE8CC154659', 3, 3);
INSERT INTO SALES (sale_id, sale_date, sale_price, sale_status, sale_notes, car_vin, staff_id, customer_id)
VALUES
    (3, '2024-02-03 11:00:00', 18995.00, 'Completed', 'Trade-in accepted', '7JYA35C36HL824567', 6, 2),
    (4, '2024-02-17 16:00:00', 3395.00, 'Pending Approval', 'Financing paperwork submitted', '9F1LM0R63HR765432', 1, 9);
INSERT INTO SALES (sale_id, sale_date, sale_price, sale_status, sale_notes, car_vin, staff_id, customer_id)
VALUES
    (5, '2024-03-09 11:00:00', 31295.00, 'Completed', 'Financed through dealership', '11C5V43N8FM098765', 12, 4),
    (6, '2024-03-30 16:00:00', 3995.55, 'Pending Approval', 'Loan application submitted', '14F8G0J73KL543210', 1, 9);
INSERT INTO SALES (sale_id, sale_date, sale_price, sale_status, sale_notes, car_vin, staff_id, customer_id)
VALUES
    (7, '2024-04-13 11:00:00', 42995.00, 'Pending', 'Awaiting financing approval', '16R2S9T47KL543210', 2, 16),
    (8, '2024-04-20 15:00:00', 42995.00, 'Pending', 'Discussion about trade-in value', '18M3N6B85JK098765', 8, 17);
INSERT INTO SALES (sale_id, sale_date, sale_price, sale_status, sale_notes, car_vin, staff_id, customer_id)
VALUES
    (9, '2024-04-27 11:00:00', 29995.00, 'Pending', 'Discussing financing options', '17J4L0P29HB765432', 1, 18),
    (10, '2024-05-04 15:00:00', 21995.00, 'Pending', 'Awaiting trade-in appraisal', '20D9Q1A33FM098765', 4, 19),
    (11, '2024-05-11 17:00:00', 22995.00, 'Pending', 'Discussion about extended warranty', '16R2S9T47KL543210', 8, 20);
INSERT INTO SALES (sale_id, sale_date, sale_price, sale_status, sale_notes, car_vin, staff_id, customer_id)
VALUES
    (12, '2024-05-18 11:00:00', 30995.00, 'Pending', 'Finalizing financing terms', '19Z8X3C42MN543210', 2, 18),
    (13, '2024-05-25 15:00:00', 42995.00, 'Pending', 'Discussion about trade-in value', '18M3N6B85JK098765', 4, 19),
    (14, '2024-06-01 17:00:00', 21995.00, 'Pending', 'Considering extended warranty options', '16R2S9T47KL543210', 8, 20),
    (15, '2024-06-08 11:00:00', 29995.00, 'Pending', 'Reviewing financing terms', '20D9Q1A33FM098765', 2, 18),
    (16, '2024-06-15 15:00:00', 33995.00, 'Pending', 'Exploring financing options', '17J4L0P29HB765432', 4, 19);





INSERT INTO TRANSACTIONS (tx_id, tx_amount, tx_type, tx_notes, sale_id, staff_id)
VALUES
  (1, 25470.00, 'Full Payment', 'Cash payment received', 1, 1),
  (2, 3000.00, 'Down Payment', 'Down payment received', 2, 3);
INSERT INTO TRANSACTIONS (tx_id, tx_amount, tx_type, tx_notes, sale_id, staff_id)
VALUES
    (3, 18995.00, 'Full Payment', 'Cash payment received', 3, 6),
    (4, 5000.00, 'Down Payment', 'Down payment received', 2, 1);
INSERT INTO TRANSACTIONS (tx_id, tx_amount, tx_type, tx_notes, sale_id, staff_id)
VALUES
    (5, 31295.00, 'Full Payment', 'Cash payment received', 5, 12),
    (6, 10000.00, 'Down Payment', 'Down payment received', 4, 1);
INSERT INTO TRANSACTIONS (tx_id, tx_amount, tx_type, tx_notes, sale_id, staff_id)
VALUES
    (7, 5000.00, 'Down Payment', 'Down payment received', 7, 2),
    (8, 7000.00, 'Down Payment', 'Down payment received', 8, 8);
INSERT INTO TRANSACTIONS (tx_id, tx_amount, tx_type, tx_notes, sale_id, staff_id)
VALUES
    (9, 4000.00, 'Down Payment', 'Down payment received', 9, 1),
    (10, 5000.00, 'Down Payment', 'Down payment received', 10, 4),
    (11, 3000.00, 'Down Payment', 'Down payment received', 11, 8);
INSERT INTO TRANSACTIONS (tx_id, tx_amount, tx_type, tx_notes, sale_id, staff_id)
VALUES
    (12, 6000.00, 'Down Payment', 'Down payment received', 12, 2),
    (13, 8000.00, 'Down Payment', 'Down payment received', 13, 4),
    (14, 4000.00, 'Down Payment', 'Down payment received', 14, 8),
    (15, 7000.00, 'Down Payment', 'Down payment received', 15, 2),
    (16, 5000.00, 'Down Payment', 'Down payment received', 16, 4);



-- creating multiple views using complex queries and joins to get more usefull and meaningul data

CREATE VIEW SalesDetails AS
SELECT s.sale_id, s.sale_date, s.sale_price, s.sale_status, s.sale_notes, c.car_maker, c.car_model, st.staff_name AS salesperson, cust.customer_name
FROM SALES s
JOIN CARS c ON s.car_vin = c.car_vin
JOIN STAFF st ON s.staff_id = st.staff_id
JOIN CUSTOMERS cust ON s.customer_id = cust.customer_id;


CREATE VIEW AppointmentSchedule AS
SELECT a.appointment_id, a.appointment_date, a.appointment_notes, cust.customer_name, st.staff_name
FROM APPOINTMENT a
JOIN CUSTOMERS cust ON a.customer_id = cust.customer_id
JOIN STAFF st ON a.staff_id = st.staff_id;


CREATE VIEW TestDriveDetails AS
SELECT td.car_vin, td.test_start, td.test_end, td.test_notes, c.car_maker, c.car_model, cust.customer_name, st.staff_name
FROM TEST_DRIVE td
JOIN CARS c ON td.car_vin = c.car_vin
JOIN CUSTOMERS cust ON td.customer_id = cust.customer_id
JOIN STAFF st ON td.staff_id = st.staff_id;

CREATE VIEW AvgTransactionAmountByStaff AS
SELECT st.staff_id, st.staff_name,
       AVG(tx_amount) AS avg_transaction_amount
FROM TRANSACTIONS tx
JOIN STAFF st ON tx.staff_id = st.staff_id
GROUP BY st.staff_id, st.staff_name;

CREATE VIEW CustomerTransactions AS
SELECT tx.tx_id, tx.tx_amount, tx.tx_type, tx.tx_notes,
       cust.customer_name, cust.customer_email
FROM TRANSACTIONS tx
JOIN SALES s ON tx.sale_id = s.sale_id
JOIN CUSTOMERS cust ON s.customer_id = cust.customer_id;

CREATE VIEW TopSellingCarModels AS
SELECT c.car_maker, c.car_model,
       COUNT(*) AS total_sales
FROM SALES s
JOIN CARS c ON s.car_vin = c.car_vin
GROUP BY c.car_maker, c.car_model
ORDER BY total_sales DESC;