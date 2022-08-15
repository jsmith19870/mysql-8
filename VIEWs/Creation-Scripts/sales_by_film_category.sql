create ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `sales_by_film_category` as 

select `c`.`name` as `category`,
	Sum(`p`.`amount`) as `total_sales` 
from (((((`payment` `p` 
						join `rental` `r` on((`p`.`rental_id` = `r`.`rental_id`))) 
					join `inventory` `i` on((`r`.`inventory_id` = `i`.`inventory_id`))) 
				join `film` `f` on((`i`.`film_id` = `f`.`film_id`))) 
			join `film_category` `fc` on((`f`.`film_id` = `fc`.`film_id`))) 
		join `category` `c` on((`fc`.`category_id` = `c`.`category_id`))) 
group by `c`.`name` 
order by `total_sales` desc