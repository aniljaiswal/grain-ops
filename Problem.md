Slight typo on Step 1, "Generate Multile Order" is suppose to be "Generate 
Multiple Order Delivery", and "4 locations" is also a typo of the 5 locations 
provided on the cover page.

Problem:_ _We want to show our customers where our delivery couriers are and 
how long it will take before they are reaching!

This exercise is not meant to write production ready code but to try and 
prototype and have fun trying to solve it.

Basic Requirements:

1. Build a server (in ruby or nodejs) that will be able to return set/get couriers current location (can just use Redis) 
2. Show a page with Google Maps centered at raffles place with a Pin showing the current delivery order location 
3. Click anywhere on the map to place a marker and set the current couriers location

4. When you subsequently click on the map, it should set the couriers new latitude and longitude to the point you have selected (to simulate movement)

5. Plot down the couriers movement over time as a polyline/path (where he has travelled) 
Additional requirements are attached below in the PDF.

Let me know if you have any difficulties, understanding what is required.