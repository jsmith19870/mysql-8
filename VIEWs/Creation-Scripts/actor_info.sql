create ALGORITHM = UNDEFINED SQL SECURITY INVOKER VIEW `actor_info` as 

select `a`.`actor_id` as `actor_id`,
	`a`.`first_name` as `first_name`,
	`a`.`last_name` as `last_name`,
	group_concat(distinct concat(`c`.`name`, ': ', 
			(
			select group_concat(`f`.`title` 
				order by `f`.`title` asc separator ', ' 
				) 
			from ((`sakila`.`film` `f` 
						join `sakila`.`film_category` `fc` on((`f`.`film_id` = `fc`.`film_id`))) 
					join `sakila`.`film_actor` `fa` on((`f`.`film_id` = `fa`.`film_id`))) 
			where ((`fc`.`category_id` = `c`.`category_id`) and (`fa`.`actor_id` = `a`.`actor_id`))
			)) 
	order by `c`.`name` asc separator '; ' 
	) as `film_info` 
from (((`sakila`.`actor` `a` 
				left join `sakila`.`film_actor` `fa` on((`a`.`actor_id` = `fa`.`actor_id`))) 
			left join `sakila`.`film_category` `fc` on((`fa`.`film_id` = `fc`.`film_id`))) 
		left join `sakila`.`category` `c` on((`fc`.`category_id` = `c`.`category_id`))) 
group by `a`.`actor_id`, `a`.`first_name`, `a`.`last_name`