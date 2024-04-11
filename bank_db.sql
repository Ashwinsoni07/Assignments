-- Task 1

use bank_hex_april_24;

insert into customer(first_name,last_name,dob) values 
('harry','potter','2002-03-21'),
('ronald','weasley','2001-02-10'),
('hermione','granger','2002-11-15');

insert into account (account_type,balance,customer_id) values
('savings',50000,1),
('current',120000,2) ,
('zero_balance',100000,3),
('current',150000,1) ,
('savings',30000,3);

insert into transaction(transaction_type,amount,transaction_date,account_id) 
values 
('deposit', 10000, '2024-02-01',1),
('withdrawal', 5000, '2024-02-02',1),
('deposit', 20000, '2024-02-02',2),
('withdrawal', 8000, '2024-02-02',3),
('transfer', 20000, '2024-02-01',4),
('transfer', 7000, '2024-02-05',5);

-- Task 2

-- 1. Write a SQL query to retrieve the name, account type and email of all customers.
select c.first_name,c.last_name, a.account_type
from  customer c join account a on c.id = a.customer_id ; 

-- 2. Write a SQL query to list all transaction corresponding customer.
select c.first_name, c.last_name, t.*
from customer c join account a on  c.id = a.customer_id 
				join transaction t on a.id = t.account_id 
order by c.first_name;

-- 3. Write a SQL query to increase the balance of a specific account by a certain amount.

update account 
set balance = balance + 1000 
where id = 2;

-- 4. Write a SQL query to Combine first and last names of customers as a full_name.

-- 5. Write a SQL query to remove accounts with a balance of zero where the account type is savings.
delete from account 
where balance = 0 and accpunt_type = 'savings';

-- 6. Write a SQL query to Find customers living in a specific city.

-- City column does not exist

-- 7. Write a SQL query to Get the account balance for a specific account.
select balance 
from account where id = '3';

-- 8. Write a SQL query to List all current accounts with a balance greater than $1,000.
select * 
from account where account_type = 'current' and balance > 1000;

-- 9. Write a SQL query to Retrieve all transactions for a specific account.
select * 
from account a  join transaction t  on a.id = t.account_id
where a.id = '1';  

-- 10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.

-- interest column does not exist

-- 11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit.
select * 
from account 
where balance < 100000;
/*+----+--------------+---------+-------------+
| id | account_type | balance | customer_id |
+----+--------------+---------+-------------+
|  1 | savings      |   50000 |           1 |
|  5 | savings      |   30000 |           3 |
+----+--------------+---------+-------------+*/

-- 12. Write a SQL query to Find customers not living in a specific city.

-- city column does not exist
 
-- Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins:

-- 1. Write a SQL query to Find the average account balance for all customers.
select avg(a.balance) as 'avg_balance' 
from customer c 
join account a on c.id = a.customer_id;
/*+-------------+
| avg_balance |
+-------------+
|  90200.0000 |*/

-- 2. Write a SQL query to Retrieve the top 10 highest account balances.
select balance 
from account 
order by balance desc 
limit 10;
/*+---------+
| balance |
+---------+
|  150000 |
|  121000 |
|  100000 |
|   50000 |
|   30000 |*/

-- 3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.
select sum(amount) 
from transaction 
where transaction_type = 'deposit' and transaction_date = '2024-02-02';
/*+-------------+
| sum(amount) |
+-------------+
|       20000 |*/

-- 4. Write a SQL query to Find the Oldest and Newest Customers.
select *
from customer
order by dob;

-- 5. Write a SQL query to Retrieve transaction details along with the account type.
select t.*,a.account_type 
from account a 
join transaction t on a.id = t.account_id;
/*+----+------------------+--------+------------------+------------+--------------+
| id | transaction_type | amount | transaction_date | account_id | account_type |
+----+------------------+--------+------------------+------------+--------------+
|  1 | deposit          |  10000 | 2024-02-01       |          1 | savings      |
|  2 | withdrawal       |   5000 | 2024-02-02       |          1 | savings      |
|  3 | deposit          |  20000 | 2024-02-02       |          2 | current      |
|  4 | withdrawal       |   8000 | 2024-02-02       |          3 | zero_balance |
|  5 | transfer         |  20000 | 2024-02-01       |          4 | current      |
|  6 | transfer         |   7000 | 2024-02-05       |          5 | savings      |
+----+------------------+--------+------------------+------------+--------------+*/

