#!/bin/bash

# Apply database migrations
DELETE FROM for_urls WHERE timestamp < now() - interval 15 second
mysql -u root -p somedb -e "select * from for_urls"
