# Practical 6: DVWA setup (short steps)

Step 1: Start servers
Open XAMPP and click Start for Apache and MySQL.

Step 2: Get DVWA into htdocs
Download DVWA from GitHub and extract the zip.
Open DVWA-master, where you'll find another DVWA-master folder inside. Rename the inner folder to dvwa.
Copy that dvwa folder to C:\xampp\htdocs.

Step 3: Fix the config file
In the browser, open localhost/DVWA.
Go to dvwa\config, rename config.inc.php.dist to config.inc.php (remove .dist).
Open localhost/DVWA/login.php, and you will get access denied. This is expected.
Open config.inc.php in Notepad and copy the database user and password. The server is 127.0.0.1 and the port is 3306.

Step 4: Create the database
In XAMPP, click Admin next to MySQL (this opens phpMyAdmin).
Click New, enter the database name dvwa, and create it.
Go to Privileges, then Add user account.
Enter the copied username and password.
Tick Grant all privileges on database dvwa.
Click Go.

Step 5: Create DVWA tables
Open localhost/dvwa/login.php.
Click Create / Reset Database.
Go back to the login page and log in with username admin and password password.

Step 6: Fix the red warnings
In XAMPP, click Config next to Apache and choose php.ini.
Search allow_url_include and set it to On.
Search gd and remove the semicolon from the start of extension=gd.
Save the file, then Stop and Start Apache.

Step 7: Set the security level
In DVWA, go to DVWA Security.
Change the level from Impossible to Low.
Click Submit.

Step 8: Reflected XSS attack
Make sure the DVWA security level is Low.
In the left menu, click XSS (Reflected).
In the "What's your name?" box, type this payload: <script>alert('xss')</script>
Click Submit.
A pop-up alert box showing xss appears. This is the output, so take a screenshot of it.

Why it works (for viva)
The page takes your input and reflects it back in the response without filtering or sanitizing it. The browser treats your input as real code and executes the script. It's called "reflected" because the script isn't stored. It runs only from the request you send, for example through a crafted link.

Viva points
XSS (Cross-Site Scripting) is injecting malicious JavaScript into a web page that other users view.
Reflected XSS is non-persistent and the payload comes from the request or URL. Stored XSS is saved in the database and affects every visitor.
Impact: stealing cookies and sessions, redirecting users, and defacing pages.
Prevention: input validation, output encoding, and Content Security Policy (CSP).
Security level Low has no protection. At Impossible, the payload would be blocked or shown as plain text.

Memory trick
Start, Place, Rename, Database, Reset, Fix php.ini, Low, XSS.