-- 6. Write a SQL query to Get a list of customers along with their account details.
select c.*,a.* 
from customer c 
join account a on c.id = a.customer_id; 
/*+----+------------+-----------+------------+----+--------------+---------+-------------+
| id | first_name | last_name | dob        | id | account_type | balance | customer_id |
+----+------------+-----------+------------+----+--------------+---------+-------------+
|  1 | harry      | potter    | 2002-03-21 |  1 | savings      |   50000 |           1 |
|  2 | ronald     | weasley   | 2001-02-10 |  2 | current      |  121000 |           2 |
|  3 | hermione   | granger   | 2002-11-15 |  3 | zero_balance |  100000 |           3 |
|  1 | harry      | potter    | 2002-03-21 |  4 | current      |  150000 |           1 |
|  3 | hermione   | granger   | 2002-11-15 |  5 | savings      |   30000 |           3 |
+----+------------+-----------+------------+----+--------------+---------+-------------+*/

-- 7. Write a SQL query to Retrieve transaction details along with customer information for a specific account.
select c.*,t.* 
from customer c 
join account a on c.id = a.customer_id 
join transaction t on a.id = t.account_id 
where a.id = 1; 
/*+----+------------+-----------+------------+----+------------------+--------+------------------+------------+
| id | first_name | last_name | dob        | id | transaction_type | amount | transaction_date | account_id |
+----+------------+-----------+------------+----+------------------+--------+------------------+------------+
|  1 | harry      | potter    | 2002-03-21 |  1 | deposit          |  10000 | 2024-02-01       |          1 |
|  1 | harry      | potter    | 2002-03-21 |  2 | withdrawal       |   5000 | 2024-02-02       |          1 |
+----+------------+-----------+------------+----+------------------+--------+------------------+------------+*/

-- 8. Write a SQL query to Identify customers who have more than one account.
select c.* 
from customer c 
join account a on c.id = a.customer_id 
group by a.customer_id 
having count(a.customer_id) > 1;
/*+----+------------+-----------+------------+
| id | first_name | last_name | dob        |
+----+------------+-----------+------------+
|  1 | harry      | potter    | 2002-03-21 |
|  3 | hermione   | granger   | 2002-11-15 |
+----+------------+-----------+------------+*/

-- 9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals.
select 	
    (select sum(amount) 
	from transaction 
	where transaction_type = 'deposit')-( select sum(amount) 
										from transaction 
										where transaction_type = 'withdrawal') as 'Difference_Amount';
/*+-------------------+
| Difference_Amount |
+-------------------+
|             17000 |
+-------------------+*/

-- 10. Write a SQL query to Calculate the average daily balance for each account over a specified period.

-- 11. Calculate the total balance for each account type.
select account_type,sum(balance) 
from account 
group by account_type;
/*+--------------+--------------+
| account_type | sum(balance) |
+--------------+--------------+
| current      |       271000 |
| savings      |        80000 |
| zero_balance |       100000 |
+--------------+--------------+*/

-- 12. Identify accounts with the highest number of transactions order by descending order.
select a.*,count(t.id) as 'number_of_transaction' 
from account a 
join transaction t on a.id = t.account_id 
group by t.account_id 
order by number_of_transaction desc;
/*+----+--------------+---------+-------------+-----------------------+
| id | account_type | balance | customer_id | number_of_transaction |
+----+--------------+---------+-------------+-----------------------+
|  1 | savings      |   50000 |           1 |                     2 |
|  2 | current      |  121000 |           2 |                     1 |
|  3 | zero_balance |  100000 |           3 |                     1 |
|  4 | current      |  150000 |           1 |                     1 |
|  5 | savings      |   30000 |           3 |                     1 |
+----+--------------+---------+-------------+-----------------------+*/

-- 13. List customers with high aggregate account balances, along with their account types.
select c.*, sum(a.balance) as 'Aggregate_balance' 
from customer c 
join account a on c.id = a.customer_id 
group by c.id 
order by Aggregate_balance desc;
/*+----+------------+-----------+------------+-------------------+
| id | first_name | last_name | dob        | Aggregate_balance |
+----+------------+-----------+------------+-------------------+
|  1 | harry      | potter    | 2002-03-21 |            200000 |
|  3 | hermione   | granger   | 2002-11-15 |            130000 |
|  2 | ronald     | weasley   | 2001-02-10 |            121000 |
+----+------------+-----------+------------+-------------------+*/
 
-- 14. Identify and list duplicate transactions based on transaction amount, date, and account
select *
from transaction 
where transaction_date in (select transaction_date  from transaction t group by transaction_date having count(*)>1) 
and amount in (select amount from transaction t group by amount having count(*)>1) 
and account_id in (select account_id from transaction t group by account_id having count(*)>1);
/*NULL*/

-- Task 4:

