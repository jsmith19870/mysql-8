create ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_00243` as 

select `actor`.`actor_id` as `actor_id`,
	`actor`.`first_name` as `first_name`,
	`actor`.`last_name` as `last_name`,
	`actor`.`last_update` as `last_update` 
from `actor`