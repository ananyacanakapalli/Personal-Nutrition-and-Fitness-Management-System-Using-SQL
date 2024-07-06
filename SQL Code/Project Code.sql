DROP DATABASE IF EXISTS Nutrition_System_Team_11;
CREATE DATABASE IF NOT EXISTS Nutrition_System_Team_11;
USE Nutrition_System_Team_11;

-- creating a user table that stores all the user data.
DROP TABLE IF EXISTS Users_T1;
CREATE TABLE Users_T1(
	User_id_pk INT         PRIMARY KEY   AUTO_INCREMENT,
    Ufname     VARCHAR(20) DEFAULT '',
    Ulname     VARCHAR(20) DEFAULT '',
	Age        INT         DEFAULT 18,
	Sex	       CHAR(2),
    Weight     INT         DEFAULT 45,
    Height_cm  INT         DEFAULT 100,     
	Diet_rest  VARCHAR(20),
	Allergies  VARCHAR(20),
    Contact    BIGINT      DEFAULT 0000000000);
INSERT INTO Users_T1 (Ufname, Ulname, Age, Sex, Weight, Height_cm, Diet_rest, Allergies, Contact) VALUES
('Alice', 'Johnson', 25, 'F', 55, 160, 'Vegetarian', 'None', 9876543210),
('Bob', 'Smith', 32, 'M', 75, 180, 'Low Carb', 'Peanuts', 9871234567),
('Carol', 'Williams', 28, 'F', 60, 165, 'Vegan', 'Lactose', 9458745215),
('David', 'Lee', 35, 'M', 80, 175, 'Keto', 'Shellfish', 8548745215),
('Emma', 'Brown', 22, 'F', 50, 155, 'Keto', 'None', 7458745125),
('Frank', 'Martinez', 40, 'M', 90, 185, 'Vegan', 'Soy', 9254785465),
('Grace', 'Garcia', 30, 'F', 70, 170, 'Non Vegetarian', 'Gluten', 7485965231),
('Hank', 'Rodriguez', 29, 'M', 78, 178, 'Vegetarian', 'Peanuts', 6985471256),
('Ivy', 'Perez', 33, 'F', 63, 162, 'Vegan', 'Lactose', 9584621452),
('Jack', 'Hernandez', 36, 'M', 85, 180, 'Keto', 'Shellfish', 2844521458),
('Katie', 'Doe', 27, 'F', 58, 168, 'Non Vegetarian', 'Soy', 7785412552),
('Leo', 'Moore', 23, 'M', 68, 176, 'Low Carb', 'Gluten', 7458456325),
('Mia', 'Taylor', 31, 'F', 61, 161, 'Non Vegetarian', 'Peanuts', 4587452635),
('Noah', 'Johnson', 26, 'M', 73, 183, 'Vegetarian', 'Lactose', 7856985632),
('Olivia', 'White', 29, 'F', 66, 170, 'Vegan', 'None', 4587458966);

-- creating a trainers table that stores all the trainer info along with their certification and specilisation
DROP TABLE IF EXISTS Trainers_T2;
CREATE TABLE Trainers_T2(
	trainer_id_pk INT         PRIMARY KEY AUTO_INCREMENT,
    tfname        VARCHAR(25) DEFAULT '',
    tlname        VARCHAR(25) DEFAULT '',
    sex           CHAR(2)     DEFAULT 'M',
    certification VARCHAR(20),
    specilisation VARCHAR(20),
    contact       BIGINT         DEFAULT 0000000000 );
INSERT INTO Trainers_T2 (tfname, tlname, sex, certification, specilisation, contact) VALUES
('Anna', 'Smith', 'F', 'Trainer', 'Gym', '9876543210'),
('John', 'Doe', 'M', 'Fitness', 'Cardio', '9871234567'),
('Laura', 'Johnson', 'F', 'Nutritionist', 'Diet', '4587965824'),
('Michael', 'Brown', 'M', 'Fitness', 'Yoga', '8546321578'),
('Sophia', 'Garcia', 'F', 'Fitness', 'Cardio', '9856321547'),
('David', 'Martinez', 'M', 'Fitness', 'Gym', '7854698523'),
('Olivia', 'Rodriguez', 'F', 'Nutritionist', 'Diet', '6854785952'),
('Daniel', 'Lee', 'M', 'Fitness', 'Yoga', '4587452122'),
('Emma', 'Hernandez', 'F', 'Fitness', 'Gym', '9965887452'),
('Liam', 'Perez', 'M', 'Fitness', 'Cardio', '2015458788');

-- creating table sessions that holds the session details of the user and trainer and the type of session (personal/ virtual) along with the date and time
DROP TABLE IF EXISTS Sessions_T3;
CREATE TABLE Sessions_T3(
	session_id_cpk INT PRIMARY KEY AUTO_INCREMENT,
    user_id_fk    INT ,
    session_type  VARCHAR(3) DEFAULT 'V', -- v denotes virtual and p denotes personal 
    session_date  DATE,
    duration      INT , 
    trainer_id_fk INT ,
    rating        INT ,
    FOREIGN KEY (user_id_fk) REFERENCES Users_T1(user_id_pk),
    FOREIGN KEY (trainer_id_fk) REFERENCES Trainers_T2(trainer_id_pk) ON DELETE CASCADE
    );
