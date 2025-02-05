create table customers(
customers_id int primary key auto_increment,
name varchar(100) not null,
email varchar(100) unique,
phone varchar(15) ,
address varchar(255) 
);
create table orders(
orders_id int primary key auto_increment,
customers_id int,
foreign key (customers_id) references customers(customers_id),
oder_date date not null,
total_amount decimal(10,2) not null,
status varchar(50)
);
INSERT INTO customers (name, email, phone, address)
VALUES
('Nguyen Van An', 'nguyenvanan@example.com', '0901234567', '123 Le Loi, TP.HCM'),
('Tran Thi Bich', 'tranthibich@example.com', '0912345678', '456 Nguyen Hue, TP.HCM'),
('Le Van Cuong', 'levancuong@example.com', '0923456789', '789 Dien Bien Phu, Ha Noi');

INSERT INTO orders (customers_id, oder_date, total_amount, status)
VALUES
(1, '2025-01-10', 500000, 'Pending'),
(1, '2025-01-12', 325000, 'Completed'),
(NULL, '2025-01-13', 450000, 'Cancelled'),
(3, '2025-01-14', 270000, 'Pending'),
(2, '2025-01-16', 850000, NULL);

-- --2
SELECT 
    o.orders_id,
	o.oder_date,
    o.total_amount,
    c.name AS customer_name,
    c.email AS customer_email
FROM orders o
LEFT JOIN customers c ON o.customers_id = c.customers_id;
-- --3
select 
    c.customers_id,
    c.name,
    c.phone,
    o.orders_id,
    o.status
from customers c
left join orders o on c.customers_id = o.customers_id;
-- --4
select 
c.customers_id,
c.name,
o.orders_id,
o.total_amount,
o.oder_date
from customers c 
left join orders o on c.customers_id = o.customers_id;