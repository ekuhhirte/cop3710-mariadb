CREATE TABLE student_registrations (
    student_id INT,
    student_name VARCHAR(100),
    student_email VARCHAR(100),
    student_phone VARCHAR(20),
    student_major VARCHAR(50),
    
    -- Repeating Group 1: Course Information
    course1_id VARCHAR(10),
    course1_name VARCHAR(100),
    course1_credits INT,
    course1_grade VARCHAR(2),
    course1_instructor VARCHAR(100),
    
    course2_id VARCHAR(10),
    course2_name VARCHAR(100),
    course2_credits INT,
    course2_grade VARCHAR(2),
    course2_instructor VARCHAR(100),
    
    course3_id VARCHAR(10),
    course3_name VARCHAR(100),
    course3_credits INT,
    course3_grade VARCHAR(2),
    course3_instructor VARCHAR(100),
    
    -- Repeating Group 2: Emergency Contact Information
    emergency_contact1_name VARCHAR(100),
    emergency_contact1_phone VARCHAR(20),
    emergency_contact1_relation VARCHAR(50),
    
    emergency_contact2_name VARCHAR(100),
    emergency_contact2_phone VARCHAR(20),
    emergency_contact2_relation VARCHAR(50),
    
    -- Additional redundant data
    advisor_name VARCHAR(100),
    advisor_email VARCHAR(100),
    advisor_office VARCHAR(50),
    semester VARCHAR(20),
    year INT,
    total_credits INT,
    gpa DECIMAL(3,2)
);

INSERT INTO student_registrations VALUES
(
    -- Student 1
    1001, 'Alice Johnson', 'alice.j@university.edu', '555-0101', 'Computer Science',
    
    -- Course 1
    'CS101', 'Intro to Programming', 3, 'A', 'Dr. Smith',
    
    -- Course 2
    'CS102', 'Data Structures', 4, 'B+', 'Dr. Smith',
    
    -- Course 3
    'MATH201', 'Calculus II', 3, 'A-', 'Prof. Davis',
    
    -- Emergency Contacts
    'Mary Johnson', '555-1001', 'Mother',
    'Robert Johnson', '555-1002', 'Father',
    
    -- Advisor (redundant data - same advisor appears for multiple students)
    'Dr. Sarah Williams', 'sarah.w@university.edu', 'Building A, Room 305',
    'Fall', 2024, 10, 3.67
),
(
    -- Student 2
    1002, 'Bob Martinez', 'bob.m@university.edu', '555-0102', 'Computer Science',
    
    -- Course 1
    'CS101', 'Intro to Programming', 3, 'B', 'Dr. Smith',
    
    -- Course 2
    'CS150', 'Web Development', 3, 'A', 'Prof. Lee',
    
    -- Course 3 (NULL - only taking 2 courses)
    NULL, NULL, NULL, NULL, NULL,
    
    -- Emergency Contacts
    'Carmen Martinez', '555-2001', 'Mother',
    NULL, NULL, NULL,  -- No second emergency contact
    
    -- Advisor (DUPLICATE DATA - same advisor as Alice)
    'Dr. Sarah Williams', 'sarah.w@university.edu', 'Building A, Room 305',
    'Fall', 2024, 6, 3.50
),
(
    -- Student 3
    1003, 'Carol Chen', 'carol.c@university.edu', '555-0103', 'Data Science',
    
    -- Course 1
    'CS102', 'Data Structures', 4, 'A', 'Dr. Smith',
    
    -- Course 2
    'STAT301', 'Statistics', 3, 'A-', 'Dr. Brown',
    
    -- Course 3
    'CS305', 'Database Systems', 3, 'B+', 'Prof. Wilson',
    
    -- Emergency Contacts
    'David Chen', '555-3001', 'Father',
    'Lisa Chen', '555-3002', 'Sister',
    
    -- Advisor (Different advisor)
    'Dr. Michael Torres', 'michael.t@university.edu', 'Building B, Room 201',
    'Fall', 2024, 10, 3.80
),
(
    -- Student 4
    1004, 'David Park', 'david.p@university.edu', '555-0104', 'Computer Science',
    
    -- Course 1
    'CS101', 'Intro to Programming', 3, 'A', 'Dr. Smith',
    
    -- Course 2
    'CS102', 'Data Structures', 4, 'A', 'Dr. Smith',
    
    -- Course 3
    'CS201', 'Algorithms', 4, 'B+', 'Prof. Anderson',
    
    -- Emergency Contacts
    'Jennifer Park', '555-4001', 'Mother',
    'Thomas Park', '555-4002', 'Brother',
    
    -- Advisor (DUPLICATE DATA - same as Alice and Bob)
    'Dr. Sarah Williams', 'sarah.w@university.edu', 'Building A, Room 305',
    'Fall', 2024, 11, 3.7
),
(
    -- Student 5
    1005, 'Emma Wilson', 'emma.w@university.edu', '555-0105', 'Cybersecurity',
    
    -- Course 1
    'CS150', 'Web Development', 3, 'A-', 'Prof. Lee',
    
    -- Course 2 (NULL - only taking 1 course this semester)
    NULL, NULL, NULL, NULL, NULL,
    
    -- Course 3 (NULL)
    NULL, NULL, NULL, NULL, NULL,
    
    -- Emergency Contacts
    'Richard Wilson', '555-5001', 'Father',
    'Anna Wilson', '555-5002', 'Mother',
    
    -- Advisor
    'Dr. James Rodriguez', 'james.r@university.edu', 'Building C, Room 150',
    'Fall', 2024, 3, 3.70
);