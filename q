Step 1: Set up DVWA
Extract the DVWA zip file.
Copy the folder to C:\xampp\htdocs.
Rename the folder to DVWA.
Go into the config folder and rename config.inc.php.dist to config.inc.php.

Step 2: Open DVWA
Open Chrome and go to localhost/DVWA.
Click Create/Reset Database, then click Login.

Step 3: SQL injection on DVWA
Go to the SQL Injection page.
In the User ID box, type 1 and submit. Normal result for one user comes up.
Now type 1' or '1'='1'-- # and submit. This bypasses the query logic and returns all users' data, not just one.

Step 4: SQL injection on testfire.net (login bypass)
Go to http://testfire.net/login.jsp
Try username admin and password admin first, to see a normal login attempt.
Now type username as ' OR 1=1-- and any text as password, then submit.
You are logged in as admin without knowing the real password. This proves the login query was bypassed.
