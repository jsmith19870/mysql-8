create ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `nicer_but_slower_film_list` as 

select `film`.`film_id` as `FID`,
	`film`.`title` as `title`,
	`film`.`description` as `description`,
	`category`.`name` as `category`,
	`film`.`rental_rate` as `price`,
	`film`.`length` as `length`,
	`film`.`rating` as `rating`,
	group_concat(concat(concat(Upper(substr(`actor`.`first_name`, 1, 1)), Lower(substr(`actor`.`first_name`, 2, length(`actor`.`first_name`))), _utf8mb4' ', concat(Upper(substr(`actor`.`last_name`, 1, 1)), Lower(substr(`actor`.`last_name`, 2, length(`actor`.`last_name`)))))) separator ', ') as `actors` 
from ((((`category` 
					left join `film_category` on((`category`.`category_id` = `film_category`.`category_id`))) 
				left join `film` on((`film_category`.`film_id` = `film`.`film_id`))) 
			join `film_actor` on((`film`.`film_id` = `film_actor`.`film_id`))) 
		join `actor` on((`film_actor`.`actor_id` = `actor`.`actor_id`))) 
group by `film`.`film_id`, `category`.`name`