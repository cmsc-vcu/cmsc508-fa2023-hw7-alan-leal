# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;

SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id int,
    skill_name varchar(255) NOT NULL,
    description varchar(4096) NOT NULL,
    tag varchar(255) NOT NULL,
    url varchar(255),
    time_commitment varchar(255),
    PRIMARY KEY (skills_id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_id, skill_name, description, tag, url, time_commitment) VALUES
 (1, 'Data Analysis', 'Unraveling insights from raw data to make informed decisions.', 'Skill 1', 'https://www.linkedin.com/learning/paths/explore-a-career-in-data-analysis?u=76209018', 'NULL'),
 (2,'Stick Juggling','Manipulating one stick("baton"), between two other sticks held in each hand','Skill 2','NULL','~6hrs'),
 (3,'Object-Oriented Programming (Java)','Exhibits a style of programming characterized around data, or objects, rather than functions and logic','Skill 3','https://www.linkedin.com/learning/java-object-oriented-programming-2?u=76209018','~2hrs'),
 (4,'Building (FortniteBR)','Masterful building style and utilization of advanced techniques associated with the building aspect within the video game title, Fortnite Battle Royale','Skill 4','https://shorturl.at/stw13','~183hrs'),
 (5,'Figma','Utilizing cloud-base design tool, Figma, to create, share, and test designs for a multitude of applications','Skill 5','https://www.linkedin.com/learning/figma-essential-training-the-basics?u=76209018','~1hr40min'),
 (6,'LLM Fine-Tuning','Experienced with fine-tuning language models such as GPT 3.5 and LlaMa-2 for a variety of specific use cases','Skill 6','https://www.deeplearning.ai/short-courses/finetuning-large-language-models/','expected: 12/15/2023'),
 (7,'Spanish (Conversational)','Possesses an aptitude in speaking in a well-mannered fashion with other Spanish speakers','Skill 7','https://www.myparents.com','~23yrs'),
 (8,'Web Development','Highly experienced in developing web applications, coupled with both front-end and back-end proficiency. Knowledgable with using external libaries such as React and Django, ','Skill 8','https://www.linkedin.com/learning/paths/become-a-full-stack-web-developer?u=76209018','~29hrs');

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int,
    people_first_name varchar(255),
    people_last_name varchar(255) NOT NULL,
    email varchar(255),
    linkedin_url varchar(4060),
    headshot_url varchar(4060),
    discord_handle varchar(255),
    brief_bio varchar(4060),
    date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, people_first_name, people_last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) VALUES 
 (1, 'Tyler', 'Person 1', 'p1tyler@gmail.com', 'https://www.linkedin.com/in/tyler-person-1/', 'https://www.example.com/tyler_headshot', 'p1tyler#0001', 'Hello,I am an ex-professional esports athlete.', '2021-10-12'),
 (2, 'Alexa', 'Person 2', 'p2alexa@gmail.com', 'NULL', 'https://www.example.com/alexa_headshot', 'p2alexa#1234', 'I am a tech enthusiast and cat lover. Lets code!', '2022-01-15'),
 (3, 'Charlie', 'Person 3', 'p3charlie@gmail.com', 'https://www.linkedin.com/in/charlie-person-3/', 'https://www.example.com/charlie_headshot', 'p3charlie#5678', 'Passionate about sustainable living and coding.', '2022-05-20'),
 (4, 'Dexter', 'Person 4', 'p4dexter@gmail.com', 'https://www.linkedin.com/in/dexter-person-4/', 'https://www.example.com/dexter_headshot', 'p4dexter#9101', 'A coding ninja by day, gourmet chef by night.', '2022-09-08'),
 (5, 'Ella', 'Person 5', 'p5ella@gmail.com', 'NULL', 'https://www.example.com/ella_headshot', 'p5ella#1212', 'Bringing creativity to coding and design.', '2022-11-01'),
 (6, 'Finn', 'Person 6', 'p6finn@gmail.com', 'https://www.linkedin.com/in/finn-person-6/', 'https://www.example.com/finn_headshot', 'p6finn#2020', 'Web developer by day, stargazer by night.', '2023-02-14'),
 (7, 'Grace', 'Person 7', 'p7grace@gmail.com', 'https://www.linkedin.com/in/grace-person-7/', 'NULL', 'p7grace#3030', 'Passionate about user experience and storytelling.', '2023-04-30'),
 (8, 'Harvey', 'Person 8', 'p8harvey@gmail.com', 'https://www.linkedin.com/in/harvey-person-8/', 'https://www.example.com/harvey_headshot', 'p8harvey#4040', 'NULL', '2023-06-18'),
 (9, 'Ivy', 'Person 9', 'p9ivy@gmail.com', 'https://www.linkedin.com/in/ivy-person-9/', 'https://www.example.com/ivy_headshot', 'p9ivy#5050', 'Code, coffee, and a touch of mischief.', '2023-08-25'),
 (10, 'Jack', 'Person 10', 'p10jack@gmail.com', 'https://www.linkedin.com/in/jack-person-10/', 'https://www.example.com/jack_headshot', 'NULL', 'On a mission to make coding fun for everyone!', '2023-10-10');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    peopleskills_id int AUTO_INCREMENT,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date NOT NULL,
    PRIMARY KEY (peopleskills_id),
    FOREIGN KEY (skills_id) REFERENCES skills(skills_id) ON DELETE CASCADE,
    FOREIGN KEY (people_id) REFERENCES people(people_id) ON DELETE CASCADE
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
 (1, 1, '2021-10-12'),
 (3, 1, '2022-05-24'),
 (6, 1, '2023-08-25'),

 (3, 2, '2022-01-15'),
 (4, 2, '2022-06-17'),
 (5, 2, '2023-03-20'),

 (1, 3, '2022-05-20'),
 (5, 3, '2022-08-03'),

 (3, 5, '2022-11-01'),
 (6, 5, '2023-12-08'),

 (2, 6, '2023-02-14'),
 (3, 6, '2023-05-20'),
 (4, 6, '2023-09-04'),

 (3, 7, '2023-04-30'),
 (5, 7, '2022-09-01'),
 (6, 7, '2022-09-15'),
 
 (1, 8, '2022-06-18'),
 (3, 8, '2022-10-01'),
 (5, 8, '2022-10-15'),
 (6, 8, '2023-11-01'),

 (2, 9, '2022-12-01'),
 (5, 9, '2022-12-15'),
 (6, 9, '2023-01-01'),

 (1, 10, '2023-02-01'),
 (4, 10, '2023-02-15'),
 (5, 10, '2023-03-01');
 

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    roles_id int,
    role_name varchar(255),
    sort_priority int,
    PRIMARY KEY (roles_id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (roles_id, role_name, sort_priority) VALUES
 (1, 'Designer', 10),
 (2, 'Developer', 20),
 (3, 'Recruit', 30),
 (4, 'Team Lead', 40),
 (5, 'Boss', 50),
 (6, 'Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id int AUTO_INCREMENT,
    people_id int NOT NULL,
    roles_id int NOT NULL,
    date_assigned date NOT NULL,
    PRIMARY KEY (peopleroles_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id) ON DELETE CASCADE,
    FOREIGN KEY (roles_id) REFERENCES roles(roles_id) ON DELETE CASCADE
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, roles_id, date_assigned) VALUES
 (1, 2, '2021-10-12'),

 (2, 5, '2021-01-15'),
 (2, 6, '2022-01-01'),

 (3, 2, '2021-05-20'),
 (3, 4, '2022-09-20'),

 (4, 3, '2023-10-08'),

 (5, 3, '2023-11-01'),

 (6, 1, '2023-02-14'),
 (6, 2, '2023-02-20'),

 (7, 1, '2023-04-30'),

 (8, 1, '2022-05-18'),
 (8, 4, '2023-02-01'),

 (9, 2, '2023-08-25'),

 (10, 1, '2023-08-30'),
 (10, 2, '2023-09-05');