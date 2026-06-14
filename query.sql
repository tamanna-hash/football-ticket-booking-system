-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS
DROP TABLE IF EXISTS Bookings;

DROP TABLE IF EXISTS Matches;

DROP TABLE IF EXISTS Users;

CREATE TABLE
    Users (
        user_id serial PRIMARY KEY,
        full_name varchar(50) NOT NULL,
        email varchar(30) UNIQUE NOT NULL,
        role varchar(20) NOT NULL CHECK (role IN ('Ticket Manager', 'Football Fan')),
        phone_number varchar(15)
    );

CREATE TABLE
    Matches (
        match_id serial PRIMARY KEY,
        fixture varchar(50) NOT NULL,
        tournament_category varchar(30) NOT NULL,
        base_ticket_price decimal(10, 2) CHECK (base_ticket_price >= 0) NOT NULL,
        match_status varchar(20) CHECK (
            match_status IN (
                'Available',
                'Selling Fast',
                'Sold Out',
                'Postponed'
            )
        ) NOT NULL
    );


CREATE TABLE
    Bookings (
        booking_id serial PRIMARY KEY,
        user_id int REFERENCES Users (user_id) ON DELETE CASCADE,
        match_id int REFERENCES Matches (match_id) ON DELETE CASCADE,
        seat_number varchar(10),
        payment_status varchar(20) CHECK (
            payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded')
        ),
        total_cost decimal(10, 2) CHECK (total_cost >= 0) NOT NULL
    );


INSERT INTO
    Users (user_id, full_name, email, role, phone_number)
VALUES
    (
        1,
        'Tanvir Rahman',
        'tanvir@mail.com',
        'Football Fan',
        '+8801711111111'
    ),
    (
        2,
        'Asif Haque',
        'asif@mail.com',
        'Football Fan',
        '+8801722222222'
    ),
    (
        3,
        'Sajjad Rahman',
        'sajjad@mail.com',
        'Ticket Manager',
        '+8801733333333'
    ),
    (
        4,
        'Jannat Ara',
        'jannat@mail.com',
        'Football Fan',
        NULL
    );


INSERT INTO
    Matches (
        match_id,
        fixture,
        tournament_category,
        base_ticket_price,
        match_status
    )
VALUES
    (
        101,
        'Real Madrid vs Barcelona',
        'Champions League',
        150.00,
        'Available'
    ),
    (
        102,
        'Man City vs Liverpool',
        'Premier League',
        120.00,
        'Selling Fast'
    ),
    (
        103,
        'Bayern Munich vs PSG',
        'Champions League',
        130.00,
        'Available'
    ),
    (
        104,
        'AC Milan vs Inter Milan',
        'Serie A',
        90.00,
        'Sold Out'
    ),
    (
        105,
        'Juventus vs Roma',
        'Serie A',
        80.00,
        'Available'
    );


INSERT INTO
    Bookings (
        booking_id,
        user_id,
        match_id,
        seat_number,
        payment_status,
        total_cost
    )
VALUES
    (501, 1, 101, 'A-12', 'Confirmed', 150.00),
    (502, 1, 102, 'B-04', 'Confirmed', 120.00),
    (503, 2, 101, 'A-13', 'Confirmed', 150.00),
    (504, 2, 101, NULL, NULL, 150.00),
    (505, 3, 102, 'C-20', 'Pending', 120.00);