use TicketBookingSystem;

insert into customer(venue_name,address)
values
('harry potter','harry@gmail.com','45454545'),
('hermione granger','her@gmail.com','45454545'),
('ronald weasley','ron@gmail.com','45504450'),
('draco malfoy','drac@gmail.com','45454545'),
('ginni weasley','ginni@gmail.com','45504450');

insert into venue(customer_name,email,phone_number)
values
('mumbai','marol andheri(w)'),
('chennai','IT park'),
('pondicherry','state beach');

insert into event(event_name,event_date,event_time,total_seats,ticket_price,event_type,venue_id,available_seats)
values
('Late Ms.Lata Mangeshkar Musical','2021-09-12','20:00:00',320,600,'concert',3,270),
('CSK vs RCB','2024-04-11','19:30:00',19000,3600,'sports',2,3),
('CSK vs RR','2024-04-19','19:30:00',23000,3400,'sports',2,10),
('MI vs KKR','2024-05-01','15:30:00',28000,8000,'sports',1,100);

insert into booking(customer_id,event_id,num_tickets,total_cost,booking_date)
values
(1,4,2,640,'2021-09-12'),
(4,4,3,960,'2021-09-12'),
(1,3,3,10800,'2024-04-11'),
(3,3,5,18000,'2024-04-10'),
(5,1,10,34000,'2024-04-15'),
(2,2,4,32000,'2024-05-01');

-- Task 1
-- 2. Write a SQL query to list all events.alter
select * 
from event;
/*+----+----------------------------------+------------+------------+-------------+--------------+------------+----------+-----------------+
| id | event_name                       | event_date | event_time | total_seats | ticket_price | event_type | venue_id | available_seats |
+----+----------------------------------+------------+------------+-------------+--------------+------------+----------+-----------------+
|  1 | Late Ms. Lata Mangeshkar Musical | 2021-09-12 | 20:00:00   |         320 |          600 | concert    |        3 |             270 |
|  2 | CSK vs RCB                       | 2024-04-11 | 19:30:00   |       19000 |         3600 | sports     |        2 |               3 |
|  3 | CSK vs RR                        | 2024-04-19 | 19:30:00   |       23000 |         3400 | sports     |        2 |              10 |
|  4 | MI vs KKR                        | 2024-05-01 | 15:30:00   |       28000 |         8000 | sports     |        1 |             100 |
+----+----------------------------------+------------+------------+-------------+--------------+------------+----------+*/


-- 3. Write a sql query to select the events with the available tickets.
select * 
from event 
where available_seats > 0;
/*+----+----------------------------------+------------+------------+-------------+--------------+------------+----------+-----------------+
| id | event_name                       | event_date | event_time | total_seats | ticket_price | event_type | venue_id | available_seats |
+----+----------------------------------+------------+------------+-------------+--------------+------------+----------+-----------------+
|  1 | Late Ms. Lata Mangeshkar Musical | 2021-09-12 | 20:00:00   |         320 |          600 | concert    |        3 |             270 |
|  2 | CSK vs RCB                       | 2024-04-11 | 19:30:00   |       19000 |         3600 | sports     |        2 |               3 |
|  3 | CSK vs RR                        | 2024-04-19 | 19:30:00   |       23000 |         3400 | sports     |        2 |              10 |
|  4 | MI vs KKR                        | 2024-05-01 | 15:30:00   |       28000 |         8000 | sports     |        1 |             100 |
+----+----------------------------------+------------+------------+-------------+--------------+------------+----------+*/


-- 4. Write a sql query to select event name partially matches to 'kar'. 
select *
from event 
where event_name like '%kar%';
/*+----+----------------------------------+------------+------------+-------------+--------------+------------+----------+-----------------+
| id | event_name                       | event_date | event_time | total_seats | ticket_price | event_type | venue_id | available_seats |
+----+----------------------------------+------------+------------+-------------+--------------+------------+----------+-----------------+
|  1 | Late Ms. Lata Mangeshkar Musical | 2021-09-12 | 20:00:00   |         320 |          600 | concert    |        3 |             270 |
+----+----------------------------------+------------+------------+-------------+--------------+------------+----------+-----------------+*/