INSERT INTO Sessions_T3 (user_id_fk, session_type, session_date, duration, trainer_id_fk, rating)
VALUES
(1, 'V', '2023-10-23', 60, 1, 5),(3, 'P', '2023-10-24', 30, 2, 4),(7, 'V', '2023-10-25', 45, 3, 3),(5, 'P', '2023-10-26', 60, 5, 5),(8, 'V', '2023-10-27', 30, 7, 4),
(10, 'P', '2023-10-28', 45,9, 3),(2, 'V', '2023-10-29', 60, 10, 5),(1, 'P', '2023-10-30', 30, 3, 4),(3, 'V', '2023-10-31', 45, 2, 3),(12, 'P', '2023-11-01', 60, 4, 5),
(15, 'V', '2023-11-02', 30, 6, 4),(13, 'P', '2023-11-03', 45, 8, 3),(4, 'V', '2023-11-04', 60, 10, 5),(7, 'P', '2023-11-05', 30, 10, 4),(10, 'V', '2023-11-06', 45, 8, 3);
  
-- The Progress Log table is structured to store detailed logs of users' fitness activities. Key data points include the date of the workout, duration, 
-- calories burned, and attendance status, along with additional notes for each session. The table is uniquely identified by the Progress ID (primary key) 
-- and is linked to specific users through the User ID (foreign key). This table not only tracks individual progress but also provides valuable insights 
-- for personalized fitness recommendations and program adjustments.
DROP TABLE IF EXISTS Progress_Log_T4;
CREATE TABLE Progress_Log_T4 (
    Progress_id_pk      INT PRIMARY KEY AUTO_INCREMENT,
    User_id_fk          INT,
    Date                DATE,
    Workout_duration    INT,
    Calories_burned     INT,
    Attendance          BOOLEAN,
    Notes               TEXT,
    FOREIGN KEY (User_id_fk) REFERENCES Users_T1(User_id_pk)
);
INSERT INTO Progress_Log_T4 (User_id_fk, Date, Workout_duration, Calories_burned, Attendance, Notes) VALUES (4, '2023-09-22', 46, 565, 1, 'Sample note 1. Stay hydrated and maintain a balanced diet for optimal results.'),
(3, '2023-09-23', 52, 453, 1, 'Sample note 2. Consistency is key; make exercise a daily habit.'),
(4, '2023-09-26', 104, 739, 1, 'Sample note 3. Proper warm-up and cool-down routines prevent injuries.'),
(1, '2023-10-10', 81, 403, 1, 'Sample note 4. Incorporate both strength and cardio in your fitness routine.'),
(4, '2023-09-29', 84, 503, 1, 'Sample note 5. Listen to your body; avoid overexertion.'),
(1, '2023-10-05', 106, 782, 1, 'Sample note 6. Focus on exercise quality over quantity.'),
(1, '2023-10-19', 114, 252, 1, 'Sample note 7. Rest days are essential for muscle recovery.'),
(5, '2023-10-03', 60, 493, 1, 'Sample note 8. Vary your routine to keep your workouts interesting.'),
(2, '2023-10-01', 32, 226, 1, 'Sample note 9. Mental wellness is as important as physical fitness.'),
(1, '2023-10-04', 108, 386, 1, 'Sample note 10. Consult professionals if new to exercise.');

-- This table is designed to store personalized nutrition plans for users. Each plan includes a unique Plan ID, a link to the user's ID, 
-- recommended daily calorie intake, macronutrient targets, meal schedules, and associated recipes. The foreign key (UserID_fk) 
-- connects each nutrition plan to a specific user in the Users_T1 table,ensuring that each plan is tailored to individual dietary requirements and goals.
DROP TABLE IF EXISTS NutritionPlan_T5;
CREATE TABLE IF NOT EXISTS NutritionPlan_T5 (
    PlanID_pk INT PRIMARY KEY,
    UserID_fk INT,
    RecommendedCalorieIntake DECIMAL(6,2) NOT NULL,
    MacronutrientTargets VARCHAR(100),
    MealSchedule VARCHAR(100),
    Recipes TEXT,
    FOREIGN KEY (UserID_fk) REFERENCES users_t1(user_id_pk)
);
INSERT INTO NutritionPlan_T5 (PlanID_pk, UserID_fk, RecommendedCalorieIntake, MacronutrientTargets, MealSchedule, Recipes) VALUES
(1, 1, 2000, 'Carbs: 50%, Protein: 30%, Fats: 20%', 'breakfast, lunch, dinner, snacks', '1,2,3'),
(2, 2, 2500, 'Carbs: 45%, Protein: 35%, Fats: 20%', 'breakfast, lunch, dinner', '4,5,6'),
(3, 3, 2100, 'Carbs: 50%, Protein: 25%, Fats: 25%', 'breakfast, lunch, dinner', '7,8,9'),(4, 4, 1800, 'Carbs: 40%, Protein: 30%, Fats: 30%', 'breakfast, lunch, dinner, snacks', '10,11,12'),
(5, 5, 2400, 'Carbs: 45%, Protein: 30%, Fats: 25%', 'breakfast, lunch, dinner', '13,14,15'),
(6, 6, 2300, 'Carbs: 50%, Protein: 28%, Fats: 22%', 'breakfast, lunch, dinner, snacks', '16,17,18'),
(7, 7, 2150, 'Carbs: 48%, Protein: 27%, Fats: 25%', 'breakfast, lunch, dinner', '19,20,21'),
(8, 8, 1950, 'Carbs: 42%, Protein: 32%, Fats: 26%', 'breakfast, lunch, dinner, snacks', '22,23,24'),
(9, 9, 2200, 'Carbs: 46%, Protein: 29%, Fats: 25%', 'breakfast, lunch, dinner', '25,26,27'),
(10, 10, 2000, 'Carbs: 43%, Protein: 31%, Fats: 26%', 'breakfast, lunch, dinner, snacks', '28,29,30');

