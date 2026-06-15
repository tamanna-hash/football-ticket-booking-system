# Football Ticket Booking System - Database Design & SQL Queries

## Overview

This project is a simplified Football Ticket Booking System database designed using PostgreSQL. The database manages users, football matches, and ticket bookings while demonstrating database design principles, referential integrity, and SQL querying techniques.

## Database Structure

The database consists of three tables:

### Users

Stores information about football fans and ticket managers.

### Matches

Stores football match details including fixtures, tournament categories, ticket prices, and match status.

### Bookings

Stores ticket booking information and connects users with matches through foreign key relationships.

## Entity Relationships

* One User can have many Bookings.
* One Match can have many Bookings.
* Each Booking belongs to one User.
* Each Booking belongs to one Match.

## Features Demonstrated

* Primary Keys and Foreign Keys
* Referential Integrity
* Check Constraints
* NOT NULL Constraints
* UNIQUE Constraints
* INNER JOIN
* LEFT JOIN
* Subqueries
* Aggregate Functions
* Pattern Matching using LIKE and ILIKE
* NULL Handling using COALESCE
* Using LIMIT and OFFSET

## Files Included

* `schema.sql` - Database creation script and sample data.
* `query.sql` - SQL queries required by the assignment.

## Technologies Used

* PostgreSQL
* Beekeeper Studio
* SQL

## Author

Tamanna