-- 5. Write a sql query to select event with ticket price range is between 500 to 4000.alter
select * 
from event 
where ticket_price between 500 and 4000;
/*+----+----------------------------------+------------+------------+-------------+--------------+------------+----------+-----------------+
| id | event_name                       | event_date | event_time | total_seats | ticket_price | event_type | venue_id | available_seats |
+----+----------------------------------+------------+------------+-------------+--------------+------------+----------+-----------------+
|  1 | Late Ms. Lata Mangeshkar Musical | 2021-09-12 | 20:00:00   |         320 |          600 | concert    |        3 |             270 |
|  2 | CSK vs RCB                       | 2024-04-11 | 19:30:00   |       19000 |         3600 | sports     |        2 |               3 |
|  3 | CSK vs RR                        | 2024-04-19 | 19:30:00   |       23000 |         3400 | sports     |        2 |              10 |
+----+----------------------------------+------------+------------+-------------+--------------+------------+----------+-----------------+*/

-- 6. Write a sql query to retrieve events with dates falling within a specific range.
select * 
from event 
where event_date between '2024-03-19' and '2024-05-19';
/*+----+------------+------------+------------+-------------+--------------+------------+----------+-----------------+
| id | event_name | event_date | event_time | total_seats | ticket_price | event_type | venue_id | available_seats |
+----+------------+------------+------------+-------------+--------------+------------+----------+-----------------+
|  2 | CSK vs RCB | 2024-04-11 | 19:30:00   |       19000 |         3600 | sports     |        2 |               3 |
|  3 | CSK vs RR  | 2024-04-19 | 19:30:00   |       23000 |         3400 | sports     |        2 |              10 |
|  4 | MI vs KKR  | 2024-05-01 | 15:30:00   |       28000 |         8000 | sports     |        1 |             100 |
+----+------------+------------+------------+-------------+--------------+------------+----------+-----------------+*/

-- 7. Write a sql query to retrieve events with available tickets that also have 'concert' in their name.
select * 
from event 
where event_type = 'concert'; 
/*+----+----------------------------------+------------+------------+-------------+--------------+------------+----------+-----------------+
|  1 | Late Ms. Lata Mangeshkar Musical | 2021-09-12 | 20:00:00   |         320 |          600 | concert    |        3 |             270 |
+----+----------------------------------+------------+------------+-------------+--------------+------------+----------+-----------------+*/

-- 8. Write a sql query to retrieve user in batches of 3,starting from 2nd user.
select * 
from customer 
limit 2, 3; 
/*+----+----------------+-----------------+--------------+
| id | customer_name  | email           | phone_number |
+----+----------------+-----------------+--------------+
|  3 | ronald weasley | ron@gmail.com   | 45504450     |
|  4 | draco malfoy   | drac@gmail.com  | 45454545     |
|  5 | ginni weasley  | ginni@gmail.com | 45504450     |
+----+----------------+-----------------+--------------+*/

-- 9. Write a sql query to retrieve booking details containing booked number of tickets more than 4.
select * 
from booking 
where num_tickets > 4; 
/*+-------------+----------+----+-------------+------------+--------------+
| customer_id | event_id | id | num_tickets | total_cost | booking_date |
+-------------+----------+----+-------------+------------+--------------+
|           3 |        3 | 13 |           5 |      18000 | 2024-04-10   |
|           5 |        1 | 14 |          10 |      34000 | 2024-04-15   |
+-------------+----------+----+-------------+------------+--------------+*/

-- 10. Write a sql query to retrieve customers info whose phone number ends with '450'.
select * 
from customer 
where phone_number like '%450';
/*+----+----------------+-----------------+--------------+
| id | customer_name  | email           | phone_number |
+----+----------------+-----------------+--------------+
|  3 | ronald weasley | ron@gmail.com   | 45504450     |
|  5 | ginni weasley  | ginni@gmail.com | 45504450     |
+----+----------------+-----------------+--------------+*/

