
SELECT * FROM books;
SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM return_status;
SELECT * FROM issued_status;
SELECT * FROM members;




-- CRUD Operations


-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
 insert into books (isbn,
book_title	,
category	, 
rental_price	,
status	 ,
author	,
publisher ) values 
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');


-- Task 2: Update an Existing Member's Address

update  members 
set member_address = 'hyd' where member_id = 'C101';
select * from members;
-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
select * from issued_status;
delete from issued_status where   issued_id = 'IS121';

-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E109'

select * from issued_status where  issued_emp_id = 'E109';

-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.
select   issued_emp_id ,count(issued_emp_id)  as number_of_books from issued_status
group by  issued_emp_id   
having  count(issued_emp_id) >1 ;

-- ### 3. CTAS (Create Table As Select)

-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt
SELECT * FROM employees;
SELECT * FROM branch;
select  * from employees as emp 
full join branch as br
on emp.emp_id = br.branch_id;
-- ### 4. Data Analysis & Findings

-- Task 7. **Retrieve All Books in a Specific Category:
select book_title from books where  category ='Classic' ;

-- Task 8: Find Total Rental Income by Category:
select  category ,sum(rental_price) from books group by category ;

-- Task 9. **List Members Who Registered in the Last 180 Days**:
SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL '1000 days';
-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:
select * from employees as emp  full join branch as br on emp.branch_id =br.branch_id ;

-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold
create table new_books as
select * from books where rental_price>6.00;
select * from new_books;
-- Task 12: Retrieve the List of Books Not Yet Returned
 SELECT * FROM issued_status as ist
LEFT JOIN
return_status as rs
ON rs.issued_id = ist.issued_id
WHERE rs.return_id IS NULL;
