Q1
CREATE TABLE departments (
    department_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

Q2
ALTER TABLE people
ADD COLUMN department_id INT UNSIGNED NULL AFTER email;

Q3
INSERT INTO departments (name) VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name, email, age, gender, department_id) VALUES
('佐藤太郎', 'taro.sato@example.com', 28, 1, 1),
('田中花子', 'hanako.tanaka@example.com', 32, 2, 1),
('鈴木次郎', 'jiro.suzuki@example.com', 26, 1, 1),
('高橋愛', 'ai.takahashi@example.com', 30, 2, 2),
('伊藤健', 'ken.ito@example.com', 29, 1, 2),
('中村涼子', 'ryoko.nakamura@example.com', 27, 2, 2),
('山本大輔', 'daisuke.yamamoto@example.com', 35, 1, 2),
('小林浩一', 'koichi.kobayashi@example.com', 40, 1, 3),
('加藤真理', 'mari.kato@example.com', 31, 2, 4),
('渡辺悠介', 'yusuke.watanabe@example.com', 33, 1, 5);

INSERT INTO reports (person_id, content) VALUES
(1, '本日は営業活動で3件訪問しました。'),
(2, '開発のバグ修正を対応しました。'),
(3, '経理処理のチェックを行いました。'),
(4, '新しい人事制度について検討しました。'),
(5, '社内ネットワークの不具合を修正しました。'),
(6, 'お客様への資料を作成しました。'),
(7, '朝会で進捗を報告しました。'),
(8, 'プロジェクトのレビューを実施しました。'),
(9, '会議資料を作成して上司に提出しました。'),
(10, '本日は在宅勤務で作業を行いました。');

Q4
UPDATE people SET department_id = 1 WHERE person_id = 1;
UPDATE people SET department_id = 2 WHERE person_id = 2;
UPDATE people SET department_id = 2 WHERE person_id = 3;
UPDATE people SET department_id = 5 WHERE person_id = 4;
UPDATE people SET department_id = 4 WHERE person_id = 6;

Q5
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

Q6
peopleテーブルからdepartment_idカラムの値が1のレコードを対象にして
name,email,ageカラムのデータをcreated_atの値を元に昇順で並べて取得するSQL文です。

Q7
SELECT name
FROM people
WHERE (gender = 2 AND age BETWEEN 20 AND 29)
OR (gender = 1 AND age BETWEEN 40 AND 49);

Q8
SELECT name, age
FROM people
WHERE department_id = 1
ORDER BY age ASC;

Q9
SELECT AVG(age) AS average_age
FROM people
WHERE department_id = 2 AND gender = 2;

Q10
SELECT p.name, d.name AS department_name, r.content AS report_content
FROM people p
JOIN departments d ON p.department_id = d.department_id
JOIN reports r ON p.person_id = r.person_id;

Q11
SELECT p.name
FROM people p
LEFT JOIN reports r ON p.person_id = r.person_id
WHERE r.report_id IS NULL;