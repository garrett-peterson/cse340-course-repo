-- Organization --
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    contact_email VARCHAR(255),
    logo_filename VARCHAR(255)
);

INSERT INTO organization (
    name,
    description,
    contact_email,
    logo_filename
)
VALUES
(
    'BrightFuture Builders',
    'A nonprofit focused on improving community infrastructure through sustainable construction projects.',
    'info@brightfuturebuilders.org',
    'brightfuture-logo.png'
),
(
    'GreenHarvest Growers',
    'An urban farming collective promoting food sustainability and education in local neighborhoods.',
    'contact@greenharvest.org',
    'greenharvest-logo.png'
),
(
    'UnityServe Volunteers',
    'A volunteer coordination group supporting local charities and service initiatives.',
    'hello@unityserve.org',
    'unityserve-logo.png'
);

-- Projects --
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

-- Categroies --
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE project_categories (
    project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,

    PRIMARY KEY (project_id, category_id),

    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO categories (category_name)
VALUES
('Community Improvement'),
('Food Support'),
('Education'),
('Environment'),
('Senior Support');

INSERT INTO project_categories (project_id, category_id)
VALUES
-- BrightFuture Builders
(1, 1),
(1, 4),
(2, 1),
(3, 1),
(4, 3),
(5, 1),

-- GreenHarvest Growers
(6, 2),
(7, 4),
(8, 4),
(9, 2),
(10, 4),

-- UnityServe Volunteers
(11, 5),
(12, 1),
(13, 1),
(14, 2),
(15, 3);

-- Create Roles table
CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL UNIQUE
);

-- Insert default roles
INSERT INTO roles (role_name)
VALUES
('user'),
('admin');

-- Create Users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_users_role
        FOREIGN KEY (role_id)
        REFERENCES roles(role_id)
);