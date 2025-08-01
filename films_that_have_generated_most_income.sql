-- Sales & Revenue Analysis
-- Identify the films that have generated the most income.

with cte as (select f.title, sum(p.amount) as total
from film as f
         join inventory as i on f.film_id = i.film_id
         join rental as r on r.inventory_id = i.inventory_id
         join payment as p on p.rental_id = r.rental_id group by f.title order by total desc)

select *, (row_number() over(order by total desc)) as ranking from cte limit 10;