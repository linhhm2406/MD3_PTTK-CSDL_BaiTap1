create database baitap1;
use baitap1;

create table Customers(
customerNumber int primary key,
name NVARCHAR(50) not null,
lastName NVARCHAR(50) not null,
firstName NVARCHAR(50) not null,
phone NVARCHAR(50) not null,
addressLine1 NVARCHAR(50) not null,
addressLine2 NVARCHAR(50),
state NVARCHAR(50) not null,
postalCode NVARCHAR(15) not null,
country NVARCHAR(50) not null,
creditLimit FLOAT not null,
employeeNumber int not null
);

alter table customers
add foreign key (employeeNumber) references Employees(employeeNumber);

create table Orders(
orderNumber int primary key,
orderDate date not null,
requiredDate date not null,
shippedDate date not null,
status NVARCHAR(15) not null,
comments text,
quantityOrdered int not null,
priceEach float not null,
customerNumber int not null
);

alter table Orders
add foreign key (customerNumber) references Customers(customerNumber);

create table OrderDetails(
orderNumber int,
productCode NVARCHAR(15)
);

alter table OrderDetails
add foreign key (orderNumber) references Orders(orderNumber),
add foreign key (productCode) references Products(productCode),
add primary key (orderNumber,productCode);

create table Payments(
paymentNumber nvarchar(50) primary key,
paymentDate date not null,
amount float not null,
customerNumber int not null
);

alter table Payments
add foreign key (customerNumber) references Customers(customerNumber);

create table Products(
productCode NVARCHAR(15) primary key,
productName NVARCHAR(70) not null,
productScale NVARCHAR(10) not null,
productVendor NVARCHAR(50) not null,
productDescription text not null,
quantityInStock int not null,
buyPrice float not null,
MSRP float not null,
productLine nvarchar(50) not null
);

alter table Products
add foreign key (productLine) references ProductLines(productLine);

create table ProductLines(
productLine nvarchar(50) primary key,
textDescription text,
image nvarchar(50)
);

create table Employees(
employeeNumber int primary key,
lastName nvarchar(50) not null,
firstName nvarchar(50) not null,
email nvarchar(100) not null,
jobTitle nvarchar(50) not null,
reportTo int  not null,
officeCode nvarchar(10)  not null
);

alter table Employees
add foreign key (reportTo) references Employees(employeeNumber),
add foreign key (officeCode) references Offices(officeCode);

create table Offices(
officeCode nvarchar(10) primary key,
city nvarchar(50) not null,
phone nvarchar(50) not null,
addressLine1 nvarchar(50) not null,
addressLine2 nvarchar(50),
state nvarchar(50),
country nvarchar(50) not null,
postalCode nvarchar(15) not null
);



