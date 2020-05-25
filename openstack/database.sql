== Database
On your database server, create the {service} database and user:

----
CREATE DATABASE {service};
GRANT ALL PRIVILEGES ON {service}.* TO '{service}'@'%' IDENTIFIED BY '<password>';
FLUSH PRIVILEGES;
----