-- This table serves as a repository for various recipes. Each record includes a unique Recipe ID, the name of the recipe, 
-- a list of ingredients, preparation instructions, and nutritional information. This table can be utilized in conjunction with the NutritionPlan_T5 
-- table to provide users with specific recipes that match their nutritional plans and dietary preferences.
DROP TABLE IF EXISTS Recipe_T6;
CREATE TABLE IF NOT EXISTS Recipe_T6 (
    RecipeID_pk INT PRIMARY KEY,
    RecipeName VARCHAR(100) NOT NULL,
    Ingredients TEXT NOT NULL,
    PreparationInstructions TEXT NOT NULL,
    NutritionalInformation VARCHAR(255)
);
INSERT INTO Recipe_T6 (RecipeID_pk, RecipeName, Ingredients, PreparationInstructions, NutritionalInformation) VALUES
(1, 'Veggie Stir Fry', 'Bell Peppers, Broccoli, Carrots', 'Saute in a pan with olive oil for 10 minutes', 'Calories: 150, Carbs: 20g, Protein: 5g'),
(2, 'Chicken Salad', 'Chicken, Lettuce, Tomatoes', 'Mix ingredients and add dressing of choice', 'Calories: 250, Carbs: 10g, Protein: 30g'),
(3, 'Quinoa Bowl', 'Quinoa, Avocado, Black Beans', 'Cook quinoa and mix with other ingredients', 'Calories: 300, Carbs: 45g, Protein: 15g'),
(4, 'Spaghetti Carbonara', 'Spaghetti, Eggs, Pancetta, Parmesan Cheese', 'Boil pasta. Mix with egg and cheese. Add cooked pancetta.', 'Calories: 400, Carbs: 55g, Protein: 20g'),
(5, 'Vegan Buddha Bowl', 'Chickpeas, Spinach, Quinoa, Avocado', 'Mix cooked quinoa with roasted chickpeas, fresh spinach, and avocado slices.', 'Calories: 320, Carbs: 50g, Protein: 15g'),
(6, 'Tofu Stir Fry', 'Tofu, Snow Peas, Red Bell Pepper, Soy Sauce', 'Saute tofu until browned. Add veggies and stir-fry with soy sauce.', 'Calories: 280, Carbs: 30g, Protein: 25g'),
(7, 'Beef Steak', 'Beef, Salt, Black Pepper, Olive Oil', 'Season beef with salt and pepper. Sear on a hot pan with olive oil.', 'Calories: 500, Carbs: 0g, Protein: 40g'),
(8, 'Mango Smoothie', 'Mango, Greek Yogurt, Honey', 'Blend mango with Greek yogurt and a spoon of honey.', 'Calories: 210, Carbs: 45g, Protein: 10g'),
(9, 'Caesar Salad', 'Romaine Lettuce, Caesar Dressing, Croutons', 'Mix lettuce with dressing. Top with croutons.', 'Calories: 180, Carbs: 20g, Protein: 5g'),
(10, 'Avocado Toast', 'Bread, Avocado, Salt, Red Pepper Flakes', 'Mash avocado on toasted bread. Season with salt and red pepper flakes.', 'Calories: 250, Carbs: 30g, Protein: 8g');

-- The ExercisePlan_T7 table outlines individualized workout plans for users. It includes details like the plan ID, user ID, type of workout 
-- duration of workouts, recommended frequency, difficulty level, and specific exercises. The user ID acts as a foreign key linking the exercise 
-- plans to the corresponding user profiles in the Users_T1 table. This ensures that each exercise plan is customized to the user’s fitness level and goals.
DROP TABLE IF EXISTS ExercisePlan_T7;
CREATE TABLE IF NOT EXISTS ExercisePlan_T7 (
    PlanID_pk INT PRIMARY KEY,
    UserID_fk INT,
    WorkoutType ENUM('cardio', 'strength training', 'flexibility') NOT NULL,
    WorkoutDuration DECIMAL(5,2) NOT NULL,
    RecommendedFrequency INT NOT NULL,
    DifficultyLevel VARCHAR(50),
    Exercises TEXT,
    FOREIGN KEY (UserID_fk) REFERENCES users_t1(user_id_pk)
);
INSERT INTO ExercisePlan_T7 (PlanID_pk, UserID_fk, WorkoutType, WorkoutDuration, RecommendedFrequency, DifficultyLevel, Exercises) VALUES
(1, 1, 'cardio', 30, 5, 'Medium', '1,2'),
(2, 2, 'strength training', 45, 4, 'High', '3,4'),
(3, 3, 'flexibility', 20, 7, 'Low', '5,6'),(4, 4, 'cardio', 40, 3, 'High', '7,8'),
(5, 5, 'strength training', 60, 5, 'Medium', '9,10'),
(6, 6, 'flexibility', 25, 6, 'Low', '11,12'),
(7, 7, 'cardio', 20, 4, 'Low', '13,14'),
(8, 8, 'strength training', 50, 2, 'High', '15,16'),
(9, 9, 'flexibility', 30, 7, 'Medium', '17,18'),
(10, 10, 'cardio', 35, 5, 'Medium', '19,20');

