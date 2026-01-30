# Dynamic-Site-Content
A WordPress post with dynamic content loaded using PHP and MySQL.

## What technology was used?
I used PHP to connect to a database created in MySQL, where I retrieved each record from a table. From there, I looped through the records and built HTML structure for each item, adding classes along the way to help me style specific elements later on. 

To render my images, I used the image url in the 'src' property, allowing me to generate images dynamically from PHP code. I also had used the item name in the 'alt' attribute to ensure proper accessibility on my post's webpage.
