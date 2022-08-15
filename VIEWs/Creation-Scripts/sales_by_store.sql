create ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `sales_by_store` as 

select concat(`c`.`city`, _utf8mb4',', `cy`.`country`) as `store`,
	concat(`m`.`first_name`, _utf8mb4' ', `m`.`last_name`) as `manager`,
	Sum(`p`.`amount`) as `total_sales` 
from (((((((`payment` `p` 
								join `rental` `r` on((`p`.`rental_id` = `r`.`rental_id`))) 
							join `inventory` `i` on((`r`.`inventory_id` = `i`.`inventory_id`))) 
						join `store` `s` on((`i`.`store_id` = `s`.`store_id`))) 
					join `address` `a` on((`s`.`address_id` = `a`.`address_id`))) 
				join `city` `c` on((`a`.`city_id` = `c`.`city_id`))) 
			join `country` `cy` on((`c`.`country_id` = `cy`.`country_id`))) 
		join `staff` `m` on((`s`.`manager_staff_id` = `m`.`staff_id`))) 
group by `s`.`store_id` 
order by `cy`.`country`, `c`.`city`