create ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `staff_list` as 

select `s`.`staff_id` as `ID`,
	concat(`s`.`first_name`, _utf8mb4' ', `s`.`last_name`) as `name`,
	`a`.`address` as `address`,
	`a`.`postal_code` as `zip code`,
	`a`.`phone` as `phone`,
	`city`.`city` as `city`,
	`country`.`country` as `country`,
	`s`.`store_id` as `SID` 
from (((`staff` `s` 
				join `address` `a` on((`s`.`address_id` = `a`.`address_id`))) 
			join `city` on((`a`.`city_id` = `city`.`city_id`))) 
		join `country` on((`city`.`country_id` = `country`.`country_id`)))