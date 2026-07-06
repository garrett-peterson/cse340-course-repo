CREATE TABLE projects (
	project_id SERIAL PRIMARY KEY,
	organization_id INTEGER, 
	FOREIGN KEY (organization_id) REFERENCES organization (organization_id),
	project_title VARCHAR(255),
	description VARCHAR(255),
	project_location VARCHAR(255),
	project_date DATE
);

INSERT INTO projects (
    organization_id,
    project_title,
    description,
    project_location,
    project_date
)
VALUES
-- BrightFuture Builders projects
(1, 'Community Garden Build', 'Help build raised garden beds for a local neighborhood garden.', 'Springfield Community Center', '2026-03-15'),
(1, 'Park Cleanup Day', 'Remove litter, rake leaves, and improve walking paths at a public park.', 'Riverside Park', '2026-04-05'),
(1, 'Affordable Housing Painting', 'Assist with painting and basic cleanup for affordable housing units.', 'Oak Street Housing Complex', '2026-05-10'),
(1, 'School Supply Drive', 'Collect and organize school supplies for students in need.', 'BrightFuture Office', '2026-06-01'),
(1, 'Playground Repair Project', 'Help repair and repaint playground equipment for a local school.', 'Lincoln Elementary School', '2026-07-12'),

-- GreenHarvest Growers projects
(2, 'Neighborhood Food Pantry Support', 'Sort, package, and distribute donated food to local families.', 'GreenHarvest Food Pantry', '2026-03-22'),
(2, 'Urban Farm Planting Day', 'Plant vegetables and herbs for a community-supported urban farm.', 'Downtown Urban Farm', '2026-04-18'),
(2, 'Composting Workshop Setup', 'Help prepare materials and assist attendees during a composting workshop.', 'GreenHarvest Learning Center', '2026-05-03'),
(2, 'Farmers Market Volunteer Shift', 'Assist vendors and help distribute educational materials at the farmers market.', 'Main Street Farmers Market', '2026-06-14'),
(2, 'Food Sustainability Outreach', 'Share food sustainability resources with local residents.', 'Westside Community Hall', '2026-07-20'),

-- UnityServe Volunteers projects
(3, 'Senior Center Game Night', 'Help set up and run a social game night for senior residents.', 'Maple Grove Senior Center', '2026-03-28'),
(3, 'Charity Fun Run Support', 'Assist with registration, water stations, and cleanup for a charity run.', 'City Sports Complex', '2026-04-26'),
(3, 'Clothing Donation Sorting', 'Sort and organize donated clothing for distribution.', 'UnityServe Donation Center', '2026-05-17'),
(3, 'Community Meal Service', 'Help prepare and serve meals to community members in need.', 'Hope Community Kitchen', '2026-06-21'),
(3, 'Library Reading Buddy Program', 'Read with children and help support literacy activities.', 'Northside Public Library', '2026-07-26');
