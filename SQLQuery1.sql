Create database ��Ҩt��;
Use ��Ҩt��;
drop database ��Ҩt��;


Create table ��t(�t�X char(10) primary key, �t�W char(10), �t�D�� char(10));
Create table �Ѯv(�Ѯv�s�� char(10) primary key, �Ѯv�m�W char(10), ��s��� char(10));

Create table �ҵ{(�ҵ{�N�� char(10) primary key, �ҵ{�W�� char(10), �Ǥ��� int, �Ѯv�s�� char(10), foreign key(�Ѯv�s��) references	�Ѯv(�Ѯv�s��) on delete cascade);
Create table �ǥ�(�Ǹ� char(10) primary key, �m�W char(10), �t�X char(10), foreign key(�t�X) references ��t(�t�X) on delete cascade );

Create table �ǰȳB(�Ǹ� char(10) primary key, �Ǹ� char(10), �ަ榨�Z int, foreign key(�Ǹ�) references �ǥ�(�Ǹ�) on delete cascade);
Create table �аȳB(�Ǹ� char(10) primary key, �Ǹ� char(10), �Ƿ~���Z int, foreign key(�Ǹ�) references �ǥ�(�Ǹ�) on delete cascade);

Create table ���(�Ǹ� char(10), �Ҹ� char(10), ���Z int, primary key(�Ǹ�, �Ҹ�), foreign key(�Ǹ�) references �ǥ�(�Ǹ�) on delete cascade, foreign key(�Ҹ�) references �ҵ{(�ҵ{�N��) on delete cascade);


ALTER TABLE �аȳB
DROP CONSTRAINT FK__�аȳB__�Ǹ�__33F4B129;

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
WHERE f.parent_object_id = OBJECT_ID('�аȳB'); 