-- 11. Write a sql query to retrieve the events in order whose seat capacity is more than 20000.
select *
from event 
where total_seats > 20000;
/*+----+------------+------------+------------+-------------+--------------+------------+----------+-----------------+
| id | event_name | event_date | event_time | total_seats | ticket_price | event_type | venue_id | available_seats |
+----+------------+------------+------------+-------------+--------------+------------+----------+-----------------+
|  3 | CSK vs RR  | 2024-04-19 | 19:30:00   |       23000 |         3400 | sports     |        2 |              10 |
|  4 | MI vs KKR  | 2024-05-01 | 15:30:00   |       28000 |         8000 | sports     |        1 |             100 |
+----+------------+------------+------------+-------------+--------------+------------+----------+-----------------+*/

-- 12. Write aSQL query to select event names not start with 'c' and 'L'.
select * 
from event 
where event_name not like 'C%' and 
event_name not like 'L%';
/*+----+------------+------------+------------+-------------+--------------+------------+----------+-----------------+
| id | event_name | event_date | event_time | total_seats | ticket_price | event_type | venue_id | available_seats |
+----+------------+------------+------------+-------------+--------------+------------+----------+-----------------+
|  4 | MI vs KKR  | 2024-05-01 | 15:30:00   |       28000 |         8000 | sports     |        1 |             100 |
+----+------------+------------+------------+-------------+--------------+------------+----------+-----------------+*/

-- TASK 3
-- 1. write a sql query to list events and their average ticket prices
select e.event_type, avg(e.ticket_price) as 'avg_ticket_price'
from event e 
group by e.event_type;
/*+------------+------------------+
| event_type | avg_ticket_price |
+------------+------------------+
| concert    |              600 |
| sports     |             5000 |
+------------+------------------+*/

-- 2. Write a sql query to calculate total revenue generated by events.
select event_name,(total_seats-available_seats)*ticket_price 
from event ;
/*+----------------------------------+--------------------------------------------+
| event_name                       | (total_seats-available_seats)*ticket_price |
+----------------------------------+--------------------------------------------+
| Late Ms. Lata Mangeshkar Musical |                                      30000 |
| CSK vs RCB                       |                                   68389200 |
| CSK vs RR                        |                                   78166000 |
| MI vs KKR                        |                                  223200000 |
+----------------------------------+--------------------------------------------+*/

-- 3. Write a sql query to find the events with highest ticket sales.
select event_name,(total_seats-available_seats) as 'ticket_sales'
from event 
order by ticket_sales desc;
/*+----------------------------------+--------------+
| event_name                       | ticket_sales |
+----------------------------------+--------------+
| MI vs KKR                        |        27900 |
| CSK vs RR                        |        22990 |
| CSK vs RCB                       |        18997 |
| Late Ms. Lata Mangeshkar Musical |           50 |
+----------------------------------+--------------+*/

-- 4. Write a sql query to calculate total number of ticket sold for each event.
select event_name,(total_seats-available_seats) as 'ticket_sales'
from event;
/*+----------------------------------+--------------+
| event_name                       | ticket_sales |
+----------------------------------+--------------+
| Late Ms. Lata Mangeshkar Musical |           50 |
| CSK vs RCB                       |        18997 |
| CSK vs RR                        |        22990 |
| MI vs KKR                        |        27900 |
+----------------------------------+--------------+*/

-- 5. Write a sql query to Find events with no ticket sales.
select * 
from event
where total_seats = available_seats;
/*NULL*/

-- 6. Write a sql query to find the user who has booked most tickets.
select c.id,  c.customer_name, b.num_tickets 
from customer c, booking b 
where c.id = b.customer_id   
order by b.num_tickets desc 
limit 1;
/*+----+---------------+-------------+
| id | customer_name | num_tickets |
+----+---------------+-------------+
|  5 | ginni weasley |          10 |
+----+---------------+-------------+*/

-- 7. Write a sql query to events and total number of tickets sold for each month.
select month(booking_date),count(num_tickets) as 'total tickets'
from booking 
group by month(booking_date);
/*+---------------------+---------------+
| month(booking_date) | total tickets |
+---------------------+---------------+
|                   4 |             3 |
|                   5 |             1 |
|                   9 |             2 |
+---------------------+---------------+*/

-- 8. Write a sql query to calculate average ticket price for event at each venue.
select v.venue_name , avg(e.ticket_price) as 'avg_price' 
from event e join venue v on e.venue_id = v.id 
group by v.venue_name;
/*+-------------+-----------+
| venue_name  | avg_price |
+-------------+-----------+
| chennai     |      3500 |
| mumbai      |      8000 |
| pondicherry |       600 |
+-------------+-----------+*/