-- This table is dedicated to tracking the fitness goals of users. It includes a Goal ID, user ID, type of goal, the target date for achieving 
-- the goal, and a field for tracking progress. The user ID connects these goals to individual user profiles in the Users_T1 table, allowing 
-- for a personalized approach to goal setting and progress tracking in fitness.
DROP TABLE IF EXISTS FitnessGoals_T8;
CREATE TABLE IF NOT EXISTS FitnessGoals_T8 (
    GoalID_pk INT PRIMARY KEY AUTO_INCREMENT,
    UserID_fk INT,
    GoalType VARCHAR(100) NOT NULL,
    TargetAchievementDate DATE NOT NULL,
    ProgressTracking TEXT,
    FOREIGN KEY (UserID_fk) REFERENCES users_t1(user_id_pk)
);
INSERT INTO FitnessGoals_T8 (GoalID_pk, UserID_fk, GoalType, TargetAchievementDate, ProgressTracking) VALUES
(1, 1, 'Run a marathon', '2023-12-18', 'Training for 10 kilometers currently'),
(2, 2, 'Bench press 100kg', '2023-11-15', 'Currently benching 80kg'),
(3, 3, 'Daily yoga for a month', '2023-11-01', 'Completed 10 days consecutively'),
(4, 4, 'Swim 100 meters in under 1 minute', '2023-12-01', 'Currently at 1 minute 15 seconds'),
(5, 5, 'Achieve a 5-minute plank', '2024-01-10', 'Currently holding for 3 minutes'),
(6, 6, 'Climb a 5.10 difficulty rock wall', '2023-12-20', 'Currently climbing 5.8 routes'),
(7, 7, 'Cycle 50 kilometers non-stop', '2024-02-05', 'Last longest ride was 35 kilometers'),
(8, 8, 'Perform 50 consecutive push-ups', '2023-12-15', 'Currently at 30 push-ups'),
(9, 9, 'Master the crow yoga pose', '2023-11-20', 'Can hold the pose for a few seconds'),
(10, 10, 'Deadlift 150kg', '2024-03-01', 'Currently lifting 120kg');

-- Creating Notifications table
-- The notifications entity is designed to store information about notifications sent to users, including the type of notification, 
-- when it was sent, and the content of the notification. The Notification ID is the primary key and has User ID as the foreign key.
DROP TABLE IF EXISTS Notifications_T9;
CREATE TABLE Notifications_T9(
    Notification_ID_PK INT PRIMARY KEY AUTO_INCREMENT,
    User_ID_fk INT NOT NULL,
    Notification_Type VARCHAR(100),
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Notification_Message TEXT,
    FOREIGN KEY (user_id_fk) REFERENCES users_t1 (user_id_pk)
);
-- Inserting data into Notifications table
INSERT INTO Notifications_T9 (User_ID_fk, Notification_Type, Notification_Message)
VALUES 
(1, 'Reminder', 'Your workout session is tomorrow at 8 AM'),
(2, 'Alert', 'You have reached 80% of your monthly nutrition goal'),
(3, 'Update', 'New diet plan available now! Check it out.'),
(4, 'Reminder', 'Remember to hydrate after your workout'),
(5, 'Alert', 'Please update your weight details for better recommendations'),
(1, 'Info', 'Check out our new workout routines for the summer!'),
(6, 'Reminder', 'Log your meals to get better diet insights'),
(7, 'Alert', 'You missed your workout session today. Stay on track!'),
(2, 'Info', 'Join the community event this weekend! Fun and fitness.'),
(8, 'Reminder', 'Time to check your weekly progress on the dashboard.');

-- Creating Addresses table
-- The addresses table stores information about the physical addresses of users. 
-- The User ID can be used as a reference to link an address to a user. 
DROP TABLE IF EXISTS Addresses_T10;
CREATE TABLE Addresses_T10 (
    User_ID_FK INT NOT NULL,
    Address_Line1 VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    Zip INT NOT NULL,
    FOREIGN KEY (User_ID_FK) REFERENCES users_t1(User_ID_pk)
);
INSERT INTO Addresses_T10 (User_ID_FK, Address_Line1, City, State, Zip)
VALUES 
(1, '123 Bailey St', 'Orlando', 'Florida', 12345),
(2, '456 Davenport Blvd', 'Memphis', 'Tennessee', 67890),
(3, '789 Frankford Ln', 'Albany', 'Oregon', 11223),
(4, '101 Hailey Ave', 'Waterloo', 'Iowa', 44556),
(5, '121 Blustery Rd', 'Raleigh', 'North Carolina', 77889),
(6, '394 Abbey Ct', 'Buffalo', 'New York', 75389),
(7, '843 Battersby Blvd', 'Orlando', 'Florida', 69831),
(8, '212 Mermaid Ln', 'Philadelphia', 'Pennsylvania', 46686),
(9, '709 Bentley Rd', 'Waterloo', 'Iowa', 10058),
(10, '413 Hollywood Ave', 'Oakland', 'California', 76309),
(11, '634 Graceland Ave', 'Princeton', 'New Jersey', 26899),
(12, '914 Watford Blvd', 'Phoenix', 'Arizona', 15874),
(13, '863 Peachtree Ln', 'Albany', 'Oregon', 46387),
(14, '742 Wayne Ct', 'Roswell', 'New Mexico', 95317),
(15, '632 Woodman Ct', 'Mitchelle', 'South Dakota', 75214);

