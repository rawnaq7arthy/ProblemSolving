create database ActivityDB;
use ActivityDB;

create table Employee(
employeeID int primary key,
employeename varchar(20) not null,
employeeposition varchar(50) not null
);

create table Device(
deviceID int primary key,
devicetype varchar(20) not null,
employeeID int,
foreign key (employeeID)  references Employee(employeeID)
);

create table Author(
authorID int primary key,
authorname varchar(30),
nationality varchar(30)
);

create table Books(
bookID int primary key,
bookname varchar(30),
booktype varchar(30),
authorID int,
foreign key (authorID)  references Author(authorID)
);

create table Student(
studentID int primary key,
sname varchar(30),
age int
);

create table course(
courseID int primary key,
coursename varchar(30)
);

create table studentcourses(
studentID int,
courseID int,
primary key (studentID, courseID),
foreign key (studentID) references student(studentID),
foreign key (courseID) references course(courseID)
);