-- 9. Write a sql query to calculate total number of tickets sold for each event type.
select e.event_type, sum(b.num_tickets) 
from event e join booking b on e.id = b.event_id 
group by e.event_type;
/*+------------+--------------------+
| event_type | sum(b.num_tickets) |
+------------+--------------------+
| concert    |                 10 |
| sports     |                 17 |
+------------+--------------------+*/

-- 10. Write a sql query to calculate total revenue generated by events in each year.
select year(event_date),(total_seats-available_seats)*ticket_price 
from event 
group by year(event_date) ;
 /*+------------------+--------------------------------------------+
| year(event_date) | (total_seats-available_seats)*ticket_price |
+------------------+--------------------------------------------+
|             2021 |                                      30000 |
|             2024 |                                   68389200 |
+------------------+--------------------------------------------+*/

-- 11. Write a sql query to list users who has booked multiple events.
select c.customer_name, count(e.event_name) 
from customer c 
join booking b on c.id = customer_id 
join event e on b.event_id = e.id 
group by c.customer_name;
 /*+------------------+---------------------+
| customer_name    | count(e.event_name) |
+------------------+---------------------+
| draco malfoy     |                   1 |
| ginni weasley    |                   1 |
| harry potter     |                   2 |
| hermione granger |                   1 |
| ronald weasley   |                   1 |
+------------------+---------------------+*/
 
-- 12. Write a sql query to calculate total revenue generated by events for each user. 
select c.customer_name, sum(b.total_cost) as revenue_per_customer 
from customer c 
join booking b on c.id = b.customer_id 
group by c.customer_name ;
/*+------------------+----------------------+
| customer_name    | revenue_per_customer |
+------------------+----------------------+
| draco malfoy     |                  960 |
| ginni weasley    |                34000 |
| harry potter     |                11440 |
| hermione granger |                32000 |
| ronald weasley   |                18000 |
+------------------+----------------------+*/

-- 13. Write a sql query to calculate the average ticket price for event in each category and venue. 
select e.event_type,v.venue_name, avg(distinct e.ticket_price) 
from event e join venue v on e.venue_id = v.id 
group by e.event_type, v.id ; 
/*+------------+-------------+------------------------------+
| event_type | venue_name  | avg(distinct e.ticket_price) |
+------------+-------------+------------------------------+
| concert    | pondicherry |                          600 |
| sports     | mumbai      |                         8000 |
| sports     | chennai     |                         3500 |
+------------+-------------+------------------------------+*/

-- 14. Write a sql query to list the total number of users and total number of tickets they've purchased in last 30 days.


-- Tasks 4: Subquery and its types


-- 1. Calculate the Average Ticket Price for Events in Each Venue Using a Subquery.
select v.venue_name, avg(distinct e.ticket_price) 
from venue v 
join event e on v.id = e.venue_id 
group by v.venue_name;
/*+-------------+------------------------------+
| venue_name  | avg(distinct e.ticket_price) |
+-------------+------------------------------+
| chennai     |                         3500 |
| mumbai      |                         8000 |
| pondicherry |                          600 |
+-------------+------------------------------+*/

-- 2. Find Events with More Than 50% of Tickets Sold using subquery.
select * 
from event 
where (total_seats - available_seats) > total_seats/2;
/*+----+------------+------------+------------+-------------+--------------+------------+----------+-----------------+
| id | event_name | event_date | event_time | total_seats | ticket_price | event_type | venue_id | available_seats |
+----+------------+------------+------------+-------------+--------------+------------+----------+-----------------+
|  2 | CSK vs RCB | 2024-04-11 | 19:30:00   |       19000 |         3600 | sports     |        2 |               3 |
|  3 | CSK vs RR  | 2024-04-19 | 19:30:00   |       23000 |         3400 | sports     |        2 |              10 |
|  4 | MI vs KKR  | 2024-05-01 | 15:30:00   |       28000 |         8000 | sports     |        1 |             100 |
+----+------------+------------+------------+-------------+--------------+------------+----------+-----------------+*/