-- creating a reminder table
-- Manages workout reminders for users, associating each reminder with a unique ID (Reminder_ID_pk). Links reminders to specific users via the User_ID_fk foreign key. 
-- Includes fields for Workout_Type to specify workout details and Reminder_Time for the scheduled reminder time.
DROP TABLE IF EXISTS WorkoutReminder_T11;
CREATE TABLE WorkoutReminder_T11 (
    Reminder_ID_pk INT PRIMARY KEY,
    User_ID_fk INT,
    Workout_Type VARCHAR(255),
    Reminder_Time TIME,
    FOREIGN KEY (User_ID_fk) REFERENCES Users_T1(User_id_pk) );
INSERT INTO WorkoutReminder_T11 (Reminder_ID_pk, User_ID_fk, Workout_Type, Reminder_Time) VALUES
    (1, 1, 'Cardio', '08:00:00'),
    (2, 2, 'Strength Training', '14:30:00'),
    (3, 3, 'Yoga', '18:00:00'),
    (4, 4, 'HIIT', '09:15:00'),
    (5, 5, 'Running', '06:30:00'),
    (6, 6, 'Swimming', '07:45:00'),
    (7, 7, 'Pilates', '17:00:00'),
    (8, 8, 'Cycling', '12:00:00'),
    (9, 9, 'Crossfit', '16:30:00'),
    (10, 10, 'Zumba', '19:30:00'),
    (11, 11, 'Kickboxing', '10:45:00'),
    (12, 12, 'Aerobics', '11:30:00'),
    (13, 13, 'Powerlifting', '15:00:00'),
    (14, 14, 'Barre', '17:30:00'),
    (15, 15, 'Rowing', '20:00:00');

-- creating a content table
-- The Content table serves as a repository for various types of content entries. It includes essential details such as a unique Content_ID acting as the primary key, 
-- the Title of the content, information about the Author, the PublishedDate indicating when the content was published, the ContentType specifying the type of content, 
-- and a User_ID column serving as a foreign key reference to the User table. 
-- This table facilitates the management and organization of different content forms contributed by various users within the system.
DROP TABLE IF EXISTS Content_T12;
CREATE TABLE IF NOT EXISTS Content_T12 (
    ContentID_pk INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(100),
    PublishedDate DATE,
    ContentText TEXT,
    ContentType ENUM('Article', 'Video', 'Podcast', 'Infographic', 'Other'),
    User_id_fk INT,
    FOREIGN KEY(User_id_fk) REFERENCES Users_T1(User_id_pk));

INSERT INTO Content_T12 (Title, Author, PublishedDate, ContentType, User_id_fk)
VALUES
    ('High-Intensity Interval Training 101', 'Fitness Guru 1', '2023-01-15', 'Article', 1),
    ('Full Body Workout Video', 'Fitness Trainer 2', '2023-02-20', 'Video', 1),
    ('Podcast: Nutrition Tips for Athletes', 'Nutrition Expert 3', '2023-03-10', 'Podcast', 2),
    ('Infographic: Muscle Building Basics', 'Fitness Illustrator 4', '2023-04-05', 'Infographic', 1),
    ('Mindful Running Thoughts', 'Runner Writer 5', '2023-05-12', 'Other', 2),
    ('Advanced Strength Training Techniques', 'Fitness Coach 1', '2023-06-18', 'Article', 1),
    ('Healthy Snack Ideas for Workouts', 'Nutritionist 3', '2023-07-25', 'Article', 2),
    ('Podcast: Mental Benefits of Exercise', 'Psychologist Podcaster 6', '2023-08-08', 'Podcast', 1),
    ('Visualizing Your Fitness Progress', 'Fitness Illustrator 4', '2023-09-14', 'Infographic', 2),
    ('Yoga for Beginners Video', 'Yoga Instructor 7', '2023-10-22', 'Video', 1);

-- creating a community table
-- It is designed to store information about different communities within a system. It includes details such as the user ID associated with the community, the community ID,name , and the goals or focus of the group. 
-- This table is intended to facilitate the organization of users into communities, each with its own unique identifier, name, and specific objectives or goals.
-- The User_Id_Fk field serves as a foreign key that establishes a link between the Community_T13 table and the Users_T1 table, ensuring that each community is associated with a valid user.
DROP TABLE IF EXISTS Community_T13;
CREATE TABLE Community_T13(
	User_Id_Fk INT AUTO_INCREMENT,
    Community_ID INT PRIMARY KEY,
    Community_Name VARCHAR(255),
    Group_Goals VARCHAR(255),
    FOREIGN KEY (User_Id_Fk) REFERENCES Users_T1(User_id_pk));
insert into Community_T13(community_ID, Community_Name,Group_Goals)values
(10,'Acheivers','500 cals per day'),
(21,'Sports stars','400 cals per day'),
(31,'Sports Energy','450 cals per day'),
(41,'Fitness stars','500 cals per day');

