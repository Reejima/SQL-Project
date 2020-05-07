# SQL_For_Data_Science
UC Davis SQL Course
Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000 
xi. user table = 10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000
ii. Hours = 1562
iii. Category = 2643
iv. Attribute = 1115 
v. Review = 10000 - ID
vi. Checkin = 493 
vii. Photo = 6493 - Business_ID
viii. Tip = 10000
ix. User = 537 - User_id
x. Friend = 11
xi. Elite_years = 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: No
	
	
	SQL code used to arrive at answer:
	SELECT COUNT(*)
	FROM user
	WHERE id IS NULL OR 
	name IS NULL OR 
	review_count IS NULL OR 
	yelping_since IS NULL OR
	useful IS NULL OR 
	funny IS NULL OR 
	cool IS NULL OR 
	fans IS NULL OR 
	average_stars IS NULL OR 
	compliment_hot IS NULL OR 
	compliment_more IS NULL OR 
	compliment_profile IS NULL OR 
	compliment_cute IS NULL OR 
	compliment_list IS NULL OR 
	compliment_note IS NULL OR 
	compliment_plain IS NULL OR 
	compliment_cool IS NULL OR 
	compliment_funny IS NULL OR 
	compliment_writer IS NULL OR 
	compliment_photos IS NULL 
	
	
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min:	1	max: 5		avg: 3.7082 
		
	
	ii. Table: Business, Column: Stars
	
		min: 1.0		max:	5.0	avg: 3.6549  
		
	
	iii. Table: Tip, Column: Likes
	
		min: 0 		max: 2		avg: 0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min: 1		max: 53		avg: 1.9414 
		
	
	v. Table: User, Column: Review_count
	
		min:0		max:2000		avg: 24.2995 
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer: 
	Select city,
	    sum(review_count) as new_count 
	FROM business
    group by city
    order by new_count desc
	
	
	Copy and Paste the Result Below:
	
+-----------------+-----------+
| city            | new_count |
+-----------------+-----------+
| Las Vegas       |     82854 |
| Phoenix         |     34503 |
| Toronto         |     24113 |
| Scottsdale      |     20614 |
| Charlotte       |     12523 |
| Henderson       |     10871 |
| Tempe           |     10504 |
| Pittsburgh      |      9798 |
| Montréal        |      9448 |
| Chandler        |      8112 |
| Mesa            |      6875 |
| Gilbert         |      6380 |
| Cleveland       |      5593 |
| Madison         |      5265 |
| Glendale        |      4406 |
| Mississauga     |      3814 |
| Edinburgh       |      2792 |
| Peoria          |      2624 |
| North Las Vegas |      2438 |
| Markham         |      2352 |
| Champaign       |      2029 |
| Stuttgart       |      1849 |
| Surprise        |      1520 |
| Lakewood        |      1465 |
| Goodyear        |      1155 |
+-----------------+-----------+
	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

SELECT SUM(review_count) AS reviews, stars
FROM Business B 
Where City = 'Avon'
Group by stars


Copy and Paste the Resulting Table Below (2 columns – star rating and count):
+---------+-------+
| reviews | stars |
+---------+-------+
|      10 |   1.5 |
|       6 |   2.5 |
|      88 |   3.5 |
|      21 |   4.0 |
|      31 |   4.5 |
|       3 |   5.0 |
+---------+-------+

ii. Beachwood

SQL code used to arrive at answer:

SELECT SUM(review_count) AS reviews, stars
FROM Business B 
Where City = 'Beachwood'
Group by stars


Copy and Paste the Resulting Table Below (2 columns – star rating and count):

+---------+-------+
| reviews | stars |
+---------+-------+
|       8 |   2.0 |
|       3 |   2.5 |
|      11 |   3.0 |
|       6 |   3.5 |
|      69 |   4.0 |
|      17 |   4.5 |
|      23 |   5.0 |
+---------+-------+

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
	Select name 
		,review_count
	FROM user
	order by review_count desc
	Limit 3
		
	Copy and Paste the Result Below:
+--------+--------------+
| name   | review_count |
+--------+--------------+
| Gerald |         2000 |
| Sara   |         1629 |
| Yuri   |         1339 |
+--------+--------------+


