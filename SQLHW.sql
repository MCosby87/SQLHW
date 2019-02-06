
SELECT first_name, last_name FROM actor;

select concat(first_name, ' ', last_name)from actor; 
SELECT * FROM actor WHERE first_name = 'Joe';
SELECT * FROM actor WHERE last_name like '%gen%';
SELECT last_name, first_name FROM actor WHERE last_name like '%li%';
select country_id, country from country where country in ('Afghanistan', 'Bangladesh', 'China');
alter table actor add description blob;
alter table actor drop description;
select last_name, count(last_name) from actor group by last_name;
select last_name, count(last_name) from actor group by last_name having count(last_name) > 1;
update actor set first_name = 'HARPO' where last_name = 'WILLIAMS';
update actor set first_name = 'GROUCHO' where last_name = 'WILLIAMS';
show create table address;
select first_name, last_name, address from staff left join address on staff.address_id = address.address_id order by last_name; 
select sum(amount), first_name, last_name from staff inner join payment on staff.staff_id = payment.staff_id group by last_name;
select first_name, last_name, sum(payment.amount) as total_amount from staff inner join payment on staff.staff_id = payment.staff_id where Month(payment.payment_date) = 8 and Year (payment.payment_date) = 2005 group by payment.staff_id;
select title, count(actor_id) from film inner join film_actor on film.film_id = film_actor.film_id group by film_actor.film_id;
select title, count(inventory.film_id) as copies_total from film inner join inventory on film.film_id = inventory.film_id where film.title = "Hunchback Impossible" group by inventory.film_id;
select first_name, last_name, sum(payment.amount) from customer inner join payment on customer.customer_id = payment.customer_id group by payment.customer_id order by customer.last_name;
select title from film where language_id IN(select language_id from language where name = "English") and title like "K%" or title like "Q%";
select actor_id, first_name, last_name from actor where actor_id in(Select actor_id  from film_actor where film_actor.film_id in(Select film_id from film where title = "Alone Trip"));
select first_name, last_name, email from customer inner join address on customer.address_id = address.address_id Where city_id in(select city_id from city inner join country on city.country_id = country.country_id where country = "Canada");
select title from film inner join film_category on film.film_id = film_category.film_id where category_id in(select category_id from category where name = "Family");
Select film.title, count(rental.rental_id) from film inner join inventory on film.film_id = inventory.film_id inner join rental on inventory.inventory_id = rental.inventory_id Group By title;
Select store.store_id, sum(payment.amount) from store inner join staff on store.store_id = staff.store_id inner join payment on payment.staff_id = staff.staff_id group by store_id;
select store.store_id, city.city, country.country from  store inner join address on store.address_id = address.address_id inner join city on address.city_id = city.city_id inner join country on city.country_id = country.country_id;
Select category.name, sum(payment.amount) from payment inner join rental on payment.rental_id = rental.rental_id inner join inventory on inventory.inventory_id = rental.inventory_id inner join film_category on film_category.film_id = inventory.film_id inner join category on category.category_id = film_category.category_id group BY category.name order by revenue desc limit 5;