-- Creating a options table
-- This table is designed to manage different sharing options available to users. It contains information such as the sharing option ID, the user ID for whom the option is defined, 
-- the option name, and a brief description of the sharing option. This table serves as a reference for configuring sharing preferences, allowing users to specify how they want to share information or content within a system. 
-- The foreign key relationship with the Users_T1 table ensures that each sharing option is associated with a valid user.
DROP TABLE IF EXISTS Sharing_Option_T14;
CREATE TABLE Sharing_Option_T14 (
    sharing_option_ID INT PRIMARY KEY NOT NULL,
    User_Id_Fk INT AUTO_INCREMENT,
    Option_Name VARCHAR(50),
    Description_sharing VARCHAR(100),
	FOREIGN KEY (User_Id_Fk) REFERENCES Users_T1(User_id_pk)
);
INSERT INTO Sharing_Option_T14 (sharing_option_ID,Option_Name, Description_sharing) VALUES
(111,'Public', 'Share with everyone'),
(112,'Private', 'Keep it private'),
(113,'Friends Only', 'Share with friends'),
(114,'Custom Group', 'Share with a specific group'),
(115,'Link Sharing', 'Generate a shareable link'),
(116,'Restricted Access', 'Limited access'),
(117,'Read-Only', 'Read-only access'),
(118,'Full Access', 'Full access to selected users'),
(119,'View and Comment', 'View and comment access'),
(120,'Edit Access', 'Full editing access');

-- creating an updated user table that contails all the information of the user before updation
DROP TABLE IF EXISTS updated_user_T15;
CREATE TABLE updated_user_T15(
	User_id INT,
    Ufname     VARCHAR(20) ,
    Ulname     VARCHAR(20),
	Age        INT,
	Sex	       CHAR(2),
    Weight     INT,
    Height_cm  INT,     
	Diet_rest  VARCHAR(20),
	Allergies  VARCHAR(20),
    Contact    BIGINT,
    Modification VARCHAR(25),
    Timeofchange DATETIME,
    FOREIGN KEY (User_id) REFERENCES users_T1(user_id_pk));

/* Queries */ 

-- 1. Retrieving the user details along with their fitness goals and their current progress
select u.user_id_pk,u.ufname,u.ulname,f.goaltype,f.progresstracking from users_t1 u join fitnessgoals_t8 f on u.user_id_pk=f.userid_fk where f.userid_fk in (2,4,6,8,10);

-- 2. Retrieving the user details along with their fitness goals and their current progress
SELECT u.user_id_pk,u.ufname,u.ulname,u.contact,a.address_line1,a.city,a.state,a.zip FROM users_t1 u JOIN addresses_t10 a ON u.user_id_pk=a.user_id_fk;

-- 3. Retrieving the address for the users that are enrolled for a training session (so that material required for training can be delivered to the users)
SELECT Addresses_T10.User_ID_FK, Addresses_T10.Address_Line1, Addresses_T10.City, Addresses_T10.State, Addresses_T10.Zip
FROM Addresses_T10 
JOIN Sessions_T3 ON Addresses_T10.User_ID_FK = Sessions_T3.user_id_fk 
JOIN Trainers_T2 ON Sessions_T3.trainer_id_fk = Trainers_T2.trainer_id_pk;

-- 4. Send a notification to all the users in the same city to notify them that there is a marathon run being organized
INSERT INTO Notifications_T9 (User_ID_FK, Notification_Message, Notification_Type, Timestamp) SELECT Users_T1.User_id_pk, 'Marathon Run Alert: Join the marathon in your city!', 'Marathon Alert', CURRENT_TIMESTAMP FROM Users_T1 JOIN Addresses_T10 ON Users_T1.User_id_pk = Addresses_T10.User_ID_FK WHERE Addresses_T10.City = 'Albany';

SELECT *
FROM Notifications_T9;

-- 5. Find users who have set workout reminders but have not set any goals
SELECT Users_T1.User_id_pk, Users_T1.Ufname AS Username, Users_T1.Contact AS Contact
FROM Users_T1 JOIN WorkoutReminder_T11 ON Users_T1.User_id_pk = WorkoutReminder_T11.User_ID_fk
LEFT JOIN FitnessGoals_T8 ON Users_T1.User_id_pk = FitnessGoals_T8.UserID_fk
WHERE FitnessGoals_T8.GoalID_pk IS NULL;

-- 6. Retrieve content titles and authors along with the latest progress entry value for each content
SELECT Content_T12.Title, Content_T12.Author, Progress_Log_T4.Workout_duration AS LatestProgress
FROM Content_T12 LEFT JOIN Progress_Log_T4 ON Content_T12.User_ID_fk = Progress_Log_T4.User_id_fk
WHERE Progress_Log_T4.Date = (SELECT MAX(Date) FROM Progress_Log_T4 WHERE User_id_fk = Content_T12.User_ID_fk);

-- 7. Provide an overview of users and the count of content items they have published
SELECT U.User_id_pk AS User_ID,CONCAT(U.Ufname, ' ', U.Ulname) AS Username,U.Contact,COUNT(CT.ContentID_pk) AS Content_Count
FROM Users_T1 U LEFT JOIN Content_T12 CT ON U.User_id_pk = CT.User_ID_fk
GROUP BY U.User_id_pk, Username, U.Contact ORDER BY U.User_id_pk;