8. Does posing more reviews correlate with more fans? No

	Please explain your findings and interpretation of the results:
	 It seems that Sara who has 1629 reviews only has 50 fans and Christine who has much fewer reviews - 930 - has 173 fans which is more then Sara.
	 This pattern can be noted throughout the data set.

	Select name, 
	 	review_count, 
	 	fans
	FROM user
	order by review_count desc

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: Yes, there are 1780 for love and 232 for hate.

	
	SQL code used to arrive at answer: 
	select count(*) from review where text like '%love%'
	select count(*) from review where text like '%hate%'

	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	select name, 
		fans 
	from user
	order by fans desc
	limit 10 
	
	Copy and Paste the Result Below:
		+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+
	
	
11. Is there a strong relationship (or correlation) between having a high number of fans and being listed as "useful" or "funny?" Out of the top 10 users with the highest number of fans, what percent are also listed as “useful” or “funny”?

Key:
0% - 25% - Low relationship
26% - 75% - Medium relationship
76% - 100% - Strong relationship
	
	SQL code used to arrive at answer:
	select name, 
		fans, 
		useful, 
		funny   
	from user
	where (useful > 0 and funny > 0) 
	order by fans asc
	
	select name, 
		fans, 
		useful, 
		funny   
	from user
	order by fans desc
	limit 10 

	Copy and Paste the Result Below:
	+-----------+------+--------+--------+
	| name      | fans | useful |  funny |
	+-----------+------+--------+--------+
	| Amy       |  503 |   3226 |   2554 |
	| Mimi      |  497 |    257 |    138 |
	| Harald    |  311 | 122921 | 122419 |
	| Gerald    |  253 |  17524 |   2324 |
	| Christine |  173 |   4834 |   6646 |
	| Lisa      |  159 |     48 |     13 |
	| Cat       |  133 |   1062 |    672 |
	| William   |  126 |   9363 |   9361 |
	| Fran      |  124 |   9851 |   7606 |
	| Lissa     |  120 |    455 |    150 |
	+-----------+------+--------+--------+
	
	Please explain your findings and interpretation of the results:
	If I look at the overall data set and I look if the users have been listed as funny or useful, I can see that not all users have fans even if they fit the criteria. It doesn't seem that being useful or funny correlates to having more fans.
	
	In the top 10 users all users have been defined as either useful or funny so 100% of users have been listed as useful or funny. 
	

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.



i. Do the two groups you chose to analyze have a different distribution of hours?

The two groups who have 2-3.5 stars have slightly shorter hours and one business is only open 6 days a week. 

The 4.0 star business is open 7 days a week for around 10 hours every day. Do note that only 3 businesses showed up so it is not a large sample size.


SQL Code:
select name, 
	stars, 
	review_count, 
	is_open, 
	hours, 
	CATEGORY 
	from business b 
JOIN Hours h on b.id = h.business_id
Join CATEGORY C ON h.business_iD= C.business_id
where city = 'Charlotte' 
AND category = 'Shopping'


ii. Do the two groups you chose to analyze have a different number of reviews?

The two groups do have different number of reviews. The group with 2-3.5 stars has slightly more reviews than the group with 4 stars. The average number of reviews for the 2-3.5 stars is around 8 and for 4.0 stars it is 5. 

select stars, avg(review_count) from business b 
JOIN Hours h on b.id = h.business_id
Join CATEGORY C ON h.business_iD= C.business_id
where city = 'Charlotte' 
AND category = 'Shopping'
Group by stars
         
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
No, I am not since all 3 businesses have 3 different zip codes.

SQL code used for analysis:
select name, stars,  CATEGORY, postal_code from business b 
JOIN Hours h on b.id = h.business_id
Join CATEGORY C ON h.business_iD= C.business_id
where city = 'Charlotte' 
AND category = 'Shopping'
		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
         The businesses that are open have more reviews then the ones that are closed.
         
ii. Difference 2:
         The average stars for restaurants that are open are 3.785 and the ones that are closed 3.5.
         
         
SQL code used for analysis:

	SELECT   AVG(b.review_count),
			   SUM(b.review_count),
			   AVG(stars),
			   is_open
		FROM business b
		INNER JOIN Tip t on b.id = t.business_id 
		INNER JOIN User u on t.user_id = u.id 
		GROUP BY is_open
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.	

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
         I would like to predict the overall star rating for a food related business.
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
        In order to predict star rating for food related restaurants I pulled categories that dealt with food such as bakerires, restaurants, etc. And then pulled the name of a restaurant, the area that it is located, the average star rating, and total number of reviews each one recieved. The reason I pulled the area, category, and total number of reviews is to see if they have influence over how the star rating is. 

        The last item that I pulled is the attributes related to each restaurant in each category since that can drive ratings. For example, each type of restaurant may have different set of expectations that may make it successful. In the case of coffee and tea places, people are looking for ambience and WiFi where as for SeaFood places it is more about the alcohol and the ambience so if the attribute is not there for certain restaurants then the ratings could go down.	             
                  
