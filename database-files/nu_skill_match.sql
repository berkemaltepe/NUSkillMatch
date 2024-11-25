CREATE DATABASE skillmatch;

USE skillmatch;

CREATE TABLE IF NOT EXISTS Skill (
    skill_id int PRIMARY KEY,
    skill_name varchar(50),
    skill_type varchar(50),
    weight int
);

CREATE TABLE IF NOT EXISTS System_Admin (
    admin_id int PRIMARY KEY,
    name varchar(50),
    email varchar(50),
    industry varchar(50),
    num_applications int
);

CREATE TABLE IF NOT EXISTS Dpt_Faculty (
    faculty_id int PRIMARY KEY,
    admin_id int,
    name varchar(50),
    email varchar(50),
    department varchar(50),
    CONSTRAINT fk_1
        FOREIGN KEY (admin_id) REFERENCES System_Admin (admin_id)
            ON UPDATE cascade
            ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS Advisor (
    advisor_id int PRIMARY KEY,
    admin_id int,
    name varchar(50),
    email varchar(50),
    department varchar(50),
    CONSTRAINT fk_2
        FOREIGN KEY (admin_id) REFERENCES System_Admin (admin_id)
            ON UPDATE cascade
            ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS Employer (
    emp_id int PRIMARY KEY,
    admin_id int,
    name varchar(50),
    email varchar(50),
    industry varchar(50),
    num_applications int,
    CONSTRAINT fk_3
        FOREIGN KEY (admin_id) REFERENCES System_Admin (admin_id)
            ON UPDATE cascade
            ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS Student (
    student_id int PRIMARY KEY,
    name varchar(50),
    email varchar(50),
    location varchar(50),
    major varchar(50),
    coop_status varchar(30),
    resume varchar(5000),
    level varchar(50),
    linkedin_profile varchar(50),
    gpa int,
    advisor_id int,
    admin_id int,
    CONSTRAINT fk_4
        FOREIGN KEY (advisor_id) REFERENCES Advisor (advisor_id)
            ON UPDATE cascade
            ON DELETE restrict,
    CONSTRAINT fk_5
        FOREIGN KEY (admin_id) REFERENCES System_Admin (admin_id)
            ON UPDATE cascade
            ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS Student_Skill (
    skill_id int,
    student_id int,
    weight int,
    PRIMARY KEY (skill_id, student_id),
    CONSTRAINT fk_6
        FOREIGN KEY (skill_id) REFERENCES Skill (skill_id)
            ON UPDATE cascade
            ON DELETE cascade,
    CONSTRAINT fk_7
        FOREIGN KEY (student_id) REFERENCES Student (student_id)
            ON UPDATE cascade
            ON DELETE cascade
);

CREATE TABLE IF NOT EXISTS Job (
    job_id int PRIMARY KEY,
    title varchar(50),
    emp_id int,
    description varchar(1000),
    location varchar(50),
    pay_range varchar(50),
    date_posted datetime,
    status varchar(30),
    CONSTRAINT fk_8
        FOREIGN KEY (emp_id) REFERENCES Employer (emp_id)
            ON UPDATE cascade
            ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS Job_Skill (
    skill_id int,
    job_id int,
    weight int,
    PRIMARY KEY (skill_id, job_id),
    CONSTRAINT fk_9
        FOREIGN KEY (skill_id) REFERENCES Skill (skill_id)
            ON UPDATE cascade
            ON DELETE cascade,
    CONSTRAINT fk_10
        FOREIGN KEY (job_id) REFERENCES Job (job_id)
            ON UPDATE cascade
            ON DELETE cascade
);