-- 8. Analysis of Workout Duration Variability by User
SELECT User_id_fk, MAX(Workout_duration) AS Longest_Workout, MIN(Workout_duration) AS Shortest_Workout, STDDEV(Workout_duration) AS Duration_Variability
FROM Progress_Log_T4 GROUP BY User_id_fk;

-- 9. User-Specific Workout Frequency and Attendance Analysis
SELECT User_id_fk, COUNT(*) AS Total_Sessions, SUM(Attendance) AS Total_Attendance FROM Progress_Log_T4 GROUP BY User_id_fk;

-- 10. Analysis of Total Calories Burned per User
SELECT User_id_fk, SUM(Calories_burned) AS Total_Calories_Burned FROM Progress_Log_T4 GROUP BY User_id_fk;

-- 11. retrieves the progress log details along with the corresponding nutrition plan for each user. 
SELECT U.User_id_pk,P.Date,P.Workout_duration,P.Calories_burned,N.RecommendedCalorieIntake,N.MacronutrientTargets
FROM Users_T1 U
INNER JOIN (SELECT User_id_fk, MAX(Progress_id_pk) AS MaxProgressID FROM Progress_Log_T4 GROUP BY User_id_fk) LatestProgress ON U.User_id_pk = LatestProgress.User_id_fk
INNER JOIN Progress_Log_T4 P ON LatestProgress.User_id_fk = P.User_id_fk AND LatestProgress.MaxProgressID = P.Progress_id_pk
LEFT JOIN NutritionPlan_T5 N ON U.User_id_pk = N.UserID_fk;

--  12. Get trainers with 'Fitness' certification
SELECT * FROM trainers_t2
WHERE trainer_id_pk IN (SELECT trainer_id_fk FROM sessions_t3 WHERE certification = 'Fitness');

-- 13. Get users with yoga workout reminders
SELECT * FROM users_t1
WHERE user_id_pk IN (SELECT user_id_fk FROM workoutreminder_t11 WHERE workout_type = 'Yoga');

-- 14. Retrieve a list of unique user names and trainer names from the fitness management system. Include both users and trainers, ensuring that each name appears only once in the result.
SELECT DISTINCT U.Ufname AS Name FROM Users_T1 U
UNION
SELECT DISTINCT T.tfname AS Name FROM Trainers_T2 T;

/* FUNCTIONS */

-- Function to calculate recommended calorie intake
DROP FUNCTION IF EXISTS recommend_calories;
DELIMITER //
CREATE FUNCTION recommend_calories(weight INT, height INT, age INT, sex CHAR(1))
RETURNS INT DETERMINISTIC
BEGIN
DECLARE bmr INT;
IF sex = 'M' THEN
	SET bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
ELSE
	SET bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
END IF;
RETURN bmr;
END //
DELIMITER ;
SELECT recommend_calories(70, 170, 25, 'F') as recommended_calories_intake;

-- Function to get user BMI
DROP FUNCTION IF EXISTS get_bmi;
DELIMITER //
CREATE FUNCTION get_bmi(height INT, weight INT)
RETURNS decimal(4,2)
DETERMINISTIC
BEGIN
DECLARE bmi decimal(4,2);
SET bmi = weight / POW(height/100, 2);
RETURN bmi;
END //
DELIMITER ;
select get_bmi(176,76) as BMI;

-- Function to calculate the average session duration
DROP FUNCTION IF EXISTS AverageDuration;
DELIMITER //
CREATE FUNCTION AverageDuration(userID INT) 
RETURNS DECIMAL
DETERMINISTIC
BEGIN
    DECLARE totalDuration INT;
    DECLARE sessionsCount INT;

    SELECT SUM(workout_duration), COUNT(*) INTO totalDuration, sessionsCount
    FROM progress_log_t4
    WHERE user_id_fk = userID;
    IF sessionsCount > 0 THEN
        RETURN totalDuration / sessionsCount;
    ELSE
        RETURN 0;
    END IF;
END//
DELIMITER ;
select averageduration(1) as Average_Duration;

/* PROCEDURES */
-- Procedure to insert new user
DROP PROCEDURE IF EXISTS insert_new_user;
DELIMITER //
CREATE PROCEDURE insert_new_user(
IN fname VARCHAR(50),
IN lname VARCHAR(50),
IN age INT,
IN sex CHAR(1),
IN weight INT,
IN height INT)
BEGIN
INSERT INTO users_t1(ufname, ulname, age, sex, weight, height_cm)
VALUES (fname, lname, age, sex, weight, height);
END //
DELIMITER ;
CALL insert_new_user("mark","cubin",56, "M", 83, 178);
select * from users_t1 where ufname="mark";

-- Procedure to insert fitness goal
DROP PROCEDURE IF EXISTS insert_fitness_goals;
DELIMITER //
CREATE PROCEDURE insert_fitness_goals( IN user_id INT,IN goal_type VARCHAR(100), IN target_date DATE) 
BEGIN
  INSERT INTO fitnessgoals_t8(userid_fk, goaltype, targetachievementdate)
  VALUES (user_id, goal_type, target_date);
END //
DELIMITER ;
call insert_fitness_goals(12,"cardio","2023-11-03");

