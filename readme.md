Divvy is a bike sharing program in Chicago, Illinois USA that allows riders to purchase a pass at a kiosk or use a mobile application to unlock a bike at stations around the city and use the bike for a specified amount of time. The bikes can be returned to the same station or to another station. The City of Chicago makes the anonymized bike trip data publicly available for projects like this where we can analyze the data.

The goal of this project is to develop a data warehouse solution using Azure Synapse Analytics. It involved:

* Designing a star schema based on the business outcomes listed below;
* Importing the data into Synapse;
* Transforming the data into the star schema;
* and finally, viewing the reports from Analytics.



## Challenges
1. Initially, setting up data source for copy task could not connect to postgres database with error `no pg_hba.conf entry for host "4X.XXX.XX.XXX", user "userXXX", database "dbXXX"`. It was resolved by enabling encryption.