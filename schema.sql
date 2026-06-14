-- query 1

SELECT
    match_id,
    fixture,
    base_ticket_price
FROM
    matches
WHERE
    tournament_category = 'Champions League'
    AND match_status = 'Available';

--  query 2
SELECT
    user_id,
    full_name,
    email
FROM
    users
WHERE
    full_name ILIKE ('Tanvir%')
    OR full_name ILIKE ('%Haque%');

-- query 3

SELECT
    booking_id,
    user_id,
    match_id,
    coalesce(payment_status, 'Action Required') AS systematic_status
FROM
    bookings
WHERE
    payment_status IS NULL;

-- query 4

SELECT
    b.booking_id,
    u.full_name,
    m.fixture,
    b.total_cost
FROM
    bookings b
    JOIN users u ON b.user_id = u.user_id
    JOIN matches m ON b.match_id = m.match_id;

-- query 5

SELECT
    u.user_id,
    u.full_name,
    b.booking_id
FROM
    users u
    LEFT JOIN bookings b ON u.user_id = b.user_id;

-- query 6

SELECT
    b.booking_id,
    m.match_id,
    b.total_cost
FROM
    bookings b
    JOIN matches m ON b.match_id = m.match_id
WHERE
    b.total_cost > (
        SELECT
            avg(total_cost)
        FROM
            bookings
    );

-- query 7

SELECT
    match_id,
    fixture,
    base_ticket_price
FROM
    matches
ORDER BY
    base_ticket_price DESC
LIMIT
    2
OFFSET
    1