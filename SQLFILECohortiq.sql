USE cohortiq
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    full_name VARCHAR(100),
    user_email VARCHAR(100),
    signup_date DATETIME,
    signup_platform VARCHAR(20),      
    referral_source VARCHAR(50)      
);
CREATE TABLE sessions (
    session_id INT PRIMARY KEY,
    user_id INT,
    session_start DATETIME,
    session_end DATETIME,
    device_type VARCHAR(20),          
    session_type VARCHAR(50),         
    pages_viewed INT,
    is_conversion BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
INSERT INTO users (user_id, username, full_name, user_email, signup_date, signup_platform, referral_source) VALUES
(1, 'astroTom', 'Tom Nielsen', 'tom@spacemail.com', '2025-06-01', 'web', 'ads'),
(2, 'bananaBecca', 'Rebecca Wong', 'becca@gmail.com', '2025-06-03', 'iOS', 'invite'),
(3, 'coolCarl', 'Carl Mendoza', 'carl@penguins.io', '2025-06-05', 'Android', 'organic'),
(4, 'laptopLarry', 'Larry Gupta', 'larry@techhaze.net', '2025-06-07', 'web', 'ads'),
(5, 'zoomZara', 'Zara Ali', 'zara@lookatme.biz', '2025-06-09', 'iOS', 'invite'),
(6, 'meltdownMeg', 'Meghan Hall', 'meg@unstable.cc', '2025-06-11', 'web', 'organic'),
(7, 'notedNina', 'Nina Schmidt', 'nina@datanotes.org', '2025-06-13', 'Android', 'ads'),
(8, 'javaJules', 'Julian Ross', 'julian@beans.dev', '2025-06-15', 'web', 'invite'),
(9, 'debugDon', 'Donald Cho', 'don@fixmycode.com', '2025-06-17', 'iOS', 'ads'),
(10, 'plutoPam', 'Pamela Vega', 'pam@dwarfplanets.com', '2025-06-19', 'Android', 'organic');
INSERT INTO sessions (session_id, user_id, session_start, session_end, device_type, session_type, pages_viewed, is_conversion) VALUES
(101, 1, '2025-06-01 10:00:00', '2025-06-01 10:30:00', 'desktop', 'tutorial', 5, TRUE),
(102, 1, '2025-06-08 11:00:00', '2025-06-08 11:20:00', 'mobile', 'usage', 7, FALSE),
(103, 2, '2025-06-04 09:15:00', '2025-06-04 09:45:00', 'mobile', 'usage', 10, TRUE),
(104, 3, '2025-06-06 14:00:00', '2025-06-06 14:50:00', 'desktop', 'usage', 12, FALSE),
(105, 4, '2025-06-08 16:30:00', '2025-06-08 16:55:00', 'mobile', 'support', 3, FALSE),
(106, 4, '2025-06-09 17:00:00', '2025-06-09 17:30:00', 'desktop', 'usage', 8, TRUE),
(107, 5, '2025-06-10 08:00:00', '2025-06-10 08:20:00', 'mobile', 'tutorial', 6, FALSE),
(108, 6, '2025-06-12 12:00:00', '2025-06-12 12:40:00', 'desktop', 'usage', 11, TRUE),
(109, 6, '2025-06-19 12:00:00', '2025-06-19 12:30:00', 'mobile', 'usage', 9, TRUE),
(110, 7, '2025-06-13 13:00:00', '2025-06-13 13:15:00', 'mobile', 'support', 4, FALSE),
(111, 8, '2025-06-15 14:30:00', '2025-06-15 14:50:00', 'desktop', 'usage', 6, FALSE),
(112, 9, '2025-06-18 10:00:00', '2025-06-18 10:30:00', 'mobile', 'usage', 10, TRUE),
(113, 9, '2025-06-24 11:00:00', '2025-06-24 11:30:00', 'desktop', 'usage', 13, TRUE),
(114, 10, '2025-06-21 09:00:00', '2025-06-21 09:20:00', 'mobile', 'tutorial', 5, FALSE),
(115, 10, '2025-06-28 09:00:00', '2025-06-28 09:30:00', 'desktop', 'usage', 9, TRUE);
SELECT * FROM users;
SELECT * FROM sessions;
SELECT user FROM mysql.user;
