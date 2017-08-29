CREATE TABLE todos (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    details TEXT NULL,
    priority INTEGER NOT NULL DEFAULT 1,
    created_at TIMESTAMP NOT NULL,
    completed_at TIMESTAMP NULL

);



INSERT INTO todos (title, details, priority, created_at, completed_at) VALUES
('Wash the Car', 'Use soap and a sponge to wash the car in the driveway. Do not take it to the carwash at the gas station. You do not have quarters.', 3, '2004-10-19 10:23:54', NULL ),
('Take Kratos for a Walk', 'Put Kratos in his puppy harness and walk outside with him. Let him run and play. Make sure you bring a bag for when he does his thing.', 4 , '2004-10-19 10:23:54', NULL ),
('Go to The Iron Yard', 'Get in the car, making sure you have gas, and drive forever. Just keep driving. Maybe you will get there one day. Maybe not. Either way, class starts at 9am.', 5, '2004-10-19 10:23:54', '2017-08-28 07:10:37'),
('Eat Lunch', 'Finish your daily project, then go eat. You are hungry.', 5, '2004-10-19 10:23:54', NULL),
('Turn in Daily Project', 'Finish writing these commands, and finish your work and turn it in by 4pm.', 4, '2004-10-19 10:23:54', NULL),
('Watch Insecure', 'Find episode 6, season 5 online and watch it', 2, 'now', NULL),
('CREATE EARTH', 'Make the chicken the before egg.', 7, '0001-01-01 12:00:00', '0001-01-01 12:00:01' ),
('Learn about SQL', 'Listen to the lecture.', 4, '2004-10-19 10:23:54', 'yesterday'),
('Triple Jump', 'Hop, then step, then jump', 6, '2007-10-19 10:23:54', NULL),
('Make the 2020 Olympic Team', 'Train Hard and love what you do', 6, '2016-07-07 10:23:54', NULL),
('Get job as software developer', NULL, 5, '2017-07-24 10:23:54', NULL ),
('Paint fingernails', NULL, 1, '2004-10-19 10:23:54', NULL),
('Feed the dog', NULL, 3, '2004-10-19 10:23:54', NULL),
('Make the best out of life', NULL, 7, '1993-03-07 02:55:37', NULL),
('Make a smoothie', 'Use mango. Never pinapple.',3, '2004-10-19 10:23:54', 'today'),
('Eat breakfast', NULL, 4, 'today', 'now'),
('Go home', NULL, 3, 'yesterday', 'today'),
('Take a nap', 'sleep', 4, 'yesterday', NULL),
('facetime mom', NULL, 2, '2004-10-19 10:23:54', NULL),
('Get Naan Stop for One Dollar', NULL, 5, '2004-10-19 10:23:54', 'today')
;


-- Write a SELECT statement to find all incomplete todos with priority 3.
SELECT * FROM todos WHERE completed_at IS NULL AND  priority = 3;

-- Write a SELECT statement to find the number of incomplete todos by priority.
SELECT COUNT(title), priority
FROM todos
WHERE completed_at IS NULL
GROUP BY priority;

-- Write a SELECT statement to find the number of todos by priority created in the last 30 days.

SELECT COUNT(title), priority
FROM todos
WHERE created_at > current_date - interval '30'
GROUP BY priority;

-- Write a SELECT statement to find the next todo you should work on. This is the todo with the highest priority that was created first.


SELECT title, priority, created_at
FROM todos
WHERE completed_at IS NULL AND priority = 7
ORDER BY created_at;
