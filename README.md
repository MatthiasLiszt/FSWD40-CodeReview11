# FSWD40-CodeReview11

 Car Rental Site with PHP, MySQL and JavaScript

## Administrator Rights

the database has a User __Admin__ whose __password__ is handschuh

## ApiKey for GPS tracking

the ApiKey for GPS tracking is not included in the database in the repo

## Project Description

"PHP car rental agency" has several offices across Vienna.  At every single office, several cars are stationed  and currently available for the customers. Once a customer rents a car, a car is picked up from an office, and must be returned to an office (either the same, or some other office of "PHP car rental agency").

In the meantime, a car is not at the office - it is on the streets of Vienna. All cars have an installed GPS system that tracks them and reports latitude and longitude to the web server database through a system designed by a 3rd party company (for you, location data appears “magically” in the corresponding database table).

(Note: contrary to the DB-centric CodeReview 09, this one is not focused on the rental process, but more on the tracking of cars. If you feel very confident, you can expand on the base of your previous work - otherwise, create a DB structure that is simpler and covers this specific use-case. No elaborate DB design process is needed -  SQL dump of the database is sufficient (i.e. no PDFs with ERP & DB-diagrams are required).  

