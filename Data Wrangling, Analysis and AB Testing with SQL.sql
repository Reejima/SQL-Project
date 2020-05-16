--Reformat the final_assignments_qa to look like the final_assignments table, filling in any missing values with a placeholder of the appropriate data type.
-- THERE ARE ONLY THREE TESTS IN THE FINAL TABLE
SELECT item_id,
       test_a AS test_assignment ,
       CASE
           WHEN test_a is not null then 'item_test_1'
       END AS test_number ,
       CASE
           WHEN test_a is not null then '2013-01-05 00:00:00'
       END AS test_start_date
FROM dsv1069.final_assignments_qa
UNION
SELECT item_id,
       test_b AS test_assignment ,
       CASE
           WHEN test_b is not null then 'item_test_2'
       END AS test_number ,
       CASE
           WHEN test_b is not null then '2013-01-05 00:00:00'
       END AS test_start_date
FROM dsv1069.final_assignments_qa
UNION
SELECT item_id,
       test_c AS test_assignment ,
       CASE
           WHEN test_c is not null then 'item_test_3'
       END AS test_number ,
       CASE
           WHEN test_c is not null then '2013-01-05 00:00:00'
       END AS test_start_date
FROM dsv1069.final_assignments_qa
ORDER BY test_number
---------------------------------------------------------------------------------------------------------------------
-- Use this table to
-- compute order_binary for the 30 day window after the test_start_date
-- for the test named item_test_2

SELECT test_assignment ,
       SUM(ORDER_BINARY) AS orders_completed_30d ,
       count(distinct item_id) AS items,
      SUM(orders)/COUNT(item_id) AS average_views_per_item
FROM
  (SELECT 
    test_events.item_id, 
    test_events.test_assignment, 
    test_events.order_date,
    test_events.test_number,
    test_events.test_date,
    count(invoice_id) as orders,
    MAX(CASE WHEN (order_date > test_events.test_date
        AND DATE_PART('day', order_date-test_date) <= 30)
        THEN 1 ELSE 0 END) AS order_binary
  FROM
  (SELECT A.item_id AS item_id,
          test_assignment,
          test_number,
          test_start_date AS test_date,
          created_at AS order_date,
          invoice_id
   FROM dsv1069.final_assignments A
   LEFT JOIN dsv1069.orders B
     ON A.item_id = B.item_id
     WHERE test_number = 'item_test_2'
    ) AS test_events
    GROUP BY test_events.item_id,
          test_events.test_assignment, 
          test_events.order_date,
          test_events.test_number,
          test_events.test_date
  ) AS ORDER_BINARY
GROUP BY test_assignment

------------------------------------------------------------------------------------------------------------------------
-- Use this table to
-- compute view_binary for the 30 day window after the test_start_date
-- for the test named item_test_2

SELECT test_assignment,
       SUM(view_binary) AS views_binary_30,
       count(distinct item_id) AS items,
	   CAST(100*SUM(view_binary)/COUNT(item_id) AS FLOAT) AS viewed_percent,
      SUM(events)/COUNT(item_id) AS average_views_per_item
FROM (
SELECT test_events.item_id,
       test_events.test_assignment,
       test_events.test_number,
       test_events.test_date,
       count(event_id) as events,
       MAX(CASE
               WHEN (event_time > test_events.test_date
                     AND DATE_PART('day', event_time-test_date) <= 30) THEN 1
               ELSE 0
           END) AS view_binary
FROM
  (SELECT assignment.item_id AS item_id,
          test_assignment,
          test_number,
          test_start_date AS test_date,
          event_time,
          event_id
   FROM dsv1069.final_assignments assignment
   LEFT JOIN
       (SELECT event_time, 
              event_id,
               CASE
                   WHEN parameter_name = 'item_id' then cast (parameter_value AS float)
                   ELSE null
               END AS item_id
      FROM dsv1069.events
      WHERE event_name = 'view_item' ) AS views
     ON assignment.item_id =views.item_id
     WHERE test_number = 'item_test_2' 
     ) AS test_events
   GROUP BY test_events.item_id,
         test_events.test_assignment,
         test_events.test_number,
       test_events.test_date
         ) AS views_binary
GROUP BY test_assignment,
  test_date
-------------------------------------------------------------------------------------------------------------------------------------------------

