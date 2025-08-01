-- Sales & Revenue Analysis
-- Which customers made the most purchases

select *, rank() over (order by Total desc)
from (with cte as (select c.first_name, c.last_name, p.amount
                   from payment as p
                            inner join customer as c on p.customer_id = c.customer_id)

      select first_name, sum(amount) as Total
      from cte
      group by first_name
      order by Total desc) as total_table limit 10;