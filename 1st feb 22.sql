SELECT 
    *
FROM
    bank.trans;
USE bank;

SELECT 
    date, type, account_id
FROM
    trans
WHERE
    type = 'PRIJEM';
    
SELECT 
    COUNT(*)
FROM
    trans
WHERE
    type = 'PRIJEM';
SELECT 
    *
FROM
    trans
LIMIT 10;

SELECT 
    COUNT(DISTINCT type)
FROM
    trans
LIMIT 10;
SELECT 'Hello world';
SELECT 2 + 2;
SELECT DISTINCT
    A2
FROM
    district;
SELECT DISTINCT
    A2
FROM
    client;
SELECT DISTINCT
    A2, A3
FROM
    district
LIMIT 30;

SELECT 
    *
FROM
    trans;
SELECT 
    t.trans_id AS Transaction_id,
    t.account_id AS Account_id,
    t.date AS Dateoftrans,
    t.type AS Trans_Type
FROM
    trans AS t;
    
SELECT 
    A2 AS district_name, A3 AS region_name
FROM
    district
LIMIT 30;

SELECT 
    *, ROUND((amount - payments) / 1000, 2) AS balance_k
FROM
    loan WHERE status NOT IN  ('B', 'D');
    
SELECT A2 as district_name, A11 as average_salary from district where A11 > 1000;
SELECT loan_id from loan where status = 'B';
SELECT card_id from card where type = 'junior' limit 10;
SELECT loan_id, account_id, ROUND((amount - payments) / 1000, 2) AS balance_k from loan where status = 'B';
SELECT A2 AS district_name, ROUND((A4 * A10)/100) as urban_population from district where A10 >50;
select * from loan where status in ('B', 'D') OR amount > 250000;

select max(amount), min(amount), round(avg(amount)) from bank.order;

select *, concat(order_id, ' - ', account_id) as reference from bank.order;

select max(length(A2)) from district;

select * from district where length (A2) = 19;
select *, left(A2, 4) as s_left, right(A2, 4) as s_right, concat(left(A2, 4), right(A2, 4)) as s_concat from district;

select * from card;
select * from card where type = 'junior' and left (issued, 6) >= 980000;
select * from trans where type = 'VYDAJ' and operation = 'VYBER' limit 10;
SELECT amount, loan_id, account_id, amount-payments as debt from loan where status = 'B' and amount-payments > 1000;
select min(amount), max(amount) from trans where amount != 0;
select account_id, district_id, frequency, concat('19', left(date, 2)) as _Year from account;
SELECT 
    account_id,
    district_id,
    frequency,
    CASE
        WHEN LEFT(date, 2) < 30 THEN CONCAT('20', LEFT(date, 2))
        ELSE CONCAT('19', LEFT(date, 2))
    END AS _Year
FROM
    account;
    
select *, convert(a.date, DATE) from account as a;
select *, DATE_FORMAT(convert(a.date, DATE), '%D %M %Y') as opendate from account as a;
select *, DATE_FORMAT(convert(a.date, DATE), '%d %m %y') as opendate from account as a;
select *, DATE_FORMAT(convert(a.date, DATE), '%d-%m-%y') as opendate from account as a;

select issued from card;
select convert(SUBSTRING_INDEX(issued, ' ',1), DATE) AS issuedate from card;

CREATE VIEW loan_statuses AS
    SELECT 
        loan_id,
        account_id,
        CASE
            WHEN status = 'A' THEN 'good-finished'
            WHEN status = 'B' THEN 'bad-unpaid'
            WHEN status = 'C' THEN 'good-running'
            ELSE 'default-running'
        END AS status_description
    FROM
        loan
    WHERE
        amount IS NOT NULL;