-- 1. Retrieve the customer(s) with the highest account balance.
select distinct c.*,a.balance 
from customer c 
join account a on c.id = a.customer_id
order by a.balance desc
limit 1; 
-- 1	harry	potter	2002-03-21	150000

-- 2. Calculate the average account balance for customers who have more than one account.
select c.*,avg(a.balance) as 'average_balance' 
from customer c 
join account a on c.id = a.customer_id 
group by a.customer_id 
having count(a.customer_id) > 1;
/*+----+------------+-----------+------------+-----------------+
| id | first_name | last_name | dob        | average_balance |
+----+------------+-----------+------------+-----------------+
|  1 | harry      | potter    | 2002-03-21 |     100000.0000 |
|  3 | hermione   | granger   | 2002-11-15 |      65000.0000 |
+----+------------+-----------+------------+-----------------+*/

-- 3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.
select a.*,t.amount 
from account a 
join transaction t on a.id = t.account_id 
where t.amount > (select avg(amount) from transaction); 
/*+----+--------------+---------+-------------+--------+
| id | account_type | balance | customer_id | amount |
+----+--------------+---------+-------------+--------+
|  2 | current      |  121000 |           2 |  20000 |
|  4 | current      |  150000 |           1 |  20000 |
+----+--------------+---------+-------------+--------+*/

-- 4. Identify customers who have no recorded transactions.
select c.*
from customer c 
join account a on c.id = a.customer_id 
join transaction t on a.id = t.account_id 
where c.id not in (select customer_id from transaction);
-- NULL

-- 5. Calculate the total balance of accounts with no recorded transactions.
select a.*,sum(a.balance) as 'Total_balance'
from account a  
join transaction t on a.id = t.account_id 
where a.id not in (select account_id from transaction)
group by t.account_id;
-- NULL

-- 6. Retrieve transactions for accounts with the lowest balance.
select t.*,a.balance 
from account a 
join transaction t on a.id = t.account_id 
order by a.balance ;
/*+----+------------------+--------+------------------+------------+---------+
| id | transaction_type | amount | transaction_date | account_id | balance |
+----+------------------+--------+------------------+------------+---------+
|  6 | transfer         |   7000 | 2024-02-05       |          5 |   30000 |
|  1 | deposit          |  10000 | 2024-02-01       |          1 |   50000 |
|  2 | withdrawal       |   5000 | 2024-02-02       |          1 |   50000 |
|  4 | withdrawal       |   8000 | 2024-02-02       |          3 |  100000 |
|  3 | deposit          |  20000 | 2024-02-02       |          2 |  121000 |
|  5 | transfer         |  20000 | 2024-02-01       |          4 |  150000 |
+----+------------------+--------+------------------+------------+---------+*/

-- 7. Identify customers who have accounts of multiple types.
select c.* 
from customer c 
join account a on c.id = a.customer_id 
having count(a.account_type)>1;
/*+----+------------+-----------+------------+
| id | first_name | last_name | dob        |
+----+------------+-----------+------------+
|  1 | harry      | potter    | 2002-03-21 |
+----+------------+-----------+------------+*/

-- 8. Calculate the percentage of each account type out of the total number of accounts.

-- 9. Retrieve all transactions for a customer with a given customer_id.
select * 
from customer c 
join account a on c.id = a.customer_id 
join transaction t on a.id = t.account_id 
where c.id = 1;
/*+----+------------+-----------+------------+----+--------------+---------+-------------+----+------------------+--------+------------------+------------+
| id | first_name | last_name | dob        | id | account_type | balance | customer_id | id | transaction_type | amount | transaction_date | account_id |
+----+------------+-----------+------------+----+--------------+---------+-------------+----+------------------+--------+------------------+------------+
|  1 | harry      | potter    | 2002-03-21 |  1 | savings      |   50000 |           1 |  1 | deposit          |  10000 | 2024-02-01       |          1 |
|  1 | harry      | potter    | 2002-03-21 |  1 | savings      |   50000 |           1 |  2 | withdrawal       |   5000 | 2024-02-02       |          1 |
|  1 | harry      | potter    | 2002-03-21 |  4 | current      |  150000 |           1 |  5 | transfer         |  20000 | 2024-02-01       |          4 |
+----+------------+-----------+------------+----+--------------+---------+-------------+----+------------------+--------+------------------+------------+*/

-- 10. Calculate the total balance for each account type, including a subquery within the SELECT clause.
select account_type,sum(balance) as 'Total_Balance' 
from account 
group by account_type;
/*+--------------+---------------+
| account_type | Total_Balance |
+--------------+---------------+
| current      |        271000 |
| savings      |         80000 |
| zero_balance |        100000 |
+--------------+---------------+*/