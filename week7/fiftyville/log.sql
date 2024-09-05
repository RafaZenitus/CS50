-- Keep a log of any SQL queries you execute as you solve the mystery.

Crime report: SELECT description FROM crime_scene_reports WHERE day = 28 and month = 7;

Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery.
Interviews were conducted today withthree witnesses who were present at the time –
each of their interview transcripts mentions the bakery.

Interview: SELECT transcript FROM interviews WHERE day = 28 and month = 7;

As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call,
I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow.
The thief then asked the person on the other end of the phone to purchase the flight ticket.

SELECT caller FROM phone_calls WHERE day = 28 and month = 7 and year = 2023 and duration <= 60;

        (130) 555-0289
        (499) 555-9472
        (367) 555-5533
(609) 555-5876
        (499) 555-9472
        (286) 555-6063
        (770) 555-1861
(031) 555-6622
(826) 555-1652
(338) 555-6650

SELECT full_name, id, abbreviation FROM airports WHERE city = 'Fiftyville';

 Airport Name = Fiftyville Regional Airport
 ID =  8
 Abbreviation =  CSF

SELECT destination_airport_id, hour FROM flights WHERE origin_airport_id = 8 and day = 28 and month = 7 and year = 2023;

 Destination ID = 7   hour = 17
 Destination ID = 5   hour = 13
 Destination ID = 4   hour = 20
 Destination ID = 5   hour = 17
 Destination ID = 4   hour = 16

SELECT
    p.name,
    p.phone_number,
    p.passport_number,
    b.license_plate,
    b.hour,
    b.minute,
    b.activity
FROM
    people p
JOIN
    bakery_security_logs b ON p.license_plate = b.license_plate
WHERE
    b.day = 28
    AND b.month = 7
    AND b.hour = 10
    AND b.activity = 'exit';

 +---------+----------------+-----------------+---------------+------+--------+----------+
|  name   |  phone_number  | passport_number | license_plate | hour | minute | activity |
+---------+----------------+-----------------+---------------+------+--------+----------+
| Vanessa | (725) 555-4692 | 2963008352      | 5P2BI95       | 10   | 16     | exit     |
| Bruce   | (367) 555-5533 | 5773159633      | 94KL13X       | 10   | 18     | exit     |
| Barry   | (301) 555-4174 | 7526138472      | 6P58WS2       | 10   | 18     | exit     |
| Luca    | (389) 555-5198 | 8496433585      | 4328GD8       | 10   | 19     | exit     |
| Sofia   | (130) 555-0289 | 1695452385      | G412CB7       | 10   | 20     | exit     |
| Iman    | (829) 555-5269 | 7049073643      | L93JTIZ       | 10   | 21     | exit     |
| Diana   | (770) 555-1861 | 3592750733      | 322W7JE       | 10   | 23     | exit     |
| Kelsey  | (499) 555-9472 | 8294398571      | 0NTHK55       | 10   | 23     | exit     |
| Taylor  | (286) 555-6063 | 1988161715      | 1106N58       | 10   | 35     | exit     |
+---------+----------------+-----------------+---------------+------+--------+----------+

SUS LIST: -- Based on people who phone_calls WHERE day = 28 and month = 7 and year = 2023 and duration <= 60;
| Sofia   | (130) 555-0289 | 1695452385      | G412CB7       | 10   | 20     | exit     |
| Kelsey  | (499) 555-9472 | 8294398571      | 0NTHK55       | 10   | 23     | exit     |
| Bruce   | (367) 555-5533 | 5773159633      | 94KL13X       | 10   | 18     | exit     |
| Kelsey  | (499) 555-9472 | 8294398571      | 0NTHK55       | 10   | 23     | exit     |
| Taylor  | (286) 555-6063 | 1988161715      | 1106N58       | 10   | 35     | exit     |
| Diana   | (770) 555-1861 | 3592750733      | 322W7JE       | 10   | 23     | exit     |


SUS analised: BRUCE

SELECT receiver FROM phone_calls WHERE caller = '(367) 555-5533' and day = 28 and month = 7 and year = 2023 and duration <= 60;
+----------------+
|    receiver    |
+----------------+
| (375) 555-8161 |
+----------------+

SELECT id, name, passport_number FROM people WHERE phone_number = '(375) 555-8161';

+--------+-------+-----------------+
|   id   | name  | passport_number |
+--------+-------+-----------------+
| 864400 | Robin | NULL            |
+--------+-------+-----------------+

SELECT account_number FROM bank_accounts JOIN people ON people.id = bank_accounts.person_id WHERE name = 'Robin';

+----------------+
| account_number |
+----------------+
| 94751264       |
+----------------+

SELECT atm_location, transaction_type, amount, day, month, year FROM atm_transactions WHERE account_number = 94751264;

+----------------------+------------------+--------+-----+-------+------+
|     atm_location     | transaction_type | amount | day | month | year |
+----------------------+------------------+--------+-----+-------+------+
| Daboin Sanchez Drive | withdraw         | 25     | 26  | 7     | 2023 |
| Carvalho Road        | deposit          | 55     | 27  | 7     | 2023 |
| Blumberg Boulevard   | deposit          | 90     | 29  | 7     | 2023 |
| Daboin Sanchez Drive | deposit          | 10     | 30  | 7     | 2023 |
| Leggett Street       | withdraw         | 10     | 30  | 7     | 2023 |
| Humphrey Lane        | deposit          | 15     | 30  | 7     | 2023 |
| Carvalho Road        | deposit          | 100    | 31  | 7     | 2023 |
| Carvalho Road        | withdraw         | 35     | 31  | 7     | 2023 |
| Daboin Sanchez Drive | deposit          | 40     | 1   | 8     | 2023 |
| Blumberg Boulevard   | withdraw         | 5      | 1   | 8     | 2023 |
| Humphrey Lane        | withdraw         | 40     | 1   | 8     | 2023 |
+----------------------+------------------+--------+-----+-------+------+

SELECT flight_id FROM passengers WHERE passport_number = 5773159633;

+-----------+
| flight_id |
+-----------+
| 36        |
+-----------+

SELECT origin_airport_id, destination_airport_id, day, month, year FROM flights WHERE id = 36;

+-------------------+------------------------+-----+-------+------+
| origin_airport_id | destination_airport_id | day | month | year |
+-------------------+------------------------+-----+-------+------+
| 8                 | 4                      | 29  | 7     | 2023 |
+-------------------+------------------------+-----+-------+------+


SELECT city FROM airports WHERE id = 4;

+---------------+
|     city      |
+---------------+
| New York City |
+---------------+