-- 3. Calculate the Total Number of Tickets Sold for Each Event.
select event_name, sum(total_seats - available_seats) 
from event 
group by event_name;
/*+----------------------------------+------------------------------------+
| event_name                       | sum(total_seats - available_seats) |
+----------------------------------+------------------------------------+
| CSK vs RCB                       |                              18997 |
| CSK vs RR                        |                              22990 |
| Late Ms. Lata Mangeshkar Musical |                                 50 |
| MI vs KKR                        |                              27900 |
+----------------------------------+------------------------------------+*/

-- 4. Find Users Who Have Not Booked Any Tickets Using a NOT EXISTS Subquery.
select customer.*
from customer 
where id not in (select distinct c.id 
				from customer c join booking b on c.id = b.customer_id);
/*NULL*/

-- 5. List Events with No Ticket Sales Using a NOT IN Subquery.
select e.* 
from event e join booking b on e.id = b.event_id
where (total_seats - available_seats) = 0;
/*NULL*/

-- 6. Calculate the Total Number of Tickets Sold for Each Event Type Using a Subquery in the FROM Clause.
select e.event_type, sum(distinct total_seats - available_seats) as tickets_sold 
from event e  
group by e.event_type;
/*+------------+--------------+
| event_type | tickets_sold |
+------------+--------------+
| concert    |           50 |
| sports     |        69887 |
+------------+--------------+*/

-- 7. Find Events with Ticket Prices Higher Than the Average Ticket Price Using a Subquery in the WHERE Clause.
select event_name 
from event where  ticket_price > (select avg(ticket_price) from event);
/*+------------+
| event_name |
+------------+
| MI vs KKR  |
+------------+*/

-- 8. Calculate the Total Revenue Generated by Events for Each User Using a Correlated Subquery.
select c.customer_name, sum( b.total_cost) as 'revenue_pre_customer' 
from customer c join booking b on c.id = b.customer_id 
group by c.customer_name;
/*+------------------+----------------------+
| customer_name    | revenue_per_customer |
+------------------+----------------------+
| draco malfoy     |                  960 |
| ginni weasley    |                34000 |
| harry potter     |                11440 |
| hermione granger |                32000 |
| ronald weasley   |                18000 |
+------------------+----------------------+*/

-- 9. List Users Who Have Booked Tickets for Events in a Given Venue Using a Subquery in the WHEREClause.
select c.customer_name,e.event_name,v.venue_name  
from customer c 
join booking b on c.id = b.customer_id 
join event e on b.event_id = e.id 
join venue v on e.venue_id = v.id 
where v.venue_name = 'mumbai';
/*+---------------+------------+------------+
| customer_name | event_name | venue_name |
+---------------+------------+------------+
| harry potter  | MI vs KKR  | mumbai     |
| draco malfoy  | MI vs KKR  | mumbai     |
+---------------+------------+------------+*/

-- 10. Calculate the Total Number of Tickets Sold for Each Event Category Using a Subquery with
select e.event_type, sum(distinct total_seats - available_seats) as 'tickets_sold' 
from event e 
group by e.event_type;
/*+------------+--------------+
| event_type | tickets_sold |
+------------+--------------+
| concert    |           50 |
| sports     |        69887 |
+------------+--------------+*/

-- 11. Find Users Who Have Booked Tickets for Events in each Month Using a Subquery with DATE_FORMAT.
select month(b.booking_date),c.customer_name 
from customer c 
join booking b on c.id = b.customer_id 
group by month(b.booking_date),c.id;
/*+-----------------------+------------------+
| month(b.booking_date) | customer_name    |
+-----------------------+------------------+
|                     4 | harry potter     |
|                     4 | ronald weasley   |
|                     4 | ginni weasley    |
|                     5 | hermione granger |
|                     9 | harry potter     |
|                     9 | draco malfoy     |
+-----------------------+------------------+*/

-- 12. Calculate the Average Ticket Price for Events in Each Venue Using a Subquery describe event;
select v.venue_name, avg(distinct e.ticket_price) as 'Avg_Price' 
from venue v 
join event e on v.id = e.venue_id 
group by v.venue_name;
/*+-------------+-----------+
| venue_name  | Avg_Price |
+-------------+-----------+
| chennai     |      3500 |
| mumbai      |      8000 |
| pondicherry |       600 |
+-------------+-----------+*/