-- Procedure to update user address
DROP PROCEDURE IF EXISTS Update_user_address;
DELIMITER //
CREATE PROCEDURE Update_user_address(IN userid INT, IN addline VARCHAR(225), IN newcity VARCHAR(50), IN newstate VARCHAR(50), IN newzip INT)
BEGIN
    UPDATE addresses_t10
    SET address_line1=addline, city=newcity,state=newstate,zip=newzip
    WHERE user_id_fk = userid;
END //
DELIMITER ;
call update_user_address(12,'zyx lane','dallas','texas',75080);

/* Triggers */
-- creating a trigger to store the data of the user before update in a updated user audit table
DROP TRIGGER IF EXISTS user_update;
DELIMITER //
CREATE TRIGGER user_update
	BEFORE UPDATE ON users_t1
    FOR EACH ROW
    BEGIN 
    INSERT INTO updated_user_T15 VALUES(OLD.user_id_pk,OLD.ufname,OLD.ulname,OLD.age,OLD.sex,OLD.weight,OLD.height_cm,OLD.diet_rest,OLD.allergies,OLD.contact,"Before Update",NOW());
END //
DELIMITER ;
UPDATE users_t1 SET contact=1234567 WHERE user_id_pk=12;
select * from updated_user_T15;

-- Creating Audit table for FitnessGoals_T8 changes
DROP TABLE IF EXISTS FitnessGoals_Audit_T16;
CREATE TABLE FitnessGoals_Audit_T16 (
    Audit_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID_fk INT,
    Action_Performed VARCHAR(50),
    Goal_Type VARCHAR(50),
    Date_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creating notification in the Notifications_T9 table whenever a new fitness goal is inserted into the FitnessGoals_T8 table.
DELIMITER //
CREATE TRIGGER after_insert_fitness_goal
AFTER INSERT ON FitnessGoals_T8
FOR EACH ROW
BEGIN
    -- Insert notification into Notifications table
    INSERT INTO Notifications_T9 (User_ID_fk, Notification_Type, Notification_Message)
    VALUES (NEW.UserID_fk, 'Goal Set', CONCAT('You have set a new fitness goal: ', NEW.GoalType));
    -- Insert into audit table
    INSERT INTO FitnessGoals_Audit_T16 (User_ID_fk, Action_Performed, Goal_Type)
    VALUES (NEW.UserID_fk, 'Goal Set', NEW.GoalType);
END; //
DELIMITER ;
call insert_fitness_goals(12,"cardio","2023-11-03");
select * from fitnessgoals_audit_t16;

-- creating an audit table for the deleted trainer data
DROP TABLE IF EXISTS trainers_audit_t17;
CREATE TABLE Trainers_Audit_T17 (
    action_id INT PRIMARY KEY AUTO_INCREMENT,
    old_trainer_id INT,
    tfname VARCHAR(100),
    tlname VARCHAR(150),
    sex VARCHAR(2),
    certification VARCHAR(200),
    Specilisation VARCHAR(200),
    contact BIGINT,
    action_description VARCHAR(255),
    action_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 
-- creating a trigger to store the deleted trainer data to a trainer audit table
DROP TRIGGER IF EXISTS delete_trainers_t2; 
DELIMITER //
CREATE TRIGGER delete_Trainers_T2
BEFORE DELETE ON Trainers_T2
FOR EACH ROW
BEGIN
    INSERT INTO trainers_audit_T17(old_trainer_id,tfname,tlname,sex,certification,specilisation,contact,action_description) 
    VALUES (OLD.trainer_id_pk,OLD.tfname,OLD.tlname,OLD.sex,OLD.certification,OLD.specilisation,OLD.contact,'Deleted');
END;
//
DELIMITER ;

Delete from trainers_t2 where trainer_id_pk=10;
select * from trainers_audit_t17;
select * from trainers_t2;


/* VIEWS */
#There's a need to quickly view the current progress status of each user against their set fitness goals for easy tracking and management.
DROP VIEW IF EXISTS User_Goal_Status;
CREATE VIEW User_Goal_Status AS
SELECT u.User_id_pk, u.Ufname, u.Ulname, g.GoalType, g.TargetAchievementDate, g.ProgressTracking
FROM Users_T1 u
JOIN FitnessGoals_T8 g ON u.User_id_pk = g.UserID_fk;

#Trainers need an easy way to view the summary of their training sessions, including the number of sessions conducted, average ratings, and the types of sessions (personal or virtual).
DROP VIEW IF EXISTS Trainer_Session_Summary;
CREATE VIEW Trainer_Session_Summary AS
SELECT t.trainer_id_pk, t.tfname, t.tlname, COUNT(s.session_id_cpk) AS Total_Sessions, AVG(s.rating) AS Average_Rating, s.session_type
FROM Trainers_T2 t
JOIN Sessions_T3 s ON t.trainer_id_pk = s.trainer_id_fk
GROUP BY t.trainer_id_pk, s.session_type ORDER BY t.trainer_id_pk;

select * from user_goal_status;
select * from trainer_session_summary;

/* INDEXES */
-- Creating an index on the user table on the first and last name 
CREATE INDEX name_index ON users_t1 (Ufname,Ulname);

-- creating an index on the nutrition plan table based on the user id and the calorie intake. 
CREATE INDEX nutrition_index ON nutritionplan_T5 (userid_fk, recommendedcalorieintake);

show index from nutritionplan_t5;
show index from users_t1;

