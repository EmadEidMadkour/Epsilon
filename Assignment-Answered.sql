# Q1- what is the amount paid of rental id which is 1422?
Select rental_id,amount
from payment 
where rental_id=1422;

# Q2- what is the data of 5 greatest amount paid? 
Select * from payment
order by amount desc
limit 5;

# Q3-What is summation of payment for each customer where summation is greater than 100?
Select sum(amount) as payments,customer_id
from payment
group by customer_id
having payments>100;

# Q4-How many distinct actors last names are there?
Select Count(distinct(last_name))
from actor
where last_name is not null;

# Q5-Which last names appear more than once?
Select last_name,count(last_name) as num_of_repeated
from actor
group by last_name
having num_of_repeated>1;

# Q6-Which actor has appeared in the most films?
Select count(film_id) as CountFilms,f.actor_id,a.first_name
from film_actor f
inner join actor a
on f.actor_id=a.actor_id
group by f.actor_id
order by CountFilms desc
limit 1;

#Q7-Is ‘Academy Dinosaur’ available for rent from Store 1?
select * from film f
inner join inventory i
on f.film_id=i.film_id
where title="Academy Dinosaur" and store_id=1;


#Q8- Return the full names (first and last) of actors with “SON” in their last name, ordered by their first

Select concat(first_name," ",last_name) 
from actor
where last_name like "%SON%"
order by first_name;

#Q9- Find all the addresses where the second address is not empty (i.e., contains some text), and return
#these second addresses sorted

select * from address
Where address2 is not null
order by address2 asc;


#Q10- Return the first and last names of actors who played in a film involving a “Crocodile” and a “Shark”,
#along with the release year of the movie, sorted by the actors’ last names.

Select ac.first_name,ac.last_name, fi.release_year,fi.title,fi.description
from film_actor fa
inner join film fi
on fa.film_id=fa.film_id
inner join actor ac
on fa.actor_id=ac.actor_id
where fi.description like "%Crocodile%" and fi.description like "%Shark%"
order by ac.last_name asc;



# Q11- How many films involve a “Crocodile” and a “Shark”?
Select count(film_id) from film
where description like "%Crocodile%" and description like "%Shark%";



# Q12- Find all the film categories in which there are between 55 and 65 films. Return the names of these
#categories and the number of films per category, sorted by the number of films.

select count(film_id), fc.category_id,c.category_id,c.name
from film_category fc
inner join category c
on fc.category_id=c.category_id
group by fc.category_id
having count(film_id) between 55 and 65
order by count(film_id) asc;


# Q13- How many distinct actors last names are there?
Select count(distinct(last_name)) 
from actor;


# Q14- When is ‘Academy Dinosaur’ due?
Select return_date 
from rental where inventory_id in (
Select inventory_id from inventory where film_id in (
select film_id from film where title="Academy Dinosaur")
);


# Q15-  Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.

Select upper(concat(first_name," ",last_name)) as Actor_Name
from actor;

# Q16- Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China
Select country_id,country 
from country
where country in ("Afghanistan","Bangladesh","China");

# Q17- Find all actors whose last name contain the letters GEN:
Select actor_id, first_name, last_name 
from actor
where last_name like "%GEN%";


# Q18- Use JOIN to display the first and last names, as well as the address, of each staff member. - Use the tables staff and address:
Select s.first_name,s.last_name,a.address
from staff s
INNER join address a
on s.address_id=a.address_id;


# Q19- Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment.
select first_name,last_name, sum(amount) as total_payments
from staff 
inner join payment 
on staff.staff_id=payment.staff_id and payment_date like "%2005-08%"
group by first_name,last_name;


# Q20- The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS. Write a query to fix the record.
Update actor
set first_name="HARPO"
Where first_name="GROUCHO" and last_name="WILLIAMS";