iii. Output of your finished dataset:
+-----------------------------+----------------+------------+-------------+----------+---------+----------------------------+
| name                        | category       | city       | postal_code | avg_star | tot_rev | attributes                 |
+-----------------------------+----------------+------------+-------------+----------+---------+----------------------------+
| B.A. Sweetie Candy          | Specialty Food | Cleveland  | 44129       |      4.0 |     343 | BikeParking                |
| B.A. Sweetie Candy          | Specialty Food | Cleveland  | 44129       |      4.0 |     343 | BusinessAcceptsCreditCards |
| B.A. Sweetie Candy          | Specialty Food | Cleveland  | 44129       |      4.0 |     343 | BusinessParking            |
| B.A. Sweetie Candy          | Specialty Food | Cleveland  | 44129       |      4.0 |     343 | Caters                     |
| B.A. Sweetie Candy          | Specialty Food | Cleveland  | 44129       |      4.0 |     343 | RestaurantsPriceRange2     |
| B.A. Sweetie Candy          | Specialty Food | Cleveland  | 44129       |      4.0 |     343 | RestaurantsTakeOut         |
| Sweet Ruby Jane Confections | Specialty Food | Las Vegas  | 89123       |      4.0 |     180 | BusinessAcceptsCreditCards |
| Sweet Ruby Jane Confections | Specialty Food | Las Vegas  | 89123       |      4.0 |     180 | BusinessParking            |
| Sweet Ruby Jane Confections | Specialty Food | Las Vegas  | 89123       |      4.0 |     180 | RestaurantsPriceRange2     |
| Sweet Ruby Jane Confections | Specialty Food | Las Vegas  | 89123       |      4.0 |     180 | WheelchairAccessible       |
| The Cider Mill              | Specialty Food | Scottsdale | 85251       |      4.0 |     637 | Alcohol                    |
| The Cider Mill              | Specialty Food | Scottsdale | 85251       |      4.0 |     637 | Ambience                   |
| The Cider Mill              | Specialty Food | Scottsdale | 85251       |      4.0 |     637 | BikeParking                |
| The Cider Mill              | Specialty Food | Scottsdale | 85251       |      4.0 |     637 | BusinessAcceptsCreditCards |
| The Cider Mill              | Specialty Food | Scottsdale | 85251       |      4.0 |     637 | BusinessParking            |
| The Cider Mill              | Specialty Food | Scottsdale | 85251       |      4.0 |     637 | Caters                     |
| The Cider Mill              | Specialty Food | Scottsdale | 85251       |      4.0 |     637 | GoodForKids                |
| The Cider Mill              | Specialty Food | Scottsdale | 85251       |      4.0 |     637 | GoodForMeal                |
| The Cider Mill              | Specialty Food | Scottsdale | 85251       |      4.0 |     637 | HasTV                      |
| The Cider Mill              | Specialty Food | Scottsdale | 85251       |      4.0 |     637 | NoiseLevel                 |
| The Cider Mill              | Specialty Food | Scottsdale | 85251       |      4.0 |     637 | OutdoorSeating             |
| The Cider Mill              | Specialty Food | Scottsdale | 85251       |      4.0 |     637 | RestaurantsAttire          |
| The Cider Mill              | Specialty Food | Scottsdale | 85251       |      4.0 |     637 | RestaurantsDelivery        |
| The Cider Mill              | Specialty Food | Scottsdale | 85251       |      4.0 |     637 | RestaurantsGoodForGroups   |
| The Cider Mill              | Specialty Food | Scottsdale | 85251       |      4.0 |     637 | RestaurantsPriceRange2     |
+-----------------------------+----------------+------------+-------------+----------+---------+----------------------------+
iv. Provide the SQL code you used to create your final dataset:
	
	Select distinct b.name, 
		category, 
		city, 
		postal_code, 
		avg(stars) as avg_star, 
		sum(review_count) as tot_rev,  
		A.name AS attributes
	FROM business b
	INNER JOIN hours h on b.id = h.business_id
	INNER JOIN Category c on b.id = c.business_id
	INNER JOIN attribute a on b.id = a.business_id
	where category  like '%food%' or category  like '%restaurant%' or category like '%fusion%' or category  like '%sandwiches%' or category like '%coffee%' or category  like '%bakeries%'
	Group By b.name, category, city, postal_code, A.name
	ORDER BY category desc
	
