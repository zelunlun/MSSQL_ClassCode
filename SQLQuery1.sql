Create database 選課系統;
Use 選課系統;
drop database 選課系統;


Create table 科系(系碼 char(10) primary key, 系名 char(10), 系主任 char(10));
Create table 老師(老師編號 char(10) primary key, 老師姓名 char(10), 研究領域 char(10));

Create table 課程(課程代號 char(10) primary key, 課程名稱 char(10), 學分數 int, 老師編號 char(10), foreign key(老師編號) references	老師(老師編號) on delete cascade);
Create table 學生(學號 char(10) primary key, 姓名 char(10), 系碼 char(10), foreign key(系碼) references 科系(系碼) on delete cascade );

Create table 學務處(序號 char(10) primary key, 學號 char(10), 操行成績 int, foreign key(學號) references 學生(學號) on delete cascade);
Create table 教務處(序號 char(10) primary key, 學號 char(10), 學業成績 int, foreign key(學號) references 學生(學號) on delete cascade);

Create table 選課(學號 char(10), 課號 char(10), 成績 int, primary key(學號, 課號), foreign key(學號) references 學生(學號) on delete cascade, foreign key(課號) references 課程(課程代號) on delete cascade);


ALTER TABLE 教務處
DROP CONSTRAINT FK__教務處__學號__33F4B129;

SELECT   
    f.name AS foreign_key_name  
   ,OBJECT_NAME(f.parent_object_id) AS table_name  
   ,COL_NAME(fc.parent_object_id, fc.parent_column_id) AS constraint_column_name  
   ,OBJECT_NAME (f.referenced_object_id) AS referenced_object  
   ,COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS referenced_column_name  
   ,is_disabled  
   ,delete_referential_action_desc  
   ,update_referential_action_desc  
FROM sys.foreign_keys AS f  
INNER JOIN sys.foreign_key_columns AS fc   
   ON f.object_id = fc.constraint_object_id   
WHERE f.parent_object_id = OBJECT_ID('教務處'); 